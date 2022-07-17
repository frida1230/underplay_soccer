import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Widget/DatePicker.dart';
import 'Widget/Matchground.dart';
import 'Widget/location.dart';
import 'Widget/weathertoggle.dart';


class Matchpage extends StatefulWidget {
  Matchpage({Key? key}) : super(key: key);

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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: [
              Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 45.h,
                          child: ElevatedButton(
                            child: const Text('새운동장만들기',
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.amber,
                                textStyle: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold)),
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(
                          width: 500.w,
                        ),
                        SizedBox(
                          height: 45.h,
                          child: ElevatedButton(
                            child: const Text('저장'),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.green)
                            ) ,
                            onPressed: (){},
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:const [
                        DatePicker(),
                        togglebutton(),
                      ],
                    ),
                    location(),

                    SizedBox(
                      height: 5.h,
                    ),
                    Matchground(),
                    SizedBox(
                      height: 5.h,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Container(
                            child: Row(
                              children: [
                                Text('스코어:'),
                                Expanded(
                                  child: TextField(
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(5),
                                    border: OutlineInputBorder(),
                                  ),
                                ),)
                              ],
                            )
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          SizedBox(
                            height: 40.h,
                            child: const TextField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(5),
                                  border: OutlineInputBorder(),
                                  hintText: '오늘 잘한것'),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          SizedBox(
                            height: 40.h,
                            child: TextField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(5),
                                  border: OutlineInputBorder(),
                                  hintText: '오늘 못한것'),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                            child: TextField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(5),
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


