import 'package:flutter/material.dart';
import 'package:myfirstapp/galleryPages/categoriesCards.dart';
import 'package:myfirstapp/galleryPages/gallerybar.dart';

class Gallerypage1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return LayoutBuilder(
      builder: (context , constraints){
          if(constraints.maxWidth>1200){
            return DesktopGallery1();
          }
          else{
            return MobileGallery1();
          }
      }
      );
  }

}

class DesktopGallery1 extends StatelessWidget{
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
             GalleryBar(),
             SizedBox(height: 40,),
             Text(
             "CATEGORIES",
             style: TextStyle(
               color: Colors.pink[50],
               fontSize: 35
             ),
             ),
             SizedBox(height: 40,),
             Container(
               height: 300,
               alignment: Alignment.centerLeft,
               padding: EdgeInsets.only(left: 10),
               child: CateBar()),

                SizedBox(height: 80,),
             Text(
             "DRIFT",
             style: TextStyle(
               color: Colors.pink[50],
               fontSize: 35
             ),
             ),

          ],),
        )
        
      )
    );
  }

}


class MobileGallery1 extends StatelessWidget{
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
             GalleryBar(),
            
          ],),
        )
        
      )
    );
  }

}