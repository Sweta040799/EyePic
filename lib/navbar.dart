import 'package:flutter/material.dart';
import 'package:myfirstapp/authenpages/login.dart';

class NavBar extends StatelessWidget{

  @override 
  Widget build(BuildContext context){
    return LayoutBuilder(
      builder: (context , constraints){
          if(constraints.maxWidth>1200){
            return DesktopNavBar();
          }
          else if(constraints.maxWidth>800 && constraints.maxWidth<1200){
            return DesktopNavBar();
          }
          else{
            return MobileNavBar();
          }
      }
      );//layout builder for making the web responsive
  }

}

class DesktopNavBar extends StatelessWidget{
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
               fontSize: 60
             ),
             ),

             Row(
               children: <Widget>[
                 Text('Home',style: TextStyle(color: Colors.white),),
                 SizedBox(width: 30,),
                 Text('About Us',style: TextStyle(color: Colors.white),),
                 SizedBox(width: 30,),
                 Text('Portfolio',style: TextStyle(color: Colors.white),),
                 SizedBox(width: 30,),
                 MaterialButton(
                   color: Colors.pink,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                   onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => LayOut()));
                   },
                   child: Text("Get Started",style: TextStyle(color: Colors.white),),
                   ),
                   SizedBox(width: 30,),
               ]
             )//row of sub menu options
        ]
        )//row for main menu option
      ),
    );
  }
}

class MobileNavBar extends StatelessWidget{
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
                     Text('Home',style: TextStyle(color: Colors.white),),
                     SizedBox(width: 30,),
                     Text('About Us',style: TextStyle(color: Colors.white),),
                     SizedBox(width: 30,),
                     Text('Portfolio',style: TextStyle(color: Colors.white),),
                     SizedBox(width: 30,),
                     MaterialButton(
                       color: Colors.pink,
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                       onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => LayOut()));//navigate to login page
                       },
                       child: Text("Get Started",style: TextStyle(color: Colors.white),),
                       ),
                       SizedBox(width: 30,),
                   ]
                 ),
               )
        ],),
      ),
    );
  }
}