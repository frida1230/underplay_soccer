import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class togglebutton extends StatefulWidget {
  const togglebutton({Key? key}) : super(key: key);

  @override
  _togglebuttonState createState() => _togglebuttonState();
}

class _togglebuttonState extends State<togglebutton> {
  final List<bool> _isSelected = List.generate(4, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145.h,
      child: ToggleButtons(
        fillColor: Colors.indigo.shade900,
        children: const <Widget>[
          Icon(Icons.sunny, color:Colors.pink,),
          Icon(Icons.cloud, color:Colors.grey,),
          Icon(Icons.umbrella, color: Colors.lightBlue,),
          Icon(Icons.cloudy_snowing,color: Colors.lightGreenAccent,),
        ],
        onPressed: (int index) {
          setState(() {
            _isSelected[index] = !_isSelected[index];
            for(int i = 0 ; i < _isSelected.length;i++){
              if(i != index){
                _isSelected[i] = false;
              }
            }
          });
        },
        isSelected: _isSelected,
      ),
    );
  }
}