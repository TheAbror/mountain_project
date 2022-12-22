import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  AppLargeText({
    Key? key,
    this.size = 30,
    required this.text,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style:
          TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  AppText(
      {Key? key,
      this.size = 16,
      required this.text,
      this.color = Colors.black54})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}

class AppColors {
  static const Color textColor1 = Color(0xFF989acd);
  static const Color textColor2 = Color(0xFF878593);
  static const Color bigTextColor = Color(0xFF2e2e31);
  static const Color mainColor = Color(0xFF5d69b3);
  static const Color starColor = Color(0xFFe7bb4e);
  static const Color mainTextColor = Color(0xFFababad);
  static const Color buttonBackground = Color(0xFFf1f1f9);
}

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.width = 120, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isResponsive == true ? double.maxFinite : width,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.mainColor),
      child: Row(
        mainAxisAlignment: isResponsive == true
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          isResponsive == true
              ? Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: AppText(text: "Book Trip Now", color: Colors.white))
              : Container(),
          Image.asset("img/button-one.png"),
        ],
      ),
    );
  }
}
