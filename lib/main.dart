import 'package:flutter/material.dart';
import 'package:myfirstapp/landing%20page/landing.dart';
import 'package:myfirstapp/navbar.dart';



void main() => runApp(Home());

class Home extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "First Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget{
  @override 
  Widget build(BuildContext context){

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
             NavBar(),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 70.0,horizontal: 20.0),
               child: LandingPage(),
             )
          ],),
        )
        
      )
    );
  }
}

