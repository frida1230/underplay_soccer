import 'package:flutter/material.dart';
import 'Widget/DatePicker.dart';
import 'Widget/location.dart';
import 'Widget/weathertoggle.dart';


class SelfTrainingpage extends StatefulWidget {
  const SelfTrainingpage({Key? key}) : super(key: key);

  @override
  State<SelfTrainingpage> createState() => _SelfTrainingpageState();
}

class _SelfTrainingpageState extends State<SelfTrainingpage> {
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
                      children:const [
                        DatePicker(),
                        togglebutton(),
                      ],
                    ),
                    const location(),

                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      width: 375,
                      height: 500,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('image/footballplayground.png'),
                          fit: BoxFit.fitWidth,
                        ),
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

