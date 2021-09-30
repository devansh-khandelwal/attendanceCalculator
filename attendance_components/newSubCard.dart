import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nsut_daily_app/attendance_components/percent_to_info.dart';
import 'package:nsut_daily_app/attendance_components/attendance_constants.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:nsut_daily_app/constants.dart';

class AttendanceCard extends StatelessWidget {
  final String courseCode;
  final String courseName;
  final double attendancePercentage;
  final int totClasses;
  final int present;
  final bool lastCourse;

  final double circularRadius = 14;
  final double sizedBoxHeight = 15;
  final double percentCircleRadius = 63;
  final double percentCircleLineWidth = 3;

  final gatherInfo = PercentToInfo();

  AttendanceCard({
    @required this.courseCode,
    @required this.courseName,
    @required this.attendancePercentage,
    @required this.totClasses,
    @required this.present,
    @required this.lastCourse,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
//
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
              //height: mainCardHeight,
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.black),
                color: kGrey,
                boxShadow: isdark ? darkShadow : lightShadow,
                borderRadius: BorderRadius.all(
                  Radius.circular(14),
                ),
              ),

              child: Column(
                children: [
                  Container(
                    // height: mainCardHeight,

                    margin: EdgeInsets.only(bottom: 0.0),
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: isdark?gatherInfo.getColorDark(
                              attendancePercentage, totClasses):gatherInfo.getColor(
                              attendancePercentage, totClasses),
                          borderRadius: BorderRadius.all(
                            Radius.circular(circularRadius),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: AutoSizeText(courseCode,
                                            style: kCourseCodeStyle),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0.0),
                                            child: AutoSizeText(
                                              courseName,
                                              style: kCourseNameStyle,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: CircularPercentIndicator(
                                  animation: true,
                                  radius: percentCircleRadius,
                                  lineWidth: percentCircleLineWidth,
                                  percent: attendancePercentage / 100,
                                  center: AutoSizeText(
                                    attendancePercentage.toString() + '%',
                                    style: kCoursePer,
                                  ),
                                  progressColor: Colors.white,
                                  backgroundColor: kNoColor,
                                ),
                                flex: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      gatherInfo.getComment(
                                          attendancePercentage,
                                          totClasses,
                                          present),
                                      style: kCommentStyle,
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
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: lastCourse ? 0.0 : sizedBoxHeight,
        ),
      ],
    );
  }
}
