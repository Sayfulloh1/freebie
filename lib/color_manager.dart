import 'package:flutter/material.dart';

LinearGradient backGroundGradient =  LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    const Color(0xffEF88ED),
    const Color(0xffBB7BE9).withOpacity(.23),
    const Color(0xff7269E3).withOpacity(.54),
    const Color(0xff8350DB),
  ],
);


Color buttonColor = const Color(0xff553B59);
Color titleColor = const Color(0xff040415);
Color subtitleColor = const Color(0xff9B9BA1);
Color passwordHintColor = const Color(0xffCDCDD0);
Color forgotPasswordTitleColor = const Color(0xff686873);



width(BuildContext context){
  return MediaQuery.of(context).size.width;
}
height(BuildContext context){
  return MediaQuery.of(context).size.height;
}