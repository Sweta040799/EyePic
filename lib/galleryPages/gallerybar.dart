import 'package:flutter/material.dart';
import 'package:myfirstapp/main.dart';

class GalleryBar extends StatelessWidget{

  @override 
  Widget build(BuildContext context){
    return LayoutBuilder(
      builder: (context , constraints){
          if(constraints.maxWidth>1200){
            return DesktopGalleryBar();
          }
         
          else{
            return MobileGalleryBar();
          }
      }
      );//layout builder for making the web responsive
  }

}

class DesktopGalleryBar extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
      child: Container(
        constraints: BoxConstraints(maxWidth: 1600),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
           Text(
             "EYEPIC",
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontFamily: 'ReggaeOne',
               color: Colors.white,
               fontSize: 45
             ),
             ),

             Row(
               children: <Widget>[

                 IconButton(
                   onPressed: (){
                     Navigator.push(
                       context, 
                       MaterialPageRoute(builder: (context)=>Homepage()));
                   }, 
                   icon: Icon(
                     Icons.home,
                     color: Colors.white,
                     )),

                 SizedBox(width: 30,),

                  IconButton(
                   onPressed: (){
                     print("Button Pressed");
                   }, 
                   icon: Icon(
                     Icons.people_alt,
                     color: Colors.white,
                     )),
                 SizedBox(width: 30,),

                  IconButton(
                   onPressed: (){
                     print("Button Pressed");
                   }, 
                   icon: Icon(
                     Icons.message,
                     color: Colors.white,
                     )),
                 SizedBox(width: 30,),
               ]
             )//row of sub menu options
        ]
        )//row for main menu option
      ),
    );
  }
}

class MobileGalleryBar extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
        child: Column(children: [
          Text(
               "EYEPIC",
               style: TextStyle(
                 fontFamily: 'ReggaeOne',
                 fontWeight: FontWeight.bold,
                 color: Colors.white,
                 fontSize: 60
               ),
               ),

               Padding(
                 padding: const EdgeInsets.all(12.0),
                                child: Row(
                   children: <Widget>[
                     IconButton(
                   onPressed: (){
                     Navigator.push(
                       context, 
                       MaterialPageRoute(builder: (context)=>Homepage()));
                   }, 
                   icon: Icon(
                     Icons.home,
                     color: Colors.white,
                     )),

                 SizedBox(width: 30,),

                  IconButton(
                   onPressed: (){
                     print("Button Pressed");
                   }, 
                   icon: Icon(
                     Icons.people_alt,
                     color: Colors.white,
                     )),
                       SizedBox(width: 30,),
                       IconButton(
                   onPressed: (){
                     print("Button Pressed");
                   }, 
                   icon: Icon(
                     Icons.message,
                     color: Colors.white,
                     )),
                 SizedBox(width: 30,),
                   ]
                 ),
               )
        ],),
      ),
    );
  }
}