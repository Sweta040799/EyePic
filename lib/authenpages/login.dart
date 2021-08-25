// import 'dart:ffi';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/auth/authen.dart';
import 'package:myfirstapp/authenpages/signin.dart';
import 'package:myfirstapp/authmodel/authenticate.dart';
import 'package:myfirstapp/loginPages/loginPage1.dart';

class LayOut extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return LayoutBuilder(
      builder: (context , constraints){
          if(constraints.maxWidth>1200){
            return LoginPage(auth: Auth());
          }
          else{
            return LoginPageMobile();
          }
      }
      );//layout
  }
}

class LoginPage extends StatefulWidget{

  
  LoginPage({required this.auth});
  late final BaseAuth auth;


  @override
  State<StatefulWidget> createState() {
     return _LoginPageState();
  }

}



class _LoginPageState extends State<LoginPage>{

  final formKey = GlobalKey<FormState>();

  late String _email;
  late String _password;
  late String errorMessage;


 
   bool proceed(){
    final form = formKey.currentState;
    

    if(form!.validate()){
      form.save();
       return true;
    }

    else{
         return false;
    }
  }

  void validateAndSubmit() async {
      if(proceed()){
        try{
          String userId = await widget.auth.signInWithEmailAndPassword(_email, _password);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage1()));
          // formKey.currentState!.reset();
        //   AlertDialog(
        //        backgroundColor: Colors.black54,
        //        title: Text(
        //         'Welcome back',
        //        style: TextStyle(color: Colors.pink),
        //    ),
        //  );
          
        }
        catch (e) {
           switch(e.toString()){
             case "ERROR_INVALID_EMAIL":
                 errorMessage = "Your email address appears to be malformed.";
                 break;
             case "ERROR_WRONG_PASSWORD":
                 errorMessage = "Your password is wrong.";
                 break;
             case "ERROR_USER_NOT_FOUND":
                 errorMessage = "User with this email doesn't exist.";
                 break;
             case "ERROR_USER_DISABLED":
                 errorMessage = "User with this email has been disabled.";
                 break;
             case "ERROR_TOO_MANY_REQUESTS":
                 errorMessage = "Too many requests. Try again later.";
                 break;
             case "ERROR_OPERATION_NOT_ALLOWED":
                 errorMessage = "Signing in with Email and Password is not enabled.";
                 break;
             default:
                 errorMessage = "An undefined Error happened.";

           }

           if(errorMessage != null){
             return Future.error(errorMessage);
           }
       
        }
      }
      else{
         AlertDialog(
         backgroundColor: Colors.black54,
         title: Text(
           "Print valid Email and Passowrd",
           style: TextStyle(color: Colors.pink),
           ),
         );
      }
    }

  @override  
  Widget build(BuildContext context) {

    final emailFeild=Container(
      width: 400,
      child: Center(
        child: TextFormField(
          validator: (value)=> (value==null || value.isEmpty) ? "Email can't be empty":null,
          onSaved: (value)=> (value != null)? _email=value:null,
          style: TextStyle(color: Colors.white),
          obscureText: false,
          decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0,15.0,20.0,15.0),
          
          hintText: "Email",
      
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: Colors.white, width:2.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width:2.0),
            borderRadius: BorderRadius.circular(32.0)
            )
            ),
            ),
      ),
      );

      final passwordFeild=Container(
      width: 400,
      child: Center(
        child: TextFormField(
          validator: (value)=> (value==null || value.isEmpty) ? "Password can't be empty":null,
          onSaved: (value)=> (value != null)? _password=value:null,
          style: TextStyle(color: Colors.white),
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0,15.0,20.0,15.0),
          
          hintText: "Password",
          
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: Colors.white, width:2.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width:2.0),
            borderRadius: BorderRadius.circular(32.0)
            )
            ),
            ),
      ),
      );

      final loginButton= MaterialButton(
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: () async {
                      if(proceed()){
                          try{
                          String userId = await widget.auth.signInWithEmailAndPassword(_email, _password);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage1()));
                          await showDialog(
                          context: context, 
                          builder: (BuildContext context){
                          return GestureDetector(
                            onTap: (){
                              formKey.currentState!.reset();
                            },
                            child: AlertDialog(
                            backgroundColor: Colors.black54,
                            title: Center(
                              child: Text(
                              "Welcome Back",
                              style: TextStyle(color: Colors.white),
                              ),
                            ),
                                                 ),
                          );
                      } 
                     );
                         
                            // formKey.currentState!.reset();
                         
          
                        }

                        catch(e){
                          return showDialog(
                          context: context, 
                          builder: (BuildContext context){
                          return GestureDetector(
                            onTap: (){
                              formKey.currentState!.reset();
                            },
                            child: AlertDialog(
                            backgroundColor: Colors.black54,
                            title: Center(
                              child: Text(
                                   e.toString(),
                              style: TextStyle(color: Colors.white),
                              ),
                            ),
                                                 ),
                          );
                      } 
                     );
                        }
                      }
                  },
                  child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 16.0),),
                  );

      final signInButton= MaterialButton(
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                   onPressed: ()  {
                      formKey.currentState!.reset();
                      Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context)=>SigninPage(auth: Auth(),))
                      );
                   
                  },
                  child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 16.0),),
                  );




     return Scaffold(
       body: Center(
         child: Container(
           constraints: BoxConstraints.expand(),
           decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage('assets/images/photo.jpg'),fit: BoxFit.cover
               )
               ),
           child: ClipRRect(
             child: BackdropFilter(
               filter: ImageFilter.blur(sigmaX: 12,sigmaY: 12),
               child: Form(
                 key: formKey,
                 child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(right: 450),
                  color: Colors.grey.withOpacity(0.1),
                  child: SingleChildScrollView(
                                    child: Column(
                      children: [
                        Text(
                             "EYEPIC",
                               style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontFamily: 'ReggaeOne',
                               color: Colors.white,
                                fontSize: 60
                             ),
                            ),
                        
               
                          SizedBox(height: 20,),
                          Container(
                            padding: EdgeInsets.only(left:450),
                            child: emailFeild,
                            ),
                          
                            
               
                           SizedBox(height: 20,),
                            Container(
                            padding: EdgeInsets.only(left:450),
                            child: passwordFeild,
                            ),
                          
                            
               
                             SizedBox(height: 40,),
                            Container(
                              padding: EdgeInsets.only(left:650),
                              child: Row(
                                children: [
               
                                 loginButton,
                                  
                                  
                                   SizedBox(width: 60,),
               
                                  signInButton,
                                  
                                  
               
                              ],),
                            ),
                           
                          
                      ],
                    ),
                  ),
                 ),
               ),
               ),
             ),
           ),
         )
       );
  }

}


