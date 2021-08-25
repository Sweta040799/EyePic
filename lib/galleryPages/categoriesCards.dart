import 'package:flutter/material.dart';
import 'package:myfirstapp/cateTab/cate1.dart';
import 'package:myfirstapp/cateTab/cate10.dart';
import 'package:myfirstapp/cateTab/cate11.dart';
import 'package:myfirstapp/cateTab/cate12.dart';
import 'package:myfirstapp/cateTab/cate13.dart';
import 'package:myfirstapp/cateTab/cate2.dart';
import 'package:myfirstapp/cateTab/cate3.dart';
import 'package:myfirstapp/cateTab/cate4.dart';
import 'package:myfirstapp/cateTab/cate5.dart';
import 'package:myfirstapp/cateTab/cate6.dart';
import 'package:myfirstapp/cateTab/cate7.dart';
import 'package:myfirstapp/cateTab/cate8.dart';
import 'package:myfirstapp/cateTab/cate9.dart';

class CateBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return  SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           child: Container(
           alignment: Alignment.centerLeft,
           padding: EdgeInsets.only(left: 30),
           child: Row(
             children: [
               
               CateP1(),
                SizedBox(width: 20.0,),
                CateP2(),
                SizedBox(width: 20.0,),
                CateP3(),
                SizedBox(width: 20.0,),
                CateP4(),
                SizedBox(width: 20.0,),
                CateP5(),
                SizedBox(width: 20.0,),
                CateP6(),
                SizedBox(width: 20.0,),
                CateP7(),
                SizedBox(width: 20.0,),
                CateP8(),
                SizedBox(width: 20.0,),
                CateP9(),
                SizedBox(width: 20.0,),
                CateP10(),
                SizedBox(width: 20.0,),
                CateP11(),
                SizedBox(width: 20.0,),
                CateP12(),
                SizedBox(width: 20.0,),
                CateP13(),


               
             ],),
           ),
       );
     
  }

}