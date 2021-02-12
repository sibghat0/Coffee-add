import 'package:flutter/material.dart';
import 'package:flutter_app_todo/services/auth.dart';
import 'package:flutter_app_todo/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  // text field state
  String email = "";
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :  Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign up to Brew Crew'),
        actions: [
          FlatButton.icon(onPressed:() { widget.toggleView(); }, icon: Icon(Icons.person), label: Text('Sign In'),)
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              TextFormField(
                // decoration: textInput.copyWith(hintText: 'Email'),
                decoration: InputDecoration(
                  hintText: 'Email',
                  fillColor: Colors.grey[340],
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 0.5),
                  ),
                ),
                validator: (val) => val.isEmpty ? "Enter an Email" : null,
                  onChanged: (val){
                    setState(() => email = val.trim());
                  }
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    fillColor: Colors.grey[340],
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                  ),
                  validator: (val) => val.length < 6 ? "Enter the Password at least 6 character" : null,
                  obscureText: true,
                  onChanged: (val){
                    setState(() {
                      password = val.trim();
                    });
                  }
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    // print(email);
                    // print(password);
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null) {
                      setState(() {
                       error = 'please supply the valid email';
                       loading = false;
                      });
                    }
                  }
                },
              ),
              SizedBox( height: 12.0,),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

