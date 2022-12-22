// ignore_for_file: must_be_immutable, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:mountain_project/main_screen.dart';
import 'package:mountain_project/texts_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  var images = {
    "welcome-one.png":
        "Gives you a taste of the Canada mountains, from Horseshoe Bay in the north of Vancouver to Pemberton. ",
    "welcome-two.png":
        "Moraine Lake is yet another astonishing geographical location that you cannot afford to miss out on if you’re traveling along the Icefields Parkway",
    "welcome-three.png":
        "The Icefields Parkway offers you the picturesque panorama of Alberta’s most talked about mountain vistas. ",
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          onPageChanged: (index) {},
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'img/${images.keys.elementAt(index)}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: 'Trips'),
                        AppText(text: 'Mountain', size: 30),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 250,
                          child: AppText(
                            text: images.values.elementAt(index),
                            color: AppColors.textColor2,
                            size: 14,
                          ),
                        ),
                        const SizedBox(height: 40),
                        GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainScreen(),
                                )),
                            child: ResponsiveButton(width: 100)),
                      ],
                    ),
                    Column(
                      children: List.generate(
                        3,
                        (indexDots) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            width: 8,
                            height: index == indexDots ? 25 : 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == indexDots
                                    ? AppColors.mainColor
                                    : AppColors.mainColor.withOpacity(0.3)),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
