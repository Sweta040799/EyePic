import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class CateCards extends StatelessWidget{

  final cateList =[
      'assets/images/aerialPhotography.png',
      'assets/images/architecturePhotography.jpg' ,
      'assets/images/eventPhotography.jpg',
      'assets/images/fashionPhotography.jpeg',
      'assets/images/fineartPhotography.jpg',
      'assets/images/petPhotography.jpg',
      'assets/images/photJournalism.jpg',
      'assets/images/potraitPhotography.jpg',
      'assets/images/productPhotograpgy.jpg',
      'assets/images/sportsPhotography.jpg',
      'assets/images/stilllifePhotography.jpg',
      'assets/images/travelPhotography.jpg',
      'assets/images/weddingPhotography.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Swiper(
          layout: SwiperLayout.CUSTOM,
          customLayoutOption:CustomLayoutOption(startIndex: -1,stateCount:3 )
          .addRotate(
             [0.0 / 180, 0.0, 0.0 / 180]
          ).
          addTranslate(
                [Offset(-310.0, 0.0),
                   Offset(0.0, 0.0),
                   Offset(310.0, 0.0)]
          ),
          indicatorLayout:PageIndicatorLayout.SCALE,
          autoplay:true,
          autoplayDelay:1000,
          pagination:SwiperPagination(),
          control: SwiperControl(),
          fade:1.0,
          // itemWidth: 300,
          // itemHeight: 200,
          itemBuilder: (context, index){
            return Image.asset(
              cateList[index],
              fit: BoxFit.cover,
            );
          },
          itemCount: cateList.length,

        ),
      ),
    );
  }

}

 