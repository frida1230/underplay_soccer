import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soccer/RestApi.dart';
import 'package:soccer/screens/Homepage.dart';
import 'package:soccer/screens/SignUppage.dart';

import '../model/User.dart';
import 'Widget/LoginTF.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: Image.asset('image/underplayLogo.png',
                    width: 400.w,
                    height: 400.h,
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  children: [
                    LoginTF(label: "Email", tfcontroller: emailController),
                    LoginTF(label: "Password",obsureText: true, tfcontroller: passwordController),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: const Text('Forgot Password',),
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  height:60,
                  onPressed: () async {
                    showDialog(context: context, builder: (BuildContext context){
                      return AlertDialog(
                        backgroundColor: Colors.transparent,
                        content: Container(
                            width: 100,
                            height: 100,
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(top: 20),
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.transparent,
                              color: Colors.blue,
                            )
                        ),
                      );
                    });
                    UserData ud = await RestApi().getUser(emailController.text, passwordController.text);
                    Navigator.of(context, rootNavigator: true).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage(ud: ud)),
                    );
                  },
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)
                  ),
                  child: Text("Login",style: TextStyle(
                    fontWeight: FontWeight.w600,fontSize: 16,

                  ),),

                ),
                Row(
                  children: <Widget>[
                    const Text('Does not have account?'),
                    TextButton(
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            )
        ),
    );
  }
}
