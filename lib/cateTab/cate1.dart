import 'package:flutter/material.dart';

class CateP1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return   Container(
                height: 500,
                  width: 500,
                  child: Card(
                  color: Colors.black26,
                    elevation: 15.0,
                    shadowColor: Colors.white,
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                       child: Container(
                         height: 350,
                         alignment: Alignment.topCenter,
                         padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                         decoration: BoxDecoration(
                           image: DecorationImage(
                             image: AssetImage('assets/images/aerialPhotography.png'),
                             fit: BoxFit.fitWidth,alignment: Alignment.topCenter
                             )
                           ),
                           child: Container(
                             alignment: Alignment.bottomLeft,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                               Text(
                                 'Aerial',
                                 style: TextStyle(
                                   fontSize: 40,
                                   color: Colors.white),
                                   ),

                                   SizedBox(
                                     width: 150,
                                   ),

                               Padding(
                                 padding: const EdgeInsets.only(bottom: 25 ,right: 20),
                                 child: IconButton(
                                   onPressed: (){
                                     Navigator.push(
                                       context, 
                                       MaterialPageRoute(builder: (context)=>CateP1Landing()));
                                     
                                   }, 
                                   icon: Icon(
                                     Icons.arrow_right_alt,
                                     color: Colors.white,
                                     size: 50,
                                     )),
                               )

                             ],),
                           ),
                         ),
                    ),
                );
  }

}

class CateP1Landing extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Scaffold(backgroundColor: Colors.black,);
  }

}