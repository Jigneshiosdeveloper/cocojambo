import 'package:flutter/material.dart';

import '../utils/color.dart';
import '../utils/string.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Container(
           height: 320,
           width: 300,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(1.0),
             border: Border.all(color: Colors.grey.withOpacity(0.5))
           ),
           child: Column(
             children:  [
                const Padding(
                  padding: EdgeInsets.only(top:50.0,bottom: 10.0),
                  child: Text('Login',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,fontFamily: fontFamily.fontHelveticaNeueLTStd),),
                ),
               SizedBox(
                 height: 60,
                 child: Padding(
                   padding: const EdgeInsets.only(left:30.0,right: 30.0,top: 20.0),
                   child: TextField(
                     controller: emailController,
                     keyboardType: TextInputType.emailAddress,
                     style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontFamily: fontFamily.fontHelveticaNeueLTStd,color: Colors.black),
                     decoration: InputDecoration(
                       border: OutlineInputBorder(
                         borderSide:  BorderSide(color: Colors.grey.withOpacity(0.3), width: 0.0),
                       ),
                       labelText: 'E-Mail',
                       labelStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontFamily: fontFamily.fontHelveticaNeueLTStd,color: CustomColors.placeholderColor)
                     ),

                   ),
                 ),
               ),
               SizedBox(
                 height: 60,
                 child: Padding(
                   padding: const EdgeInsets.only(left:30.0,right: 30.0,top: 20.0),
                   child: TextField(
                     controller: pwdController,
                     obscureText: true,
                     style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontFamily: fontFamily.fontHelveticaNeueLTStd,color: Colors.black),
                     decoration: InputDecoration(
                       border: OutlineInputBorder(
                         borderSide:  BorderSide(color: Colors.grey.withOpacity(0.3), width: 0.0),
                       ),
                       labelText: 'Password',
                       labelStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontFamily: fontFamily.fontHelveticaNeueLTStd,color: CustomColors.placeholderColor)
                     ),

                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(30.0),
                 child: InkWell(
                   onTap: (){
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const Home()));
                      if(emailController.text == 'admin@cocojambo.app' && pwdController.text == 'qwerty@123'){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const Home()));
                      }else if(emailController.text != 'admin@cocojambo.app'){
                        var snackBar = const SnackBar(content: Text('Please enter valid email',style:TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: fontFamily.fontHelveticaNeueLTStd)),duration: Duration(seconds: 3));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }else{
                        var snackBar = const SnackBar(content: Text('Please enter valid password',style:TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: fontFamily.fontHelveticaNeueLTStd)),duration: Duration(seconds: 3));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }

                   },
                   child: Container(
                     height: 40.0,
                     decoration: BoxDecoration(
                       color: CustomColors.primaryColor,
                       borderRadius: BorderRadius.circular(20.0)
                     ),
                     child: const Center(
                       child: Text('Login',style: TextStyle(color: Colors.white,
                           fontSize: 16,fontWeight: FontWeight.w500,fontFamily: fontFamily.fontHelveticaNeueLTStd),
                       ),
                     ),
                   ),
                 ),
               )
             ],
           ),
      ),),
    );
  }
}
