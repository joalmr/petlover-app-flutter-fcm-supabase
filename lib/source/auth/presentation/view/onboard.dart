import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:proypet/design/styles/styles.dart';

import 'components/item_onboard.dart';
import 'data/icons_login.dart';

class OnBoardPage extends StatefulWidget {
  @override
  _OnBoardPageState createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  SwiperController _controller = SwiperController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Swiper(
            loop: false,
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            controller: _controller,
            pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                activeColor: colorMain,
                activeSize: 20.0,
                color: colorGray2,
              ),
            ),
            itemCount: 3,
            itemBuilder: (context, index) {
              return ItemOnBoard(
                title: iconLogin[index]['title'],
                subtitle: iconLogin[index]['text'],
                imageUrl: iconLogin[index]['image'],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FlatButton(
              child: Text("Saltar"),
              onPressed: () => Get.offAllNamed('login'),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon:
                  Icon(_currentIndex == 2 ? Icons.check : Icons.arrow_forward),
              onPressed: () {
                if (_currentIndex != 2)
                  _controller.next();
                else
                  Get.offAllNamed('login');
              },
            ),
          )
        ],
      ),
    );
  }
}
