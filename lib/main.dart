import 'dart:convert';
import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multiple_insertion_mysql/components/Button.dart';
import 'package:multiple_insertion_mysql/components/texteditor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController name= TextEditingController();
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
  TextEditingController address1= TextEditingController();
  TextEditingController address2= TextEditingController();
  TextEditingController phone1= TextEditingController();
  TextEditingController phone2= TextEditingController();

  Future<void>insertdata() async{
if(name.text!="" && email.text !="" && password.text!=""&&address1.text!="" && address2.text!="" && phone1.text!=""&& phone2.text!="") {
  String uri = "http://196.222.102.48/multiple_insertion_mysql_influtter/insertion.php";
  var req = await http.post(Uri.parse(uri), body: {
    "pname": name.text,
    "pemail": email.text,
    "ppassword": password.text,
    "paddress1": address1.text,
    "paddress2": address2.text,
    "pphone1": phone1.text,
    "pphone2": phone2.text
  });
  var res = jsonDecode(req.body);
  if (res["success"] == "true") {
name.text="";
email.text="";
password.text="";
phone1.text="";
phone2.text="";
address1.text="";
address2.text="";
  }else{
    print("some issues");
  }
}
else {
  print("fill the record");
}
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [],
      ) ,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child:Column(
            children: <Widget>[
              TextEditor(
                controller: name,
                  hintText: "Name",
                  obscureText: false),
              SizedBox(height: 20,),
              TextEditor(
                controller: email,
                  hintText: "Email",
                  obscureText: false),
              SizedBox(height: 20,),
              TextEditor(
                controller: password,
                  hintText: "Password",
                  obscureText: false),
              SizedBox(height: 20,),
              TextEditor(
                controller: phone1,
                  hintText: "phone1",
                  obscureText: false),
              SizedBox(height: 20,),
              TextEditor(
                controller: phone2,
                  hintText: "phone2",
                  obscureText: false),
              SizedBox(height: 20,),
              TextEditor(
                controller: address1,
                  hintText: "Address1",
                  obscureText: false),
              SizedBox(height: 20,),
              TextEditor(
                controller: address2,
                  hintText: "Address2",
                  obscureText: false),
              SizedBox(height: 20,),
              Button( onTap:insertdata),


            ],
          ),
        ),
      ),
    );
  }
}
