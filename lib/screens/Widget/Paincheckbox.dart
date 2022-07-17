import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';


class Paincheckbox extends StatefulWidget {
  final String type;
  const Paincheckbox({Key? key,required this.type}) : super(key: key);

  @override
  _PaincheckboxState createState() => _PaincheckboxState();
}

class _PaincheckboxState extends State<Paincheckbox> {
  var _isChecked = false;
  var _currentValue = 1;


  @override
  Widget build(BuildContext context) {
    return Container(
      child:Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Checkbox(
              activeColor: Colors.white,
              checkColor: Colors.red,
              value: _isChecked,
              onChanged: (newValue){
                setState(() {
                  _isChecked = !_isChecked;
                });
              }
          ),
          SizedBox(
            height: 97.h,
            width: 325.w,
            child: TextField(
              readOnly: !_isChecked,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: widget.type,
              ),
            ),
          ),
          SizedBox(
            height: 97.h,
            width: 325.w,
            child: NumberPicker(
              value: _currentValue,
              textStyle: const TextStyle(color: Colors.green,fontSize: 15,),
              axis: Axis.horizontal,
              step: 1,
              minValue: 1,
              maxValue: 10,
              onChanged: (value) => setState(() => _currentValue = value),

            ),
          ),
          Text('통증정도 : $_currentValue'),
        ],
      ),
    );
  }
}