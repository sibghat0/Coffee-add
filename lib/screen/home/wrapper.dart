import 'package:flutter/material.dart';
import 'package:flutter_app_todo/modules/user.dart';
import 'package:flutter_app_todo/screen/authenticate/authenticate.dart';
import 'package:flutter_app_todo/screen/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final us = Provider.of<SUser>(context);
    print(us);

    //return home or authenticate widget
    if(us == null) {
      return Authenticate();
    } else{
      return Home();
    }
  }
}
