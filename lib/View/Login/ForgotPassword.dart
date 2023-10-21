import 'package:flutter/material.dart';
import 'package:tracklocation/Components/DialogPrompt.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ForgotPasswordPage extends StatefulWidget{
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPage();
}

class _ForgotPasswordPage extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context){

    var appTheme = Theme.of(context);

    final _formKey = GlobalKey<FormState>();

    final loginIdController = TextEditingController();

    bool checkAgreedInd = true;

    // void MessagePrompt(String errorMessage, String titleMessage, IconData iconType){
    //   showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: Text(titleMessage),
    //         icon: Icon(iconType),
    //         content: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text(errorMessage)
    //           ]
    //         ),
    //       );
    //     },
    //   );
    // }

    void recoverPassword() async {

      showDialog(
        context: context, 
        builder: (context){
          return const Center(
            child: CircularProgressIndicator(),
          );
      });

      try{
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: loginIdController.text,
        );
        
        Navigator.pop(context);

        showDialog(
          context: context, 
          builder: (ctx) => DialogPrompt(
            titleMessage: "Success",
            iconType: Icons.check,
            mainMessage: "Password sent to email",
          ),
        );
      }
      on FirebaseAuthException catch(exception){

        Navigator.pop(context);
        String errorMessage = "System error";

        if(exception.code == "user-not-found"
        || exception.code == "wrong-password"){
          errorMessage = "Email address not found";
        }else if(exception.code == "invalid-email"){
          errorMessage = "Email format is invalid";
        }

        showDialog(
          context: context, 
          builder: (ctx) {
            return DialogPrompt(
              titleMessage: "Error",
              mainMessage: errorMessage,
              iconType: Icons.warning,
            );
          }
        );

        // MessagePrompt(
        //   errorMessage, 
        //   "Error", 
        //   Icons.warning
        // );

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
                            return "Email address required";
                          }

                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'example@hotmail.com',
                          hintText: 'Enter your email address',
                          hintStyle: TextStyle(color: Colors.grey)
                        ),
                      ),)
                  ),
                ),
                const SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: 
                      Center(child: 
                      StatefulBuilder(builder: (context, setState) {
                        return ElevatedButton.icon(
                          onPressed: checkAgreedInd ? () 
                          {
                            if(_formKey.currentState!.validate()){
                                recoverPassword();
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Please fill all input')),
                              );
                            }
                          } : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            minimumSize: const Size(200, 50)
                          ),
                          icon: const Icon(Icons.send_rounded),
                          label: const Text('Recover')
                      );
                      })
                        
                    ),
                ),

                const SizedBox(height: 25,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? "),

                    SizedBox(width: 4,),

                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: 
                            Text("Sign in", 
                            style: TextStyle(
                            color: Colors.blue
                        ),
                    ),
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










