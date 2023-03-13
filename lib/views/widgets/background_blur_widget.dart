/*                                     *\
          **File Created By**
      name:- Shuoib Hossain Badon
      time:- Mar 23, 2022 4:48 PM
      contract:-shuibe873@gmail.com
\*                                     */

import 'dart:ui';
import 'package:flutter/material.dart';

class BackgroundBlurWidget extends StatelessWidget {
  final Widget child;
  final double? sigmaX;
  final double? sigmaY;

  const BackgroundBlurWidget(
      {Key? key, required this.child, this.sigmaX, this.sigmaY})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: sigmaX ?? 2, sigmaY: sigmaY ?? 2),
      child: child,
    );
  }
}
