import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freebie/register_page.dart';

import 'color_manager.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late PageController controller;
  int currentPageIndex = 0;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: const ClampingScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        children: [
          Stack(
            children: [
              Container(
                width: width(context),
                height: height(context),
                decoration: BoxDecoration(
                  gradient: backGroundGradient,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: width(context) * .05,
                  height: width(context) * .05,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white12),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: width(context) * .3,
                  height: width(context) * .3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white12),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: width(context) * .7,
                  height: width(context) * .7,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white12),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: width(context) * 1.1,
                  height: width(context) * 1.1,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white12),
                  ),
                ),
              ),
              Positioned(
                left: width(context) * .35,
                top: width(context) * .7,
                child: Image.asset('assets/images/avatar_man.png'),
              ),
              Positioned(
                left: width(context) * .45,
                top: width(context) * .6,
                child: SvgPicture.asset('assets/images/chat.svg'),
              ),
              Positioned(
                left: width(context) * .1,
                top: width(context) * .5,
                child: Image.asset('assets/images/avatar_woman.png'),
              ),
              Positioned(
                left: width(context) * .2,
                top: width(context) * .4,
                child: SvgPicture.asset('assets/images/chat.svg'),
              ),
              Positioned(
                left: width(context) * .7,
                top: width(context) * .3,
                child: Image.asset('assets/images/avatar.png'),
              ),
              Positioned(
                left: width(context) * .4,
                top: width(context) * .2,
                child: SvgPicture.asset('assets/images/chat.svg'),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: width(context) * .03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Create \nGood Habits',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Change your life by slowly adding new healty habits and \nsticking to them.',
                        style:
                            TextStyle(color: Color(0xffF6EEEB), fontSize: 15,fontFamily: 'Nunito',),
                      ),
                      SizedBox(height: height(context) * .05),
                      Container(
                        width: width(context) * .15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width(context) * .018,
                              height: width(context) * .018,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              width: width(context) * .018,
                              height: width(context) * .018,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: buttonColor,
                              ),
                            ),
                            Container(
                              width: width(context) * .018,
                              height: width(context) * .018,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: buttonColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height(context) * .05),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(width(context) * .95, height(context) * .06),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()));
                        },
                        child: Row(
                          children: [
                            Image.asset('assets/images/right.png'),
                            Text(
                              'Continue with E-mail',
                              style: TextStyle(
                                color: titleColor,
                                fontSize: 20,
                                fontFamily: 'Nunito',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height(context) * .02),
                      Container(
                        width: width(context) * .95,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(width(context) * .17,
                                    height(context) * .05),
                              ),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Image.asset('assets/images/Apple.png'),
                                  Text(
                                    'Apple',
                                    style: TextStyle(
                                      color: titleColor,
                                      fontSize: 20,
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(width(context) * .17,
                                    height(context) * .05),
                              ),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Image.asset('assets/images/Google.png'),
                                  Text(
                                    'Google',
                                    style: TextStyle(
                                      color: titleColor,
                                      fontSize: 20,
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(width(context) * .17,
                                    height(context) * .05),
                              ),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Image.asset('assets/images/facebook.png'),
                                  Text(
                                    'Facebook',
                                    style: TextStyle(
                                      color: titleColor,
                                      fontSize: 20,
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height(context) * .02),
                      SizedBox(
                        width: width(context) * .95,
                        child: const Text(
                          textAlign: TextAlign.center,
                          'By continuing you agree Terms of Services & Privacy Policy ',
                          style: TextStyle(
                            color: Color(0xffE7CCC0),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ),
                      SizedBox(height: height(context) * .02),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                width: width(context),
                height: height(context),
                decoration: BoxDecoration(
                  gradient: backGroundGradient,
                ),
              ),
              Positioned(
                top: 100,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: width(context) * .03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Challenges',
                        style: TextStyle(color: Colors.white, fontSize: 17,fontFamily: 'Nunito',),
                      ),
                      Container(
                        width: width(context) * .95,
                        height: height(context) * .1,
                        child: Image.asset(
                          'assets/images/card.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Text(
                        'Habits',
                        style: TextStyle(color: Colors.white, fontSize: 17,fontFamily: 'Nunito',),
                      ),
                      Container(
                        width: width(context) * .95,
                        height: height(context) * .1,
                        child: Image.asset(
                          'assets/images/card.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        width: width(context) * .95,
                        height: height(context) * .1,
                        child: Image.asset(
                          'assets/images/card.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: width(context) * .03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Track \nYour Progress',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Everyday you become one step closer to \nyour goal. Don\'t give up!',
                        style:
                            TextStyle(color: Color(0xffF6EEEB), fontSize: 15,fontFamily: 'Nunito',),
                      ),
                      SizedBox(height: height(context) * .05),
                      Container(
                        width: width(context) * .15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width(context) * .018,
                              height: width(context) * .018,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: buttonColor,
                              ),
                            ),
                            Container(
                              width: width(context) * .018,
                              height: width(context) * .018,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              width: width(context) * .018,
                              height: width(context) * .018,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: buttonColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height(context) * .05),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(width(context) * .95, height(context) * .06),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()));
                        },
                        child: Row(
                          children: [
                            Image.asset('assets/images/right.png'),
                            Text(
                              'Continue with E-mail',
                              style: TextStyle(
                                color: titleColor,
                                fontSize: 20,
                                fontFamily: 'Nunito',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height(context) * .02),
                      Container(
                        width: width(context) * .95,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(width(context) * .17,
                                    height(context) * .05),
                              ),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Image.asset('assets/images/Apple.png'),
                                  Text(
                                    'Apple',
                                    style: TextStyle(
                                      color: titleColor,
                                      fontFamily: 'Nunito',
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(width(context) * .17,
                                    height(context) * .05),
                              ),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Image.asset('assets/images/Google.png'),
                                  Text(
                                    'Google',
                                    style: TextStyle(
                                      color: titleColor,
                                      fontFamily: 'Nunito',
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(width(context) * .17,
                                    height(context) * .05),
                              ),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Image.asset('assets/images/facebook.png'),
                                  Text(
                                    'Facebook',
                                    style: TextStyle(
                                      color: titleColor,
                                      fontFamily: 'Nunito',
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height(context) * .02),
                      SizedBox(
                        width: width(context) * .95,
                        child: const Text(
                          textAlign: TextAlign.center,
                          'By continuing you agree Terms of Services & Privacy Policy ',
                          style: TextStyle(
                            color: Color(0xffE7CCC0),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ),
                      SizedBox(height: height(context) * .02),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
