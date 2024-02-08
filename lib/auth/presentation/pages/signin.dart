import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:session2v2/auth/presentation/pages/signup.dart';
import 'package:session2v2/core/color.dart';
import 'package:session2v2/auth/presentation/widgets/customtextinput.dart';
import 'package:session2v2/run.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:session2v2/auth/presentation/pages/home.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  TextEditingController namectr = TextEditingController();
  TextEditingController emailctr = TextEditingController();
  TextEditingController phonectr = TextEditingController();
  TextEditingController passctr = TextEditingController();
  TextEditingController passcctr = TextEditingController();
  bool check = false;
  bool obs = true;

  bool isValid() {
    if ((passcctr.text == passctr.text) &
    (passctr.text.length >= 6) &
    (namectr.text.length != 0) &
    (phonectr.text.length != 0) &
    (emailctr.text.length != 0) &
    (check == true)) {
      return true;
    } else {
      return false;
    }}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 78,
                    ),
                    Text(
                      'Welcome back',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Complete the sign up process to get started',
                      style: smalltext,
                    ),
                    SizedBox(
                      height: 33,
                    ),
                    SizedBox(
                      height: 24,
                    ),

                    SizedBox(height: 24,),
                    SizedBox(
                      child: CustomTextField(
                        onChange: (str){setState(() {

                        });},
                        label: "email adress",
                        hint: '***********@mail.com',
                        controller: emailctr,),
                      width: MediaQuery.of(context).size.width - 48,
                      height: 77,
                    ),
                    SizedBox(height: 24,),
                    SizedBox(
                      child: CustomTextField(
                        onChange: (str){setState(() {

                        });},
                        label: "Password",
                        hint: '**********',
                        controller: passctr,
                        isObscure: obs,
                        onTapSuffix: (){setState(() {
                          if(obs == true){obs == false;}
                          else{obs == true;}
                        });
                        },
                      ),
                      width: MediaQuery.of(context).size.width - 48,
                      height: 77,
                    ),
                    SizedBox(height: 24,),
                    SizedBox(height: 37,),
                    SizedBox(width: MediaQuery.of(context).size.width-48, height: 30,child:
                    Row(children: [

                      Checkbox(
                          value: check,
                          onChanged: (value) {
                            setState(() {
                              check = value!;
                            });
                          }),
                      Text("Remember password", style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 167, 167, 167)),),
                      SizedBox(width: 48,),
                      Text("Forgot password", style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 5, 96, 250)))],),),
                    SizedBox(height: 64,),
                    SizedBox(width: MediaQuery.of(context).size.width - 48 , height: 46 ,child: OutlinedButton(
                        child: Text('Sign in',style: TextStyle(color: Colors.white),), onPressed: (isValid())
                        ? () async {
                          var res = await supabase.auth.signInWithPassword(password: passctr.text, email: emailctr.text);
                          final Session? session = res.session;
                          final User user = res.user!;
    if (user != null){Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => home(
    title: '',
    )));}
    }

                        : null,style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color.fromARGB(255, 5, 96, 250),
                        disabledBackgroundColor:
                        Color.fromARGB(255, 167, 167, 167),
                        disabledForegroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)))),),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 48,
                      child: Row(
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 167, 167, 167)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => signUp(

                                      )));
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 5, 96, 250)),
                            ),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width - 48,
                        child: Row(
                          children: [
                            Text("or sign in using",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 167, 167, 167)))
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width - 48,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Image.asset("assets/google.png")],
                        )),
                    SizedBox(
                      height: 24,
                    )




                  ],
                ),

                SizedBox(
                  width: 24,
                ),

              ],
            )
          ],
        ));
  }
}
