import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/model/news_model.dart';
import 'package:flutter_application_2/view/details/news_details.dart';
import 'package:flutter_application_2/view/home/widget/news_items.dart';

class ListItmesNews extends StatelessWidget {
  const ListItmesNews({super.key, required this.newsList});
  final List<NewsItem> newsList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return NewsDetailsPage(index: 0,);
              },
            ));
          },
          child: Container(
            margin: EdgeInsets.all(10),
            child: NewsItems(
                title: newsList[index].title,
                imgUrl: newsList[index].imgUrl,
                category: newsList[index].category,
                author: newsList[index].author,
                time: newsList[index].time),
          ),
        );
      },
    );
  }
}
