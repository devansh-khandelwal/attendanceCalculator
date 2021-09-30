import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

dynamic createSession(String roll, String year, int semester) async {
  SharedPreferences _preffs = await SharedPreferences.getInstance();
  var url = _preffs.getString("attendance");
  var cookie = _preffs.getString("cookie");
  headers['Referer'] =url;
  headers['Cookie'] = cookie;
  http.Response attendanceResponse = await http.post(url, headers: headers, body: {
    "year": year,
    "sem": semester.toString(),
    "submit": "Submit",
    "recentitycode": roll,
  });
  if (attendanceResponse.statusCode == 200) {
    return parse(attendanceResponse.body);
  } else {
    print("Error: ${attendanceResponse.statusCode}");
  }
}
