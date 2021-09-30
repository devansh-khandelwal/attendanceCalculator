import 'package:flutter/cupertino.dart';
import 'attendance_constants.dart';

class PercentToInfo {
  Color getColor(double percentage, int totClasses) {
    if(totClasses == 0) {
      return kGreen;
    }
    return percentage >= 75 ? kGreen : kRed;
  }
  Color getColorDark(double percentage, int totClasses) {
    if(totClasses == 0) {
      return Color(0xFF0BA484) ;
    }
    return percentage >= 75 ? Color(0xFF0BA484)  : kRed;
  }

  Color detailCardColor(int overallPresent, int totClasses) {
    if(totClasses==0){
      return kGreen;
    }
    double percentage = (overallPresent / totClasses) * 100;
    return percentage >= 75 ? kGreen : kRed;
  }
  Color detailCardColorDark(int overallPresent, int totClasses) {
    if(totClasses==0){
      return Color(0xFF0BA484);
    }
    double percentage = (overallPresent / totClasses) * 100;
    return percentage >= 75 ? Color(0xFF0BA484) : kRed;
  }

  String getComment(double percentage, int totClasses, int present) {
    if(totClasses == 0) {
      return 'No classes held';
    }
    if (percentage >= 75) {
      return 'Already in safe zone, take a nap';
    } else {
      present = ((percentage * totClasses) / 100).round();
      int reqdClasses = (3 * totClasses) - (4 * present);

      if(reqdClasses==1) {
        return 'Attend ' +
            reqdClasses.toString() +
            ' more class to enter safe zone';
      } else {
        return 'Attend ' +
            reqdClasses.toString() +
            ' more classes to enter safe zone';

      }

    }
  }
}
