import 'package:alo_avto/core/extensions/context_extensions.dart';
import 'package:alo_avto/core/extensions/size_extensions.dart';
import 'package:alo_avto/core/widgets/w_textbutton.dart';
import 'package:alo_avto/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

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
                                    20.height,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        DecoratedBox(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              100,
                                            ),
                                            color: Color(0xff9CA3AF),
                                          ),
                                          child: SizedBox(
                                            height: 8.h,
                                            width: 8.h,
                                          ),
                                        ),
                                        10.width,
                                        DecoratedBox(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              100,
                                            ),
                                            color: Color(0xff9CA3AF),
                                          ),
                                          child: SizedBox(
                                            height: 8.h,
                                            width: 25.w,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : SizedBox(),
                        );
                      },
                    ),
                    40.height,
                    CustomTextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      text: "Get Started",
                      textColor: Colors.white,
                      backgroundColor: Color(0xff21292B),
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
