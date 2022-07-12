import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';


class LandScreenSlides extends StatefulWidget {
  LandScreenSlides({Key? key}) : super(key: key);

  @override
  State<LandScreenSlides> createState() => _LandScreenSlidesState();
}

class _LandScreenSlidesState extends State<LandScreenSlides> {

  List<Slide> slides = List.empty();


  @override
  void initState()
  {
    // TODO: implement initStte
    super.initState();
    slides.add(
      Slide(
      title: 'Birmbenawa',
      description: 'Birmbenawa بەخێرهاتی بۆ بەرنامەی',
      pathImage: 'assets/images/slider/logo.png'
      ),
    );
    slides.add(
      Slide(
      title: 'ئاگادارکردنەوە',
      description: 'دەتوانی ئاگادارکردنەوەیەکی دیاری کراو دروست بکەیت',
      pathImage: 'assets/images/slider/REMINDER.png'
      ),
    );
    slides.add(
      Slide(
      title: 'لیستی کڕینەکان',
      description: 'بیرهێنانەوەی لیستی کڕینەکان',
      pathImage: 'assets/images/slider/SHOP.png'
      ),
    );
    slides.add(
      Slide(
      title: 'ئاگادارکردنەوەی ڕۆژانە',
      description: 'ئاگادارت دەکاتەوە لە چالاکی ڕۆژانە',
      pathImage: 'assets/images/slider/Weekly.png'
      ),
    );
  }
  
  List<Widget> ?renderListCustomTabs(){
    List<Widget> tabs = List.empty();
    for(int i = 0; i < slides.length;i++)
    {
      Slide currentSlide = slides[i];
      tabs.add(
        Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 140, top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Image.asset(
                  currentSlide.pathImage.toString(), 
                  matchTextDirection: true, 
                  height: 50,),
              ),
              Container(
                child: Text(
                  currentSlide.title.toString(), 
                  style: TextStyle(
                    color: Colors.black, 
                    fontSize: 25),),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,),
                child: Text(currentSlide.description.toString(), 
                style: TextStyle(
                  color: Color.fromARGB(255, 63, 63, 63), 
                  fontSize: 20, 
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
               ),
               margin: EdgeInsets.only(
                top: 10,
                left: 15,
                right: 15,
               ),
              ),

            ]
          ),
        ),
      ),
     );
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      backgroundColorAllSlides: Color.fromARGB(255, 172, 172, 172),
      renderSkipBtn: Text('Skip'),
      renderNextBtn: Text('Next', style: TextStyle(color: Color.fromARGB(255, 0, 162, 255)),),
      renderDoneBtn: Text('Done', style: TextStyle(color: Color.fromARGB(255, 0, 162, 255)),),
      loopAutoScroll: true,
      colorActiveDot: Colors.black,
      sizeDot: 8.0,
      typeDotAnimation: DotSliderAnimation.SIZE_TRANSITION,
      listCustomTabs: this.renderListCustomTabs(),
      scrollPhysics: BouncingScrollPhysics(),

    );
  }
}