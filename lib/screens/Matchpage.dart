import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Widget/DatePicker.dart';
import 'Widget/Matchground.dart';
import 'Widget/location.dart';
import 'Widget/weathertoggle.dart';


class Matchpage extends StatefulWidget {
  Matchpage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _Matchpage createState() => _Matchpage();
}

class _Matchpage extends State<Matchpage> {
  Offset position = const Offset(20.0, 20.0);
  Offset offset = const Offset(100, 100);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[600],
            title: Text(widget.title),
            actions: <Widget>[
              TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ), onPressed: () {  },
                child: Text('새 운동장 만들기',)
              ),
              IconButton(
                icon: const Icon(Icons.save),
                tooltip: "Save to all",
                onPressed: () => (context),
              ),
              ]
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(20.r),
            children: [
              Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children:const [
                        DatePicker(),
                        togglebutton(),
                      ],
                    ),
                    location(),

                    SizedBox(
                      height: 10.h,
                    ),
                    Matchground(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Container(
                            height: 130.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('스코어:', style: TextStyle(fontSize: 15),),
                                SizedBox(
                                  width: 500.w,
                                  height: 130.h,
                                  child: const TextField(
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: const EdgeInsets.all(15),
                                        border: OutlineInputBorder(),
                                        ),
                                  ),
                                ),
                              ],
                            )
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            height: 175.h,
                            child: TextField(
                              minLines: 1,
                              maxLines: 5,
                              decoration: InputDecoration(
                                  isDense: true,
                                  border: OutlineInputBorder(),
                                  hintText: '오늘 잘한것'),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            height: 175.h,
                            child: TextField(
                              minLines: 1,
                              maxLines: 5,
                              decoration: InputDecoration(
                                  isDense: true,
                                  border: OutlineInputBorder(),
                                  hintText: '오늘 못한것'),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            height: 175.h,
                            child: TextField(
                              
                              minLines: 1,
                              maxLines: 5,
                              decoration: InputDecoration(
                                  isDense: true,
                                  border: OutlineInputBorder(),
                                  hintText: '게임 평가'),
                            ),
                          ),
                        ]
                    ),
                ]
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(),
    );
  }
}


