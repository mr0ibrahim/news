import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/news_model.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({super.key, required this.newsList});
  final List<NewsItem> newsList;

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int _currentIndex = 0;

  final CarouselSliderController _controller = CarouselSliderController();
  @override
 
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.newsList
        .map((item) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item.imgUrl,
                          fit: BoxFit.cover, width: double.infinity),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.blue,
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            item.author,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();

    List<Widget> buildPageIndicators() {
      List<Widget> ins = [];
      for (int index = 0; index < widget.newsList.length; index++) {
        ins.add(AnimatedContainer(
          curve: Curves.elasticInOut,
          duration: const Duration(seconds: 1),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: index == _currentIndex ? 35 : 25,
          height: 10,
          decoration: BoxDecoration(
              color: index == _currentIndex
                  ? Colors.black
                  : Colors.grey.withOpacity(0.20),
              borderRadius: BorderRadius.circular(10)),
        ));
      }

      return ins;
    }

    return Column(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
            initialPage: 0,
            aspectRatio: 2.0,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(seconds: 4),
            autoPlayCurve: Easing.emphasizedDecelerate,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
            enlargeCenterPage: true, // Make the current image enlarge
            height: 200,
            viewportFraction: 1.0, // Ensure only one image is shown at a time
          ),
          carouselController: _controller,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildPageIndicators(),
        ),
      ],
    );
  }
}
