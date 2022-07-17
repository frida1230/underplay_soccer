import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      leading:
      IconButton( onPressed: (){
        Navigator.pop(context);
      },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
    );
  }
}