
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter/material.dart';

import 'package:tracklocation/Components/square_tile.dart';
import 'package:tracklocation/Components/DialogPrompt.dart';

import 'package:tracklocation/View/Login/ForgotPassword.dart';
import 'package:tracklocation/View/Login/RegisterAccount.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context){

    var appTheme = Theme.of(context);

    final _formKey = GlobalKey<FormState>();

    final loginIdController = TextEditingController();
    final passwordController = TextEditingController();

     signUserInGoogle() async {

      showDialog(
        context: context, 
        builder: (context){
          return const Center(
            child: CircularProgressIndicator(),
          );
      });

      try{
        final UserCredential userCredential;

        if(kIsWeb){
          GoogleAuthProvider authProvider = GoogleAuthProvider();
          userCredential = await FirebaseAuth.instance.signInWithPopup(authProvider);
        }else{
          final GoogleSignIn googleSignIn = GoogleSignIn();
          final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
          
          if(googleSignInAccount != null){
            final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
            final AuthCredential authCredential = GoogleAuthProvider.credential(
                idToken: googleSignInAuthentication.idToken,
                accessToken: googleSignInAuthentication.accessToken);
            
            // Getting users credential
            userCredential = await FirebaseAuth.instance.signInWithCredential(authCredential); 
          } 

        }

        Navigator.pop(context);
      }
      on FirebaseAuthException catch(exception){

        Navigator.pop(context);
        String errorMessage = "System error";

        if(exception.code == "user-not-found"
        || exception.code == "wrong-password"){
          errorMessage = "Invalid username / password";
        }else if(exception.code == "invalid-email"){
          errorMessage = "Email format is invalid";
        }

        showDialog(
          context: context, 
          builder: (ctx) {
            return DialogPrompt(
              titleMessage: "Error",
              iconType: Icons.error,
              mainMessage: errorMessage,
            );
          }
        );

        //errorMessagePrompt(errorMessage);

        // ScaffoldMessenger.of(context).showSnackBar(
        //    SnackBar(content: Text(
        //       errorMessage
        //     )
        //   ),
        // );
      } catch(exception){
        showDialog(
          context: context, 
          builder: (ctx) {
            return DialogPrompt(
              titleMessage: "Error",
              iconType: Icons.error,
              mainMessage: exception.toString(),
            );
          }
        );
      }
    }

    void signUserIn() async {

      showDialog(
        context: context, 
        builder: (context){
          return const Center(
            child: CircularProgressIndicator(),
          );
      });

      try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginIdController.text,
          password: passwordController.text
        );

        Navigator.pop(context);
      }
      on FirebaseAuthException catch(exception){

        Navigator.pop(context);
        String errorMessage = "System error";

        if(exception.code == "user-not-found"
        || exception.code == "wrong-password"){
          errorMessage = "Invalid username / password";
        }else if(exception.code == "invalid-email"){
          errorMessage = "Email format is invalid";
        }

        showDialog(
          context: context, 
          builder: (ctx) {
            return DialogPrompt(
              titleMessage: "Error",
              iconType: Icons.error,
              mainMessage: errorMessage,
            );
          }
        );

        // ScaffoldMessenger.of(context).showSnackBar(
        //    SnackBar(content: Text(
        //       errorMessage
        //     )
        //   ),
        // );
      }
    }

    return Scaffold(
      backgroundColor: appTheme.colorScheme.background,
      appBar: AppBar(
        title: Text('Login Page'),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
        child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Container(
                    child: 
                    Center(child: 
                      TextFormField(
                        controller: loginIdController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Login Id required";
                          }

                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Login Id',
                          hintText: 'Enter your login id',
                          hintStyle: TextStyle(color: Colors.grey)
                        ),
                      ),)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Container(
                      child: 
                      Center(child: 
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return "Password required";
                            }

                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(color: Colors.grey)
                          ),
                        ),)
                    ),
                ), 
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context){
                                  return ForgotPasswordPage();
                                }
                              )
                            );
                          },
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.blue[600]),
                            ),
                          ),
                        ),
                      ],
                      ),
                ), 
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: 
                      Center(child: 
                        ElevatedButton.icon(
                          onPressed: (){
                            if(_formKey.currentState!.validate()){
                                signUserIn();
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Please fill all input')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            minimumSize: const Size(200, 50)
                          ),
                          icon: const Icon(Icons.login),
                          label: const Text('Login')
                      ),
                    ),
                ),
                const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                            "Or continue with",
                            style: TextStyle(color: Colors.grey[700])
                          ),
                      ),Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400]
                        ),
                      ),
                    ]
                  ),
                ),
                const SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.symmetric(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async{
                          await signUserInGoogle();
                        },
                        child: MouseRegion(
                          child:  const SquareTile(
                            imagePath: 'lib/images/googleicon.png', 
                            height: 40,
                          ),
                          cursor: SystemMouseCursors.click,
                        ),
                      ),

                      SizedBox(width: 25,),


                      GestureDetector(
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: const SquareTile(
                          imagePath: 'lib/images/appleicon.png', 
                          height: 40,
                          ),
                        ) ,
                      ),
                    ],
                  )
                ),

                const SizedBox(height: 25,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member? "),

                    SizedBox(width: 4,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) {
                            return RegisterAccountPage();
                          },
                        )
                        );
                      },
                      child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: 
                        Text("Register now", 
                        style: TextStyle(
                        color: Colors.blue
                    ),),
                    ),
                    )
                    
                  ],

                )
            ]),
        ),
      ),
      ),
      )
    );
  }
}





