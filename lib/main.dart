import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soccer/screens/Loginpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(1170, 2532),
        builder: (_, child) =>
            MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'UnderPlay App',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: LoginPage(),
            )
    );
  }
}
