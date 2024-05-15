import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freebie/color_manager.dart';
import 'package:freebie/create_account_page.dart';
import 'package:freebie/repository/repository_impl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signIn() async {
    RepositoryImpl repository = RepositoryImpl();
    var user =
        await repository.signIn(emailController.text, passwordController.text);
    user.fold(
      (exception) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('exception is occurred: $exception'),
        ),
      ),
      (user) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User is signed in : ${user?.email}'),
          ),
        );
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CreateAccountPage()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f9fc),
      appBar: AppBar(
        leading: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: const Color(0xfff8f6f6))),
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
          'Continue with E-mail',
          style: TextStyle(
            color: titleColor,
            fontSize: 31,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context) * .05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height(context) * .1),
                  Text(
                    'E-MAIL',
                    style: TextStyle(
                      color: titleColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: const TextStyle(
                        color: Color(0xffCDCDD0),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Nunito',
                      ),
                      suffixIcon: emailController.text.isNotEmpty
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  emailController.clear();
                                });
                              },
                              child: SvgPicture.asset(
                                  'assets/images/removeicon.svg'),
                            )
                          : null,
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
                    'PASSWORD',
                    style: TextStyle(
                      color: titleColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      suffixIcon: passwordController.text.isNotEmpty
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  passwordController.clear();
                                });
                              },
                              child: SvgPicture.asset(
                                  'assets/images/removeicon.svg'),
                            )
                          : null,
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(
                        color: Color(0xffCDCDD0),
                        fontSize: 18,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w500,
                      ),
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height(context) * .03),
              const Text(
                'I forgot my password',
                style: TextStyle(
                    color: Color(0xff686873),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Nunito',
                    fontSize: 16),
              ),
              SizedBox(height: height(context) * .1),
              Column(
                children: [
                  Text(
                    "Don't have account? Let's create!",
                    style: TextStyle(
                      color: buttonColor,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: height(context) * .03),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(width(context) * .95, height(context) * .06),
                        backgroundColor: buttonColor),
                    onPressed: () {
                      signIn();
                    },
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
      ),
    );
  }
}
