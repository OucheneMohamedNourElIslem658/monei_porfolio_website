import 'package:flutter/material.dart';
import 'package:monei_portfolio/commun/constents/colors.dart';

class TextStyles {
  static const style1 = TextStyle(
    fontFamily: TextFonts.firaBold,
    fontSize: 16,
    color: Colors.white
  );
  static const style2 = TextStyle(
    fontFamily: TextFonts.firaMed,
    fontSize: 16,
    color: Colors.white
  );
  static const style3 = TextStyle(
    fontFamily: TextFonts.firaReg,
    fontSize: 16,
    color: CustomColors.purple1
  );
  static const style4 = TextStyle(
    fontFamily: TextFonts.firaSemiBold,
    fontSize: 32,
    color: Colors.white
  );
  static const style5 = TextStyle(
    fontFamily: TextFonts.firaMed,
    fontSize: 32,
    color: Colors.white
  );
  static const style6 = TextStyle(
    fontFamily: TextFonts.firaMed,
    fontSize: 24,
    color: Colors.white
  );
}

class TextFonts {
  static const firaReg = "fira_regular";
  static const firaMed = "fira_medium";
  static const firaBold = "fira_bold";
  static const firaSemiBold = "fira_semi_bold";
}