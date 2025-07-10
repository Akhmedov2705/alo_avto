import 'package:alo_avto/core/dio_client/dio_client.dart';
import 'package:alo_avto/core/extensions/size_extensions.dart';
import 'package:alo_avto/features/auth/data/datasource/auth_datasource.dart';
import 'package:alo_avto/features/auth/data/repository/auth_repository.dart';
import 'package:alo_avto/features/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:alo_avto/features/splash/presentation/screens/onboarding_screen.dart';
import 'package:alo_avto/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height / 932;
    width = MediaQuery.of(context).size.width / 430;
    arithmetic = (height + width) / 2;
    return BlocProvider(
      create: (context) => AuthBloc(
        repository: AuthRepository(
          datasource: AuthDatasource(dio: DioClient()),
        ),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
