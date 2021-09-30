import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsut_daily_app/constants.dart';

Color kGreen = isdark ? Color(0xFF0BA484) : Color(0xFF6FCF97);
Color kRed = Color(0xffeb5757);
Color kGrey = Color(0xFFECEDF5);
Color kNoColor = Color(0x00FFFFFF);

final codesExplainedStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
    color: kPink,
    fontWeight: FontWeight.w500,
    fontSize: 20,
  ),
);

final keyOfCodesStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
    color: isdark ? Colors.white : Colors.black87,
    fontWeight: FontWeight.w300,
    fontSize: 15,
  ),
);

final kHeadingStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
    fontSize: 28,
    color: isdark ? Colors.white : Colors.black,
    fontWeight: FontWeight.w600,
  ),
);

final kCourseCodeStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  ),
);

final kCourseNameStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 15,
  ),
);

final kCoursePer = GoogleFonts.montserrat(
  textStyle: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  ),
);

final kCommentStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
    color: Colors.black,
    //fontWeight: FontWeight.bold,
    fontSize: 12,
  ),
);

final kSemesterStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
    color: isdark ? Colors.white : Colors.black,
    //fontWeight: FontWeight.bold,
    fontSize: 17,
  ),
);
