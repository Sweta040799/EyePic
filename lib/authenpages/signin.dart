import 'dart:html';
import 'dart:io'as io;
import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfirstapp/auth/authen.dart';
import 'package:firebase/firebase.dart' as fb;

import 'dart:ui';

import 'package:myfirstapp/authenpages/login.dart';


class SigninPage extends StatefulWidget{

  

  SigninPage({required this.auth});
  late final BaseAuth auth;

  
  @override
  State<StatefulWidget> createState() {
     return SigninPageState();
  }

}


class SigninPageState extends State<SigninPage>{


    final formKey = GlobalKey<FormState>();

    late String _email;
    late String _password;
    late String _uname;
    late String _cpassword;
    late bool either;

    bool proceed(){
      final form = formKey.currentState;
      form!.save();

      if(form.validate() && _password ==_cpassword){
               return true;     
      }

      else{
            return false;
      }
    }

      
  


  @override
  Widget build(BuildContext context) {
 


     Widget profileImage(){
        return Center(
          child: CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('assets/images/avatar.png')
          // (_image==null)? AssetImage('assets/images/avatar.png'):
          //  Image.file(File(_image!.path),fit:BoxFit.cover).image
                  
        ),
    );
  }

  


    final uname=Container(
      width: 400,
      child: Center(
        child: TextFormField(
          validator: (value) => (value==null || value.isEmpty)?"Username can't be empty":null,
          onSaved: (value)=> (value != null)? _uname=value:null,
          style: TextStyle(color: Colors.white),
        obscureText: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0,15.0,20.0,15.0),
          
          hintText: "Username",
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

    final emailFeild=Container(
      width: 400,
      child: Center(
        child: TextFormField(
          validator: (value) => (value==null || value.isEmpty)?"Email can't be empty":null,
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
          validator: (value) => (value==null || value.isEmpty)?"Password can't be empty":null,
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

       final cpasswordFeild=Container(
      width: 400,
      child: Center(
        child: TextFormField(
          validator: (value) => (value==null || value.isEmpty || value!=_password)?"Password can't be empty":null,
          onSaved: (value)=> (value != null)? _cpassword=value:null,
          style: TextStyle(color: Colors.white),
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0,15.0,20.0,15.0),
          
          hintText: "Confirm Password",
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

     
      final signUpButton= MaterialButton(
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: () async {
                      if(proceed()){
                        String userId;
                        try{
                          userId= await widget.
                         auth
                         .signUpWithEmailAndPassword(_email, _password);
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
                            title: Text(
                            e.toString(),
                            style: TextStyle(color: Colors.pink),
                            ),
                            content: SizedBox(
                              height: 100,
                              width: 100,
                              child: Center(child: CircularProgressIndicator(color: Colors.white,strokeWidth: 4.0,))
                              ),
                                                 ),
                          );
                      } 
                     ); 
                        }
                         return showDialog(
                     context: context, 
                     builder: (BuildContext context){
                       return GestureDetector(
                         onTap: (){
                             formKey.currentState!.reset();
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>LayOut()));
                         },
                         child: AlertDialog(
                            backgroundColor: Colors.black54,
                            title: Text(
                            "You are Registered",
                            style: TextStyle(color: Colors.pink),
                            ),
                         ),
                       );
                      } 
                     );
                      }

                      else{
                         return showDialog(
                          context: context, 
                          builder: (BuildContext context){
                          return GestureDetector(
                            onTap: (){
                              formKey.currentState!.reset();
                            },
                            child: AlertDialog(
                            backgroundColor: Colors.black54,
                            title: Text(
                            "Failed to Register, Enter valid details",
                            style: TextStyle(color: Colors.pink),
                            ),
                            content: SizedBox(
                              height: 100,
                              width: 100,
                              child: Center(child: CircularProgressIndicator(color: Colors.white,strokeWidth: 4.0,))
                              ),
                                                 ),
                          );
                      } 
                     );
                      }
                  },
                  // validateAndSubmit,  
                  child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 16.0),),
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
                  color: Colors.grey.withOpacity(0.1),
                  child:  SingleChildScrollView(
                                    child: Column(
                      children: [
                        Container(
                           alignment: Alignment.topLeft,
                          padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                          child: Text(
                               "EYEPIC",
                                 style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontFamily: 'ReggaeOne',
                                 color: Colors.pink,
                                  fontSize: 60
                               ),
                              ),
                        ),
               
                        SizedBox(height: 20,),
                          Container(
                             alignment: Alignment.center,
                            // padding: EdgeInsets.only(left:450),
                            child: profileImage(),
                            ),
                        
               
                          SizedBox(height: 20,),
                          Container(
                             alignment: Alignment.center,
                            // padding: EdgeInsets.only(left:450),
                            child: uname,
                            ),
               
                       
               
                          SizedBox(height: 20,),
                          Container(
                             alignment: Alignment.center,
                            // padding: EdgeInsets.only(left:450),
                            child: emailFeild,
                            ),
                          
                            
               
                           SizedBox(height: 20,),
                            Container(
                               alignment: Alignment.center,
                            // padding: EdgeInsets.only(left:450),
                            child: passwordFeild,
                            ),
               
                            SizedBox(height: 20,),
                            Container(
                               alignment: Alignment.center,
                            // padding: EdgeInsets.only(left:450),
                            child: cpasswordFeild,
                            ),
                          
                            
               
                             SizedBox(height: 60,),
                             Container(
                                alignment: Alignment.center,
                                // padding: const EdgeInsets.symmetric(horizontal: 40),
                               child: signUpButton,)
                              
                            
                           
                          
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

//  Future<Uri> downURL(){
//    return fb
//               .storage()
//               .refFromURL('gs://eyepic-906d1.appspot.com')
//               .child('sol image.jpg')
//               .getDownloadURL();
//  } 
//  void uploadImage({required Function(File file) onSelected}){
//   html.FileUploadInputElement uploadIn = html.FileUploadInputElement()..accept = 'image/*';
//   uploadIn.click();

//   uploadIn.onChange.listen((event) {
//     final file = uploadIn.files!.first;
//     final reader = html.FileReader();
//     reader.readAsDataUrl(file);
//     reader.onLoadEnd.listen((event) {
//       print("done");
//     });
//   });
// }


// void uploadtoStorage(){
//   final dateTime = DateTime.now();
//   final userEmail = _email;
//   final path = '$userEmail/$dateTime';

//   uploadImage(onSelected: (file){
//       fb
//            .storage()
//            .refFromURL('gs://eyepic-906d1.appspot.com')
//            .child(path)
//            .put(file);
//   });

  
// }
 

}

