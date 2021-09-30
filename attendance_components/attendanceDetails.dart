import 'package:flutter/material.dart';
import 'package:nsut_daily_app/attendance_components/requestRemote.dart';
import 'detailPageHelper.dart';
import 'package:nsut_daily_app/screens/addTask.dart';
import 'package:intl/intl.dart';
import 'package:nsut_daily_app/constants.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AttendanceDetail extends StatefulWidget {
  final String courseName;
  final int present;
  final int totClasses;
  final int index;
  final String roll;
  final String year;
  final int semester;
  AttendanceDetail(this.courseName, this.present, this.totClasses, this.index,
      this.roll, this.year, this.semester);
  @override
  _AttendanceDetailState createState() => _AttendanceDetailState(
      courseName, present, totClasses, index, roll, year, semester);
}

class _AttendanceDetailState extends State<AttendanceDetail> {
  final String course;
  final int present;
  final int totClasses;
  final int index;
  final String roll;
  final String year;
  final int semester;

  _AttendanceDetailState(this.course, this.present, this.totClasses, this.index,
      this.roll, this.year, this.semester);

  Map mapAttendance = new Map();

  @override
  void initState() {
    super.initState();
  }

  _fetchData() async {
    if(attendanceData==null) attendanceData = await createSession(this.roll, this.year, this.semester);

    mapAttendance = new Map();

    var monthWise = attendanceData.getElementsByClassName("plum_fieldbig");
    monthWise.removeAt(0);

//    getting whole attendance data
    for (int i = 0; i < monthWise.length - 3; i++) {
      var allDatesData = monthWise[i].getElementsByTagName("tr");
      for (int dateIndex = 2;
          dateIndex < allDatesData.length - 4;
          dateIndex++) {
        var rowData = allDatesData[dateIndex].getElementsByTagName("td");
        var rowDate = rowData[0];
        if (rowData[index + 1].text != "") {
          mapAttendance[rowDate.text] = rowData[index + 1].text;
        }
      }
    }
//    last month extra data
    var allTableRows =
        monthWise[monthWise.length - 3].getElementsByTagName("tr");
    for (int dateIndex = 2; dateIndex < allTableRows.length - 8; dateIndex++) {
      var rowData = allTableRows[dateIndex].getElementsByTagName("td");
      if (rowData.length == 1) {
        break;
      }
      var rowDate = rowData[0];
      if (rowData[index + 1].text != "") {
        mapAttendance[rowDate.text] = rowData[index + 1].text;
      }
    }

    return mapAttendance;
  }

  @override
  Widget build(BuildContext context) {
    var dateMap = {
      'Jan': 'January',
      'Feb': 'February',
      'Mar': 'March',
      'Apr': 'April',
      'May': 'May',
      'Jun': 'June',
      'Jul': 'July',
      'Aug': 'August',
      'Sep': 'September',
      'Oct': 'October',
      'Nov': 'November',
      'Dec': 'December'
    };
    var monthIndex = {
      'Jan': 1,
      'Feb': 2,
      'Mar': 3,
      'Apr': 4,
      'May': 5,
      'Jun': 6,
      'Jul': 7,
      'Aug': 8,
      'Sep': 9,
      'Oct': 10,
      'Nov': 11,
      'Dec': 12,
    };
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
                          child: Center(child: CourseName(courseName: course)),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) {
                                  return keyOfCodesComponent();
                                });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Icon(
                              Icons.info_outline,
                              color: kPink,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
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
                          ClassesAttendedDynamic(
                              overallPresent: present, totClasses: totClasses),
                          Expanded(
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              child: FutureBuilder(
                                future: _fetchData(),
                                builder:
                                    (context, AsyncSnapshot<dynamic> snapshot) {
                                  if (snapshot.data == null) {
                                    return Center(
                                        child: CircularProgressIndicator(
                                      backgroundColor:
                                          isdark ? darkBG : Colors.white,
                                      valueColor:
                                          AlwaysStoppedAnimation<Color>(kPink),
                                    ));
                                  }
                                  return ListView.builder(
                                      itemCount: mapAttendance.length,
                                      itemBuilder: (BuildContext ctxt, int i) {
                                        int len = mapAttendance.length;
                                        var keys = mapAttendance.keys.toList();
                                        var modifiedDate =
                                            keys[len - i - 1].split("-");
                                        var year = this.year;
                                        var modifiedYear = year.split("-");
                                        var currYear;
                                        if (month.toInt() <= 12 &&
                                            month.toInt() >= 8)
                                          currYear = int.parse(modifiedYear[0]);
                                        else
                                          currYear = int.parse(year[0] +
                                              year[1] +
                                              modifiedYear[1]);
                                        DateTime date = DateTime(
                                            currYear,
                                            monthIndex[modifiedDate[0]],
                                            int.parse(modifiedDate[1]));
                                        return AnimationConfiguration
                                            .staggeredList(
                                          position: i,
                                          duration:













                                              const Duration(milliseconds: 375),
                                          child: SlideAnimation(
                                            verticalOffset: 50.0,
                                            child: FadeInAnimation(
                                                child: DateCard(
                                                    date: modifiedDate[1] +
                                                        ' ' +
                                                        dateMap[
                                                            modifiedDate[0]],
                                                    day: DateFormat('EEEE')
                                                        .format(date),
                                                    attendance: mapAttendance[
                                                        keys[len - i - 1]])),
                                          ),
                                        );
                                      });
                                },
                              ),
                            ),
                          ),
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
