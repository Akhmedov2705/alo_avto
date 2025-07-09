import 'package:alo_avto/assets/app_images.dart';
import 'package:alo_avto/core/extensions/context_extensions.dart';
import 'package:alo_avto/core/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  ValueNotifier<int> index = ValueNotifier<int>(0);

  List<String> text = [
    "Welcome to \nQent",
    """Lets Start
A New Experience
With Car rental.""",
  ];

  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = [context.images.on1, context.images.on2];
    return Scaffold(
      body: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: index,
            builder: (context, value, child) {
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 500), // Animatsiya davomiyligi
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: Container(
                  key: ValueKey<int>(value),
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePaths[value]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),

          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.velocity.pixelsPerSecond.dx > 0) {
                  index.value = 0;
                } else if (details.velocity.pixelsPerSecond.dx < 0) {
                  index.value = 1;
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 65.h),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.95),
                      Colors.black.withOpacity(0.85),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      context.images.logoWhite,
                      width: 74.w,
                      height: 74.h,
                    ),
                    50.height,
                    ValueListenableBuilder(
                      valueListenable: index,
                      builder: (context, value, child) {
                        return Text(
                          text[value],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: value == 0 ? 50.o : 40.o,
                          ),
                        );
                      },
                    ),
                    Spacer(),
                    ValueListenableBuilder(
                      valueListenable: index,
                      builder: (context, value, child) {
                        return SizedBox(
                          child: value == 1
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Discover your next adventure with Qent. we’re here to \nprovide you with a seamless car rental experience.\nLet’s get started on your journey.",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.o,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(),
                        );
                      },
                    ),
                    40.height,
                    TextButton(
                      style: TextButton.styleFrom(
                        fixedSize: Size(390.w, 62.h),
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xff21292B),
                      ),
                      onPressed: () {},
                      child: Text("Get Started"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
