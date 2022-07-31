import 'dart:math';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:soccer/RestApi.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../model/Meeting.dart';
import '../model/User.dart';
import '../provider/meeting_data.dart';
import 'Widget/CustomTF.dart';
import 'Widget/calendarList.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key? key, required this.ud}) : super(key: key);
  UserData ud;
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  TextEditingController eventNameController = TextEditingController();
  TextEditingController stimeController = TextEditingController();
  String stime = '';
  String etime = '';
  var _isChecked = false;
  var _saving = false;
  var _warnning = false;
  bool _isInit = true;
  bool _isLoading = false;
  late List<Meeting> events;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      RestApi().getEvents(widget.ud.email).then((value) =>
        setState(() {
          events = value;
          _isLoading = false;
        })
      );
    }
    _isInit = false;
    super.didChangeDependencies();
  }
  void onTaped(CalendarTapDetails details){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return AlertDialog(
                title: Container(child: Text(DateFormat('dd MMM')
                    .format(details.date!)
                    .toString() + " 일정 내용")),
                content: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: FutureBuilder<List<Meeting>>(
                    future: RestApi().getEvents(widget.ud.email),
                    builder: (context, snapshot) {
                    if (snapshot.hasData) {
                    return MeetList(
                      day: DateFormat('yyyy-MM-dd')
                          .format(details.date!)
                          .toString(),
                      meetList: snapshot.data as List<Meeting>,
                    );
                    }
                    return CircularProgressIndicator();})
                )
              );
            }
        );
      });
  }
  void longPressed(CalendarLongPressDetails calendarLongPressDetails) {
    showDialog(
        context: context,
        builder: (BuildContext context)
    {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            stime = DateFormat('yyyy-MM-dd')
                .format(calendarLongPressDetails.date!)
                .toString();
            etime = stime;
            return AlertDialog(
              title: Container(child: new Text(DateFormat('dd MMM')
                  .format(calendarLongPressDetails.date!)
                  .toString() + ", 일정 등록")),
              content: Column(
                children: [
                  CustomTF(label: "일정제목", tfcontroller: eventNameController),
                  _isChecked ? SizedBox() : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('시작시간', style: TextStyle(
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
                              hintStyle: TextStyle(fontSize: 18, color: Colors
                                  .black45),
                              errorStyle: TextStyle(color: Colors.redAccent),
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.event_note, color: Colors
                                  .green, size: 27,),
                            ),
                            mode: DateTimeFieldPickerMode.time,
                            autovalidateMode: AutovalidateMode.always,
                            onDateSelected: (DateTime value) {
                              String temp = DateFormat('yyyy-MM-dd')
                                  .format(calendarLongPressDetails.date!)
                                  .toString();
                              String temp2 = DateFormat('HH:mm:ss')
                                  .format(value)
                                  .toString();
                              stime = temp + " " + temp2;
                            },
                          ),
                        ),
                      ]
                  ),
                  _isChecked ? SizedBox() :Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('종료시간', style: TextStyle(
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
                              hintStyle: TextStyle(fontSize: 18, color: Colors
                                  .black45),
                              errorStyle: TextStyle(color: Colors.redAccent),
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.event_note, color: Colors
                                  .green, size: 27,),
                            ),
                            mode: DateTimeFieldPickerMode.time,
                            autovalidateMode: AutovalidateMode.always,
                            onDateSelected: (DateTime value) {
                              String temp = DateFormat('yyyy-MM-dd')
                                  .format(calendarLongPressDetails.date!)
                                  .toString();
                              String temp2 = DateFormat('HH:mm:ss')
                                  .format(value)
                                  .toString();
                              etime = temp + " " + temp2;
                            },
                          ),
                        ),
                      ]
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('하루종일'),
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                          activeColor: Colors.white,
                          checkColor: Colors.red,
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  _saving ? CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                    color: Colors.blue,
                  ) : SizedBox(),
                  _warnning ? Text("시간을 선택해주세요!", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),) : SizedBox(),
                ],
              ),
              actions: <Widget>[
                FlatButton(onPressed: () async {
                  if(_isChecked == false){
                    if(stime == DateFormat('yyyy-MM-dd')
                        .format(calendarLongPressDetails.date!)
                        .toString() || etime  == DateFormat('yyyy-MM-dd')
                        .format(calendarLongPressDetails.date!)
                        .toString()){
                      setState(() {
                        _saving = false;
                        _warnning = true;
                      });
                    }
                    else{
                      setState(() {
                        _saving = true;
                        _warnning = false;
                      });
                      Color _randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
                      await RestApi().SetEvent(widget.ud.email, eventNameController.text, stime, etime, _isChecked, _randomColor.value.toString());
                      Navigator.of(context).pop();
                    }
                  }
                  else{
                    setState(() {
                      _saving = true;
                      _warnning = false;
                    });
                    Color _randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
                    await RestApi().SetEvent(widget.ud.email, eventNameController.text, stime, etime, _isChecked, _randomColor.value.toString());
                    Navigator.of(context).pop();
                  }
                }, child: Text('저장')),
                FlatButton(onPressed: () {
                  Navigator.of(context).pop();
                }, child: Text('취소'))
              ],
            );
          }
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text("달력"),
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.white,)),
      ),
      body: _isLoading ? const Center(child: CircularProgressIndicator()) : SfCalendar(
        view: CalendarView.month,
        dataSource: MeetingDataSource(events),
        monthViewSettings: const MonthViewSettings(
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        onViewChanged: (ViewChangedDetails details) {
          List<DateTime> dates = details.visibleDates;
        },
        onTap: onTaped,
        onLongPress: longPressed,
      )
    );
  }
}