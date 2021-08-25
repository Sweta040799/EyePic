import 'package:flutter/material.dart';
import 'package:myfirstapp/loginPages/loginBar.dart';


class LoginPage1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return LayoutBuilder(
      builder: (context , constraints){
          if(constraints.maxWidth>1200){
            return DesktopLogin1();
          }
          else{
            return MobileLogin1();
          }
      }
      );
  }

}

class DesktopLogin1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       floatingActionButton: FloatingActionButton(
         backgroundColor: Colors.pink,
         onPressed: () { print("Pressed"); },
       child: Icon(
         Icons.message_rounded,
         size: 30.0,
       ),),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(195, 20, 50, 1.0),
              Color.fromRGBO(16, 11, 54, 1.0)
            ]
            )
        ),
        child: SingleChildScrollView(
                  child: Column(children: [
             LoginBar(),
             
          ],),
        )
        
      ),
    );
  }

}


class MobileLogin1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(195, 20, 50, 1.0),
              Color.fromRGBO(16, 11, 54, 1.0)
            ]
            )
        ),
        child: SingleChildScrollView(
                  child: Column(children: [
             LoginBar(),
            
          ],),
        )
        
      )
    );
  }

}