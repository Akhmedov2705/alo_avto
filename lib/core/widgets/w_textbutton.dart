import 'package:alo_avto/core/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String? text; // Matn (null bo'lishi mumkin)
  final VoidCallback?
  onPressed; // Bosilganda ishlaydigan funksiya (null bo'lishi mumkin)
  final Color? backgroundColor; // Fond rangi (null bo'lishi mumkin)
  final Color? textColor; // Matn rangi (null bo'lishi mumkin)
  final double? width; // Kenglik (null bo'lishi mumkin)
  final double? height; // Balandlik (null bo'lishi mumkin)
  final double? borderRadius; // Burchak radiusi (null bo'lishi mumkin)
  final TextStyle? textStyle; // Matn stili (null bo'lishi mumkin)

  const CustomTextButton({
    super.key,
    this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.borderRadius,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 390.w,
      height: height ?? 62.h,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 100),
          ),
          elevation: 0,
        ),
        child: Text(
          text ?? 'Get Started',
          style:
              textStyle ??
              TextStyle(
                color: textColor ?? Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
