import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Widget/DatePicker.dart';
import 'Widget/Paincheckbox.dart';
import 'Widget/location.dart';
import 'Widget/weathertoggle.dart';



class Rehabpage extends StatefulWidget {
  const Rehabpage({Key? key}) : super(key: key);

  @override
  _rehabpageState createState() => _rehabpageState();
}

class _rehabpageState extends State<Rehabpage> {
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
            padding: EdgeInsets.all(10),
            children: [
              Column(
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
                      height: 5,
                    ),
                    Container(
                      height: 200,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
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

                    Container(
                      height: 55,
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '훈련 프로그램 내용'
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 55,
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '재활목표 내용'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 55,
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '재활심리 내용'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Row(
                        children:[
                          SizedBox(
                            width: 270,
                            height: 55,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: '특이사항 내용'
                              ),
                            ),
                          ),
                          Expanded(
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
                    ),
                ]
              ),
            ],
          ),
        ),

      bottomNavigationBar: const BottomAppBar(),
    );
  }
}




