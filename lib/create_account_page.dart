import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'color_manager.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
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
      backgroundColor: Color(0xfff0f9fc),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Color(0xfff8f6f6))),
          child: IconButton(
            icon: const Icon(
              CupertinoIcons.chevron_left,
              size: 19,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          'Create Account',
          style: TextStyle(
            color: titleColor,
            fontSize: 31,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito',
          ),
        ),
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        physics: ClampingScrollPhysics(),
        children: [
          PageIndex0(
            ontap: () {
              controller.animateToPage(1,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceOut);
            },
          ),
          PageIndex1(
            ontap: () {
              controller.animateToPage(2,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceOut);
            },
          ),
          PageIndex2(
            ontap: () {

            },
          ),
        ],
      ),
    );
  }
}

class PageIndex2 extends StatefulWidget {
  const PageIndex2({
    super.key, required this.ontap,
  });
  final VoidCallback ontap;

  @override
  State<PageIndex2> createState() => _PageIndex2State();
}

class _PageIndex2State extends State<PageIndex2> {
  final List<HabitItem> habits = [
    HabitItem(icon: Icons.directions_run, title: 'Run'),
    HabitItem(icon: Icons.pool, title: 'Swim'),
    HabitItem(icon: Icons.book, title: 'Read Books'),
    HabitItem(icon: Icons.local_drink, title: 'Drink Water'),
    HabitItem(icon: Icons.mediation, title: 'Meditate'),
    HabitItem(icon: Icons.menu_book_rounded, title: 'Study'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width(context) * .05),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height(context) * .03),
                Text(
                  'Choose your first habits',
                  style: TextStyle(
                    color: titleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: 'Nunito',
                  ),
                ),
                Text(
                  'You may add more habits later',
                  style: TextStyle(
                    color: titleColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    fontFamily: 'Nunito',
                  ),
                ),
                SizedBox(height: height(context) * .03),
                GridView.count(
                  shrinkWrap: true,
                  // Wrap the GridView's height
                  physics: const NeverScrollableScrollPhysics(),
                  // Disable scrolling
                  crossAxisCount: 2,
                  // Two columns in the grid
                  mainAxisSpacing: 10.0,
                  // Spacing between rows
                  crossAxisSpacing: 10.0,
                  // Spacing between columns
                  children:
                      habits.map((habit) => _HabitCard(habit: habit)).toList(),
                ),
                SizedBox(height: height(context) * .05),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(width(context) * .95, height(context) * .06),
                    backgroundColor: buttonColor,
                  ),
                  onPressed: widget.ontap,
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Nunito',
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HabitItem {
  final IconData icon;
  final String title;

  HabitItem({required this.icon, required this.title});
}

class _HabitCard extends StatelessWidget {
  final HabitItem habit;

  const _HabitCard({required this.habit});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(habit.icon, size: 40.0, color: Colors.blue),
            SizedBox(height: 10.0),
            Text(habit.title, style: TextStyle(fontSize: 18.0)),
          ],
        ),
      ),
    );
  }
}

class PageIndex1 extends StatefulWidget {
  const PageIndex1({
    super.key, required this.ontap,
  });
  final VoidCallback ontap;
  @override
  State<PageIndex1> createState() => _PageIndex1State();
}

class _PageIndex1State extends State<PageIndex1> {
  int selectedGender = 0;

  // 0: None, 1: Male, 2: Female
  void handleCardTap(int index) {
    setState(() {
      selectedGender = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context) * .05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height(context) * .03),
                      Text(
                        'Choose your gender',
                        style: TextStyle(
                          color: titleColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // Even spacing
                    children: [
                      GestureDetector(
                        onTap: () => handleCardTap(1),
                        child: Container(
                          width: width(context) * .4,
                          height: width(context) * .4,
                          child: Card(
                            color: selectedGender == 1
                                ? Colors.blue
                                : Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/male.png'),
                                  const SizedBox(height: 8.0),
                                  Text('Male'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => handleCardTap(2),
                        child: Container(
                          width: width(context) * .4,
                          height: width(context) * .4,
                          child: Card(
                            color: selectedGender == 2
                                ? Colors.pink
                                : Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/female.png'),
                                  const SizedBox(height: 8.0),
                                  Text('Female'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height(context) * .2,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(width(context) * .95, height(context) * .06),
                        backgroundColor: buttonColor),
                    onPressed:widget.ontap,
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Nunito',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

class PageIndex0 extends StatefulWidget {
  final VoidCallback ontap;

  const PageIndex0({super.key, required this.ontap});

  @override
  State<PageIndex0> createState() => _PageIndex0State();
}

class _PageIndex0State extends State<PageIndex0> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context) * .05),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height(context) * .03),
                      Text(
                        'Name',
                        style: TextStyle(
                          color: titleColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          hintStyle: const TextStyle(
                            color: Color(0xffCDCDD0),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Nunito',
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                                'assets/images/removeicon.svg'),
                          ),
                          border: const UnderlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height(context) * .03),
                      Text(
                        'Surname',
                        style: TextStyle(
                          color: titleColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your surname',
                          hintStyle: const TextStyle(
                            color: Color(0xffCDCDD0),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Nunito',
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                                'assets/images/removeicon.svg'),
                          ),
                          border: const UnderlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height(context) * .03),
                      Text(
                        'Birthdate',
                        style: TextStyle(
                          color: titleColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'mm/dd/yyyy',
                          hintStyle: const TextStyle(
                            color: Color(0xffCDCDD0),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Nunito',
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                                'assets/images/removeicon.svg'),
                          ),
                          border: const UnderlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height(context) * .1,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(width(context) * .95, height(context) * .06),
                        backgroundColor: buttonColor),
                    onPressed: widget.ontap,
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Nunito',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
