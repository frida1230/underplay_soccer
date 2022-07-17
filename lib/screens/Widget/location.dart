import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class location extends StatelessWidget {
  const location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.location_pin,color: Colors.red,),
          labelText: '장소',
        ),
      ),
    );
  }
}
