import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveWrapper extends StatelessWidget {
  final Widget child;
  const ResponsiveWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MaxWidthBox(
      maxWidth: 2000,
      backgroundColor:  Colors.transparent,
      child: ResponsiveScaledBox(
        width: ResponsiveValue<double>(
          context,
          defaultValue: 2000,
          conditionalValues: [
            const Condition.equals(name: MOBILE, value: 450.0),
            const Condition.equals(name: DESKTOP, value: 2000),
          ],
        ).value,
        child: child,
      ),
    );
  }
}
