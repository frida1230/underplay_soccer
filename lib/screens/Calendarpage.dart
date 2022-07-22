import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../model/Meeting.dart';
import '../provider/meeting_data.dart';
import 'Widget/CustomTF.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  TextEditingController eventNameController = TextEditingController();
  TextEditingController stimeController = TextEditingController();
  String stime = '';

  void longPressed(CalendarLongPressDetails calendarLongPressDetails) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:Container(child: new Text(DateFormat('dd MMM')
                .format(calendarLongPressDetails.date!)
                .toString() + ", Add Event")),
            content:Column(
              children: [
                CustomTF(label: "Subject", tfcontroller: eventNameController),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('시작시간',style:TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87
                    ),),
                    Container(
                      height: 246.h,
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: DateTimeFormField(
                        dateTextStyle: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(5),
                          hintStyle: TextStyle(fontSize: 18, color: Colors.black45),
                          errorStyle: TextStyle(color: Colors.redAccent),
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.event_note, color: Colors.green,size: 27,),
                        ),
                        mode: DateTimeFieldPickerMode.time,
                        autovalidateMode: AutovalidateMode.always,
                        onDateSelected: (DateTime value) {
                          stime = value.toString();
                        },
                      ),
                    ),
                  ]
                ),
                SizedBox(height: 5,),

                CustomTF(label: "Password",tfcontroller: stimeController),
              ],
            ),
            actions: <Widget>[
              new FlatButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: new Text('close'))
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfCalendar(
          view: CalendarView.month,
          dataSource: MeetingDataSource(_getDataSource()),
          monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
          onViewChanged: (ViewChangedDetails details) {
            List<DateTime> dates = details.visibleDates;
          },
          onLongPress: longPressed,
        ));
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
}