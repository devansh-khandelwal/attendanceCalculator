import 'package:flutter/material.dart';
import 'package:nsut_daily_app/attendance_components/percent_to_info.dart';
import 'package:nsut_daily_app/attendance_components/attendance_constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:nsut_daily_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsut_daily_app/attendance_components/attendanceCalculator.dart';
Color kRed = Color(0xffeb5757);

class CourseName extends StatelessWidget {
  final String courseName;

  CourseName({@required this.courseName});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AutoSizeText(
            courseName,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: isdark ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),

//            TextStyle(
//                fontWeight: FontWeight.w500, fontSize: 24, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class ClassesAttendedDynamic extends StatelessWidget {
  final int overallPresent;
  final int totClasses;

  ClassesAttendedDynamic({
    @required this.overallPresent,
    @required this.totClasses,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),

      child: Column(
        children:[
          InkWell(
            onTap: (){
              print('hello');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AttendanceCalculator(overallPresent))
              );
            },
          child: Container(
            padding: const EdgeInsets.all(15.0),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: kRed,
            //color: isdark?PercentToInfo().detailCardColorDark(overallPresent, totClasses):PercentToInfo().detailCardColor(overallPresent, totClasses),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: isdark ? darkShadow : lightShadow,
            ),
            width: MediaQuery.of(context).size.width * 0.7,
            child: Center(
              child: AutoSizeText(
              'Attendance Calculator',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),),
          ),
        ),
              //child: TextButton(
                //onPressed: (){},
                //style: ButtonStyle(
                  //foregroundColor: MaterialStateProperty.all<Color>(kRed),
                //),
              //)
          ),
          Container(
          padding: const EdgeInsets.all(15.0),
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: isdark?PercentToInfo().detailCardColorDark(overallPresent, totClasses):PercentToInfo().detailCardColor(overallPresent, totClasses),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: isdark ? darkShadow : lightShadow,
          ),
          width: MediaQuery.of(context).size.width * 0.7,
          child: Center(
            child: AutoSizeText(
              '$overallPresent ' +
                  'of' +
                  ' $totClasses ' +
                  'classes attended. ',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          )),
    ]));
  }
}

class keyOfCodesComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            // height: MediaQuery.of(context).size.height*0.7,
            child: Column(
              children: [
                Center(
                    child: AutoSizeText(
                  'Notations',
                  style: codesExplainedStyle,
                )),
                Divider(
                  color: isdark ? Colors.white : Colors.black,
                  height: 20,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
                NotationText(text: 'CR - Class Rescheduled'),
                NotationText(text: 'CS - Class suspended Officially'),
                NotationText(text: 'GH - Gazetted Holiday'),
                NotationText(text: 'MB - Mass Bunk'),
                NotationText(text: 'MS - Mid Sem Exam'),
                NotationText(text: 'NA - Timetable Not Allotted'),
                NotationText(text: 'NT - Class Not Taken'),
                NotationText(text: 'OD - Teacher on Official duty'),
                NotationText(text: 'TL - Teacher on Leave'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NotationText extends StatelessWidget {
  final String text;

  NotationText({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    // height: mainCardHeight,

                    margin: EdgeInsets.only(bottom: 0.0),
                    child: InkWell(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 6, 8, 0),
                                child: Icon(
                                  Icons.fiber_manual_record,
                                  color: isdark ? Colors.white : Colors.black,
                                  size: 7,
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0.0, vertical: 0.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: AutoSizeText(text,
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                color: isdark ? Colors.white : Colors.black87,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 15,
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DateCard extends StatelessWidget {
  final String date;
  final String day;
  final String attendance;
  DateCard(
      {@required this.date, @required this.day, @required this.attendance});
  @override
  Widget build(BuildContext context) {
    var k = attendance.split("+");
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 8.0, bottom: 16.0),
      child: Stack(
        children: [
//
          Container(
            //height: mainCardHeight,
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.black),
              boxShadow: isdark ? darkShadow : lightShadow,
              color: kPink.withOpacity(0.8),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),

            child: Container(
              // height: mainCardHeight,

              margin: EdgeInsets.only(left: 12.0),
              child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    color: isdark ? dark : Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 150,
                                  child: AutoSizeText(
                                    date,
                                    style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        color: isdark
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 0.0),
                                      child: AutoSizeText(
                                        day,
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            color: isdark
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              for (var item in k)
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: (item == "1" || item == "0")
                                        ? Icon(
                                            item == "1"
                                                ? Icons.check
                                                : Icons.close,
                                            size: 32.0,
                                            color: item == "1" ? kGreen : kRed,
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: isdark
                                                          ? Colors.white
                                                          : Colors.black)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: AutoSizeText(
                                                  item,
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
