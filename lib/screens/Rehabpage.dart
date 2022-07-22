import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Widget/DatePicker.dart';
import 'Widget/Paincheckbox.dart';
import 'Widget/location.dart';
import 'Widget/weathertoggle.dart';



class Rehabpage extends StatefulWidget {
  const Rehabpage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _rehabpageState createState() => _rehabpageState();
}

class _rehabpageState extends State<Rehabpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            tooltip: "Save to all",
            onPressed: () => (context),
          ),
        ]
          ),
      body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(10.r),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        const DatePicker(),
                        const togglebutton(),
                      ],
                    ),
                    const location(),
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                      height: 1100.h,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text('해당 통증부위 체크박스 선택 후 통증레벨 클릭.'),
                            Paincheckbox(type: '목',),
                            Paincheckbox(type: '어깨',),
                            Paincheckbox(type: '팔',),
                            Paincheckbox(type: '가슴',),
                            Paincheckbox(type: '허리',),
                            Paincheckbox(type: '배',),
                            Paincheckbox(type: '볼기',),
                            Paincheckbox(type: '허벅지',),
                            Paincheckbox(type: '종아리',),
                            Paincheckbox(type: '발',),
                          ],
                        ),
                      ),
                    ),

                    Column(
                      children: [
                        SizedBox(
                          height: 175.h,
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            minLines: 1,
                            maxLines: 5,
                            decoration: InputDecoration(
                              isDense: true,
                              border: OutlineInputBorder(),
                              hintText: '훈련 프로그램 내용'
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SizedBox(
                          height: 175.h,
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            minLines: 1,
                            maxLines: 5,
                            decoration: InputDecoration(
                                isDense: true,
                                border: OutlineInputBorder(),
                                hintText: '재활목표 내용'),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SizedBox(
                          height: 175.h,
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            minLines: 1,
                            maxLines: 5,
                            decoration: InputDecoration(
                                isDense: true,
                                border: OutlineInputBorder(),
                                hintText: '재활심리 내용'),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SizedBox(
                          height: 175.h,
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            minLines: 1,
                            maxLines: 5,
                            decoration: InputDecoration(
                                isDense: true,
                                border: OutlineInputBorder(),
                                hintText: '특이사항 내용'
                            ),
                          ),
                        ),
                      ]
                    ),
                  ],
              ),

            ]
          ),
      ),

      bottomNavigationBar: const BottomAppBar(),
    );
  }
}




