import 'package:flutter/cupertino.dart';
import '../theme/app_colors.dart';
class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(gradient: gradientBgColor),
    );
  }
}

class GradientBackground2 extends StatelessWidget {
  const GradientBackground2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(gradient: gradientBgColor2),
    );
  }
}