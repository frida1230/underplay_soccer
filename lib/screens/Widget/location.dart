import 'package:flutter/material.dart';

class location extends StatelessWidget {
  const location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
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
