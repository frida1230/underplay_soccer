import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../model/User.dart';
import 'Calendarpage.dart';
import 'DrawTacticspage.dart';
import 'Matchpage.dart';
import 'Rehabpage.dart';
import 'SelfTrainingpage.dart';

class HomePage extends StatefulWidget {
  final UserData ud;

  const HomePage({Key? key, required this.ud}) : super(key: key);
  @override //상속한 부모 클래스의 기능
  State createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          centerTitle: false,
          titleSpacing: 0.0,
          title:  Transform(
            // you can forcefully translate values left side using Transform
            transform:  Matrix4.translationValues(220.w,-8.h, 10),
            child: const Text(
              "Under Play",
              style: TextStyle(fontFamily: 'Pacifico',
                fontSize: 40),
            ),
          ),
          flexibleSpace: Image.asset(
            'image/titleBackgroundImage.png',
            fit: BoxFit.fill,
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
      drawerEnableOpenDragGesture: false,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: widget.ud.avatar != ''
                      ? NetworkImage(widget.ud.avatar) as ImageProvider
                      : AssetImage('image/profileImage.png'),
                backgroundColor: Colors.white,),
                accountName: Text(widget.ud.name),
                accountEmail: Text(widget.ud.email),
            onDetailsPressed: (){
                  print('arrow is clicked');
            },
            decoration: BoxDecoration(
              color: Colors.green[600],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0))),
            ),
            ListTile(
              leading: Icon(
                Icons.people_alt_sharp,
                color: Colors.grey[850],
              ),
              title: const Text('팀 훈련'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DrawTacticspage(title: 'Team Tactics',)),
                );
              },
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.grey[850],
              ),
              title: const Text('개인 훈련'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> SelfTrainingpage(title: '개인 훈련',)),
                );
              },
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.sports_soccer,
                color: Colors.grey[850],
              ),
              title: const Text('매치'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> Matchpage(title: '매치',)),
                );
              },
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.model_training,
                color: Colors.grey[850],
              ),
              title: const Text('재활 훈련'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Rehabpage(title: '재활훈련',)),
                );
              },
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_today_outlined,
                color: Colors.grey[850],
              ),
              title: const Text('훈련 스케줄'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalendarPage(ud: widget.ud,)),
                );
              },
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[850],
              ),
              title: const Text('Setting'),
              onTap: () {
                print('Setting is clicked');
              },
              trailing: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      body: Container(
        child:
        const SafeArea(
              child: WebView(
                initialUrl: 'https://www.kfa.or.kr//',
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
        ),
    );
  }
}
