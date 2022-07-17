import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 520.w,
      height: 246.h,
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: DateTimeFormField(
        dateTextStyle: TextStyle(fontSize: 15),
        decoration: const InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.all(5),
          hintStyle: TextStyle(fontSize: 18, color: Colors.black45),
          errorStyle: TextStyle(color: Colors.redAccent),
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.event_note, color: Colors.green,size: 27,),
          labelStyle: TextStyle(fontSize: 16),
          labelText: '훈련 날짜&시간',
        ),
        mode: DateTimeFieldPickerMode.dateAndTime,
        autovalidateMode: AutovalidateMode.always,
        validator: (e) =>
        (e?.day ?? 0) == 1
            ? 'Please not the first day'
            : null,
        onDateSelected: (DateTime value) {
          print(value);
        },
      ),
    );
  }
}

