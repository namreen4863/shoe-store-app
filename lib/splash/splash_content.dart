import 'package:flutter/material.dart';
import 'size_config.dart';
import 'constants.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "SHOE PALACE",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(27),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image!,
          height: getProportionateScreenHeight(210),
          width: getProportionateScreenWidth(300),
        ),
      ],
    );
  }
}
