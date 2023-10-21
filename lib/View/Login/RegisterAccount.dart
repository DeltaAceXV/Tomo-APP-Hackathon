import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RegisterAccountPage extends StatefulWidget{
  @override
  State<RegisterAccountPage> createState() => _RegisterAccountPage();
}

class _RegisterAccountPage extends State<RegisterAccountPage> {
  bool checkAgreedInd = false;

  @override
  bool get wantKeepAlive => true; //this tells the state to keep it alive

  @override
  Widget build(BuildContext context){

    var appTheme = Theme.of(context);

    final _formKey = GlobalKey<FormState>();

    final loginIdController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    void MessagePrompt(String errorMessage, String titleMessage, IconData iconType){
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(titleMessage),
            icon: Icon(iconType),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(errorMessage)
              ]
            ),
          );
        },
      );
    }

    void registerAccount() async {

      showDialog(
        context: context, 
        builder: (context){
          return const Center(
            child: CircularProgressIndicator(),
          );
      });

      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: loginIdController.text,
          password: passwordController.text
        );

        Navigator.pop(context);
        Navigator.pop(context);

        MessagePrompt(
          "Account created successfully", 
          "Success",
          Icons.check
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
        }else if(exception.code == "email-already-in-use"){
          errorMessage = "Account already exist";
        }else if(exception.code == "weak-password"){
          errorMessage = "Password is too weak";
        }

        MessagePrompt(
          errorMessage, 
          "Error", 
          Icons.warning
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
                          labelText: 'Email Address',
                          hintText: 'Enter your email address',
                          hintStyle: TextStyle(color: Colors.grey)
                        ),
                      ),)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Container(
                    child: 
                    Center(child: 
                      TextFormField(
                        controller: passwordController,
                        validator: (value){
                          String ? checkValue;

                          if(value == null || value.isEmpty){
                            checkValue = "Password required";
                          }else if(value != confirmPasswordController.text){
                            checkValue = "Password does not match";
                          }

                          return checkValue;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter your desired password',
                          hintStyle: TextStyle(color: Colors.grey)
                        ),
                      ),)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Container(
                    child: 
                    Center(child: 
                      TextFormField(
                        controller: confirmPasswordController,
                        validator: (value){
                          String ? checkValue;

                          if(value == null || value.isEmpty){
                            checkValue = "Confirm Password required";
                          }else if(value != passwordController.text){
                            checkValue = "Password does not match";
                          }

                          return checkValue;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Confirm Password',
                          hintText: 'Confirm your password',
                          hintStyle: TextStyle(color: Colors.grey)
                        ),
                      ),)
                  ),
                ),
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StatefulBuilder(builder: (context, innerState) {
                      return Checkbox(
                        value: checkAgreedInd, 
                        onChanged: (checkValue) {
                          setState(() {
                            checkAgreedInd = checkValue ?? false;
                          });
                        });
                    },),
                      Expanded(
                        child: Padding(
                        padding: const EdgeInsets.symmetric(),
                        child: Text(
                          "By signing up, you agree to our Terms Conditions & Privacy Policy",
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                          style: TextStyle(color: Colors.grey[700])
                        ),
                      ),
                      ),
                ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: 
                      Center(child: 
                        ElevatedButton.icon(
                          onPressed: checkAgreedInd ? (){
                            if(_formKey.currentState!.validate()){
                                registerAccount();
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Please fill all input')),
                              );
                            }
                          } : null,
                          style: ElevatedButton.styleFrom(
                            
                            backgroundColor: checkAgreedInd ? Colors.blue : Colors.grey[50],
                            minimumSize: const Size(200, 50)
                          ),
                          icon: const Icon(Icons.app_registration_rounded),
                          label: const Text('Register')
                      ),
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










