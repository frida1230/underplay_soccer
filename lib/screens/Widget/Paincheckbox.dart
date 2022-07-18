
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



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
            height: 95.h,
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
            width: 15.w,
          ),
          SizedBox(
            width: 300.w,
            child: ElevatedButton(
              child: const Text('통증 레벨'),
              onPressed: () => showMaterialNumberPicker(
                context: context,
                title: '통증',
                headerColor: Colors.green[600],
                maxNumber: 10,
                minNumber: 1,
                step: 1,
                confirmText: '확인',
                cancelText: '취소',
                selectedNumber: _currentValue,
                onChanged: (value) => setState(() => _currentValue = value),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green[600],
              ),
            ),
          ),
          Expanded(
            child: Text('통증정도 : $_currentValue',
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}