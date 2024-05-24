import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Carousel Slider'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _current = 0;

  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
                carouselController: _controller,
                itemCount: flipkartCarouselImageUrlList.length,
                itemBuilder: (context, index, realIndex) =>
                    Image.network(flipkartCarouselImageUrlList[index]),
                options: CarouselOptions(
                  autoPlayCurve: Curves.ease,
                  enlargeCenterPage: true,
                  pageSnapping: true,
                  padEnds: true,
                  autoPlay: true,
                  height: 600,
                  enlargeFactor: .5,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                )),
            //carousel indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  flipkartCarouselImageUrlList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 5,
                    height: 5,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

final List<String> flipkartCarouselImageUrlList = [
  "http://www.movienewsletters.net/photos/277216R1.jpg",
  "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRKTcTqELNNPpy-c6orc876-Yxo-_QKENBdIufLEZNlSjHQBj_i",
  "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQBqTARD9v5F-80gN_DMGVjCKsd1g3XMDYazK1bF_2eOKZtb8FP",
  "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRyboCEpKxpwvXnylJEXQdJzFKxn5GfAQJdX7VAQZ4AGkXqRfIl",
  "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSb6kxZhgKsHPbRpwMa1Yv3RTZIymNgeblVAmxVUeZLoCtV6hST",
];
