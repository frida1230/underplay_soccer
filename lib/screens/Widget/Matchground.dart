import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Matchground extends StatelessWidget {
  const Matchground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      width:1100.w,
      height: 1800.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image:AssetImage('image/MatchField.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
      child:
      Column(
          children: [
            Row(
                children: [
                  SizedBox(
                    width: 300.w,
                    height: 120.h,
                    child:TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '홈팀',
                        labelStyle:TextStyle(fontSize: 18,fontWeight:FontWeight.w700),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width:5,
                            style:BorderStyle.solid,),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 384.w,
                    height: 40.h,
                  ),
                  SizedBox(
                    width: 380.w,
                    height: 120.h,
                    child:const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '매치포지션',
                        labelStyle:TextStyle(fontSize: 18,fontWeight:FontWeight.w700),
                        enabledBorder: OutlineInputBorder(

                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width:5,
                            style:BorderStyle.solid,),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ]
            ),
            SizedBox(
              width: 375.w,
              height: 500.h,
            ),
            Row(
                children: [
                  SizedBox(
                    width: 300.w,
                    height: 120.h,
                    child:TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '어웨이팀',
                        labelStyle:TextStyle(fontSize: 18,fontWeight:FontWeight.w700),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width:5,
                            style:BorderStyle.solid,),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 384.w,
                    height: 40.h,
                  ),
                  SizedBox(
                    width: 380.w,
                    height: 120.h,
                    child:TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '매치포지션',
                        labelStyle:TextStyle(fontSize: 18,fontWeight:FontWeight.w700),
                        enabledBorder: OutlineInputBorder(

                          borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width:5,
                            style:BorderStyle.solid,),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ]
            ),
          ]
      ),
    );
  }
}
