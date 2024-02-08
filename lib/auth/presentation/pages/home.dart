
import 'package:flutter/material.dart';
import 'package:session2v2/run.dart';
import 'signup.dart';
import 'package:supabase/supabase.dart';

class home extends StatefulWidget {
  const home({super.key, required this.title});

  final String title;

  @override
  State<home> createState() => _homeState();
}

bool sec = true;
bool secc = true;

class _homeState extends State<home> {
  TextEditingController namectr = TextEditingController();
  TextEditingController emailctr = TextEditingController();
  TextEditingController phonectr = TextEditingController();
  TextEditingController passctr = TextEditingController();
  TextEditingController passcctr = TextEditingController();
  bool check = false;

  bool isValid(){
    if (( passctr.text.length >= 6) & (emailctr.text.length != 0)  & (check == true)){
      return true;
    }
    else{return false;}

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home", style: TextStyle(fontSize: 24),),),
    );
  }
}