class LoginPageMobile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return LoginPageMState();
  }

}


class LoginPageMState extends State<LoginPageMobile>{
  @override
  Widget build(BuildContext context) {

    final emailFeild=Container(
      width: 200,
      child: TextField(
        style: TextStyle(color: Colors.white),
      obscureText: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0,15.0,20.0,15.0),
        
        hintText: "Email",
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          borderSide: BorderSide(color: Colors.white, width:2.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width:2.0),
          borderRadius: BorderRadius.circular(32.0)
          )
          ),
          ),
      );

      final passwordFeild=Container(
      width: 200,
      child: TextField(
        style: TextStyle(color: Colors.white),
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0,15.0,20.0,15.0),
        
        hintText: "Password",
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          borderSide: BorderSide(color: Colors.white, width:2.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width:2.0),
          borderRadius: BorderRadius.circular(32.0)
          )
          ),
          ),
      );

      final loginButton= MaterialButton(
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage1()));
                  },
                  child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 16.0),),
                  );

      final signInButton= MaterialButton(
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SigninPage(auth: Auth(),)));
                  },
                  child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 16.0),),
                  );

       List<Widget> pagebutton(double width){
           return <Widget>[
             Container(
               width: width/3,
               child: loginButton,

             ),

             SizedBox(height: 30,width: 30,),

              Container(
               width: width/3,
               child: signInButton,

             ),
           ];
       }


     return Scaffold(
       body: Center(
         child: Container(
           constraints: BoxConstraints.expand(),
           decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage('assets/images/photo.jpg'),fit: BoxFit.cover
               )
               ),
           child: ClipRRect(
             child: BackdropFilter(
               filter: ImageFilter.blur(sigmaX: 12,sigmaY: 12),
               child: Container(
                alignment: Alignment.center,
                // padding: EdgeInsets.only(top: 250,right: 450),
                color: Colors.grey.withOpacity(0.1),
                child: Center(
                  // padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                  child: SingleChildScrollView(
                                      child: Column(
                      children: [
                        Text(
                             "EYEPIC",
                               style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontFamily: 'ReggaeOne',
                               color: Colors.white,
                                fontSize: 60
                             ),
                            ),
                        

                          SizedBox(height: 20,),
                        
                        
                             emailFeild,
                            
                          
                            

                           SizedBox(height: 20,),
                           
                             passwordFeild,
                           
                          
                            

                             SizedBox(height: 40,),
                    
                           
                             LayoutBuilder(
                               builder: (context ,constraints){
                                  if(constraints.maxWidth>800){
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                    children: pagebutton(constraints.biggest.width/4)
                                     );
                                  }
                                 else{
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                    children: pagebutton(constraints.biggest.width/2)
                                      );
                                 }
                                 
                           
                                  
                               }
                             
                             ),
                          
                                  
                                  

                             
                            
                           
                          
                      ],
                    ),
                  ),
                ),
               ),
               ),
             ),
           ),
         )
       );
  }

}