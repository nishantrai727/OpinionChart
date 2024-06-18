import 'package:flutter/material.dart';
import 'package:opinionchart/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final String text;
  final bool isLoading;
  final void Function(BuildContext) performTask;

  const CustomButton({
    super.key,
    required this.height,
    required this.width,
    required this.color,
    required this.text,
    required this.isLoading,
    required this.performTask,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: () {
          performTask(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: isLoading
            ? Container(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: AppColors.contrastColor,
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
      ),
    );
  }
}
