
import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/news_model.dart';
import 'package:flutter_application_2/view/home/widget/custom_carousel.dart';
import 'package:flutter_application_2/view/home/widget/list_itmes_news.dart';
import 'package:flutter_application_2/view/home/widget/section_header.dart';
import 'package:flutter_application_2/view/home/widget/app_bar.dart';

class HomePage extends StatelessWidget{
  const  HomePage({super.key});

  @override
  Widget build(BuildContext context) {


return  Scaffold(
 
  body: SingleChildScrollView(
    child: SafeArea(

      child:Column(
      children: [
 const CustomAppBar(),
const  SizedBox(height: 16.0,)
,SectionHeader(title: "Braeking News",onViewAllTap: () {},),
const  SizedBox(height: 16.0,),
CustomCarousel(newsList: news),
const  SizedBox(height:30,)
,SectionHeader(title: "Braeking News",onViewAllTap: () {},),
ListItmesNews(newsList:news,), 
      ],
    ) 
    )
  ),
);
  }


 
}



