import 'package:flutter/material.dart';
import 'package:flutter_app_todo/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text("Blew Crew"),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: [
          FlatButton.icon(onPressed: () async{ await _auth.signOut(); }, icon: Icon(Icons.person), label: Text('Logout'))
        ],
      ),
    );
  }
}
