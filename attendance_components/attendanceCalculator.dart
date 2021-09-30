import 'package:flutter/material.dart';
//import 'package:nsut_daily_app/attendance_components/requestRemote.dart';
//import 'detailPageHelper.dart';
//import 'package:nsut_daily_app/screens/addTask.dart';
//import 'package:intl/intl.dart';
import 'package:nsut_daily_app/constants.dart';
//import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AttendanceCalculator extends StatefulWidget{
  final int present;
  AttendanceCalculator(this.present);
  @override
  _AttendanceCalculatorState createState() => _AttendanceCalculatorState(present);
}

class _AttendanceCalculatorState extends State<AttendanceCalculator> {
  final int present;

  _AttendanceCalculatorState(this.present);

  @override
  Widget build(BuildContext context){

    return SafeArea(
      child: Scaffold(
        backgroundColor: isdark ? darkBG : Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: kPink,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              AutoSizeText(
                                "Attendance Calculator",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color: isdark ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: isdark ? darkShadowTop : lightShadowTop,
                      color: isdark ? dark : Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 20.0, bottom: 20.0),
                      child: Column(
                        children: [

                        ],
                      ),
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