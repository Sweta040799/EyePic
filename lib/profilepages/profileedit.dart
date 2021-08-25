import 'package:flutter/material.dart';

class ProfileEdit extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ProfileEditState();

}

class ProfileEditState extends State<ProfileEdit>{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
         backgroundColor: Colors.black,
      );
  }

}
  
  //    Widget profileImage(){
  //       return Center(
  //         child: Stack(
  //           children: [
             
  //                 CircleAvatar(
  //                 radius: 80,
  //                 backgroundImage: AssetImage('assets/images/avatar.png')
  //                 // (_image==null)? AssetImage('assets/images/avatar.png'):
  //                 //  Image.file(File(_image!.path),fit:BoxFit.cover).image
                   
                  
  //                         ),
                                 

  //           Positioned(
  //             bottom: 20.0,
  //             right: 20.0,
  //             child: InkWell(
  //               onTap: (){
  //                    showDialog(
  //                    context: context, 
  //                    builder: (BuildContext context){
  //                      return AlertDialog(
  //                         backgroundColor: Colors.black54,
  //                         title: Text(
  //                         "Choose a Profile Picture",
  //                         style: TextStyle(color: Colors.white),
  //                         ),
  //                          content: MaterialButton(
  //                           color: Colors.pink,
  //                           shape: RoundedRectangleBorder(
  //                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
  //                        onPressed: (){
  //                            print("Pressed");
  //                         },
  //                           child: Text("Gallery",style: TextStyle(color: Colors.white,fontSize: 16.0),),
  //                       ),
  //                      );
  //                     } 
  //                    );
  //               },
  //                 child: Icon(
  //                 Icons.camera_alt,
  //                 color: Colors.white,
  //                 size: 28,
  //                 ),
  //             ),
  //             )
 

  //     ],
  //     ),
  //   );
  // }
