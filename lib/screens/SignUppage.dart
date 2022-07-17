import 'package:flutter/material.dart';
import 'package:soccer/screens/Loginpage.dart';
import 'package:soccer/screens/Widget/CustomAppbar.dart';

import '../RestApi.dart';
import 'Widget/LoginTF.dart';

class SignupPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text ("Sign up", style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: 20,),
                        Text("Create an Account,Its free",style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                        ),),
                        SizedBox(height: 30,)
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40
                      ),
                      child: Column(
                        children: [
                          LoginTF(label: "Email", tfcontroller: emailController),
                          LoginTF(label: "Password", obsureText: true, tfcontroller: passwordController),
                          LoginTF(label: "phone", tfcontroller: phoneController),
                          LoginTF(label: "name", tfcontroller: nameController)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: MaterialButton(
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
                            await RestApi().SignUp(
                              emailController.text,
                              nameController.text,
                              phoneController.text,
                              '',
                              passwordController.text
                            );
                            Navigator.of(context, rootNavigator: true).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          },
                          color: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)
                          ),
                          child: Text("Sign Up",style: TextStyle(
                            fontWeight: FontWeight.w600,fontSize: 16,

                          ),),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? "),
                        TextButton(
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          },
                        )
                      ],
                    )
                  ],

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}