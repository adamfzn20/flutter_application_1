import 'package:flutter/material.dart';
import '/resources/resources.dart';

///  default button on this project with primary color
///  change it as needed
class PrimaryButton extends StatelessWidget {
  /// first option to use widget inside the button
  final Widget? child;

  /// the option to change button color
  final Gradient? gradient;

  /// to add evelation to button
  final List<BoxShadow>? elevation;

  /// the width of the button.
  final double width;

  /// action function when button is onClick
  final void Function()? onPressed;

  /// The radius of the button shape
  final double? borderRadius;

  /// wether the button is can be clicked or not
  final bool enabled;

  final double marginHorizontal;

  /// this is the second option if the requirement only need a String inside the button
  final String title;

  /// for reversing only the color of the button including text if the code is using [title]
  final bool reverse;

  /// custom color
  final Color? customColor;

  // color text
  final Color? colorText;

  const PrimaryButton({
    super.key,
    required this.title,
    this.child,
    this.gradient,
    this.width = double.infinity,
    required this.onPressed,
    this.borderRadius,
    this.enabled = true,
    this.reverse = false,
    this.marginHorizontal = 0,
    this.elevation,
    this.customColor,
    this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(horizontal: marginHorizontal),
      decoration: BoxDecoration(
        gradient: gradient,
        boxShadow: elevation,
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
      ),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: enabled
                  ? MaterialStateProperty.all(
                      customColor ?? AppColors.colorPrimary)
                  : MaterialStateProperty.all(AppColors.grey),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8),
              ))),
          onPressed: enabled ? onPressed ?? () {} : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: child ??
                Text(
                  title.toString(),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: colorText ?? AppColors.surface,
                      ),
                ),
          )),
    );
  }
}
