import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Widget/DatePicker.dart';
import 'Widget/location.dart';
import 'Widget/weathertoggle.dart';


class SelfTrainingpage extends StatefulWidget {
  const SelfTrainingpage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SelfTrainingpage> createState() => _SelfTrainingpageState();
}

class _SelfTrainingpageState extends State<SelfTrainingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(30.r),
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
                    const location(),

                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(15.r),
                      width:1110.w,
                      height: 1500.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('image/footballplayground.png'),
                          fit: BoxFit.fitWidth,
                        ),
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
                  ]
              ),
            ]
        ),
      ),
    );
  }
}

