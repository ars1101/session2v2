import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:session2v2/core/color.dart';
import 'package:session2v2/auth/presentation/widgets/customtextinput.dart';
import 'package:session2v2/auth/presentation/pages/signin.dart';
import 'package:session2v2/run.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'home.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
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
                  'Create the account',
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
                  child: CustomTextField(
                      label: "Full Name",
                      hint: 'Ivanov Ivan',
                      controller: namectr,
                  onChange: (str){setState(() {

                  });},),
                  width: MediaQuery.of(context).size.width - 48,
                  height: 77,
                ),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  child: CustomTextField(

                    label: "Phone number",
                    hint: '+9(999)999-99-99',
                    controller: phonectr,

                  ),
                  width: MediaQuery.of(context).size.width - 48,
                  height: 77,
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
                SizedBox(
                  child: CustomTextField(
                    onChange: (str){setState(() {

                    });},
                    label: "Confirm Password",
                    hint: '**********',
                    controller: passcctr,
                    isObscure: obs,
                    onTapSuffix: (){setState(() {
                      if(obs == true){obs == false;}
                      else{obs == true;}
                      print(obs);
                    });
                    },
                  ),
                  width: MediaQuery.of(context).size.width - 48,
                  height: 77,
                ),
                SizedBox(height: 37,),
                SizedBox(width: MediaQuery.of(context).size.width-48, height: 30,child:
                Row(children: [Checkbox(value: check, onChanged: (value){setState(() {
                  check = value!;
                });}),
                  SizedBox(
                    width: 271,
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "By ticking this box, you agree to our ",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 167, 167, 167)),
                            children: [
                              TextSpan(
                                  text:
                                  'Terms and conditions and private policy',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(
                                          255, 235, 188, 46)))
                            ])),
                  )],),),
                SizedBox(height: 64,),
                SizedBox(width: MediaQuery.of(context).size.width - 48 , height: 46 ,child: OutlinedButton(
                  child: Text('Sign up',style: TextStyle(color: Colors.white),), onPressed: (isValid())
                    ? () async {
                  var res = await supabase.auth.signUp(
                      password: passctr.text,
                      email: emailctr.text);
                  final Session? session = res.session;
                  final User user = res.user!;
                  await supabase.from('profiles').insert({
                    'id_user': user.id,
                    'fullname': namectr.text,
                    'phone': phonectr.text,
                    'avatar': '',


                  });


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
                                  builder: (context) => signIn(

                                  )));
                        },
                        child: Text(
                          "Sign in",
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
