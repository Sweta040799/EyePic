import 'package:flutter/material.dart';
import 'package:myfirstapp/galleryPages/gallery1.dart';

class LandingPage extends StatelessWidget{

  List<Widget> pagechildren(double width, BuildContext context){
    return <Widget>[

      Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(
               "Photographers",
               style: TextStyle(
                 color: Colors.deepOrange[200],
                 fontSize: 50
                 ),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                child: Text(
                  "Create your gallery and add photos \nso that the people can see the world from your eyes",
                  style:TextStyle(fontSize: 25.0,color: Colors.deepOrange[100])
                ),
              ),

              SizedBox(height: 10.0,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: MaterialButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context)=>Gallerypage1())
                      );
                  },
                  child: Text("Gallery",style: TextStyle(color: Colors.red,fontSize: 16.0),),
                  ),
              )  
           ],
          ),
          ),
          Image.asset(
            'assets/images/photo.jpg',
            width: width,
            )

    ];
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context , constraints){
          if(constraints.maxWidth>800){
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pagechildren(constraints.biggest.width/2, context),
              );
          }
          else{
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pagechildren(constraints.biggest.width, context),
              );
          }
      }
      );//layout builder for making the web responsive;
  }

}

