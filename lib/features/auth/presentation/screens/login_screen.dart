import 'package:alo_avto/features/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:alo_avto/features/auth/presentation/bloc/login_bloc/login_event.dart';
import 'package:alo_avto/features/auth/presentation/bloc/login_bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Scaffold(appBar: AppBar(title: Text("Home"))),
                ),
              );
            }
            if (state is AuthFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.failure.message)));
            }
          },
          builder: (context, state) {
            return TextButton(
              onPressed: () {
                if (state is! AuthFailure) {
                  context.read<AuthBloc>().add(
                    AuthLoginEvent(username: "username", password: "password"),
                  );
                }
              },
              child: Text("Login"),
            );
          },
        ),
      ),
    );
  }
}
