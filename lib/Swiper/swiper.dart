import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class SwiperPage extends StatefulWidget {
  const SwiperPage({super.key});

  @override
  State<SwiperPage> createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
  List<String> images = [
    "https://cdn.pixabay.com/photo/2020/01/26/20/14/computer-4795762_1280.jpg",
    "https://cdn.pixabay.com/photo/2023/05/20/16/48/dog-8006839_1280.jpg",
    "https://cdn.pixabay.com/photo/2017/04/11/03/33/dinant-2220459_1280.jpg",
    "https://cdn.pixabay.com/photo/2023/04/26/15/51/lighthouse-7952696_1280.jpg",
    "https://cdn.pixabay.com/photo/2023/05/22/11/22/superb-fairywren-8010454_1280.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swiper"),
      ),
      body: Center(
        child: Container(
          child: SizedBox(
            height: 280,
            child: Swiper(
              loop: true,
              autoplay: true,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Image.network(
                  images[index],
                  fit: BoxFit.fitHeight,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                );
              },
              pagination: SwiperPagination(),
            ),
          ),
        ),
      ),
    );
  }
}
