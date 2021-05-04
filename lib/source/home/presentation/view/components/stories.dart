import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/design/styles/lottie.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/home/domain/controller/home_controller.dart';
import 'package:stories_for_flutter/stories_for_flutter.dart';

class StoriesPet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (_) {
        return Stories(
          displayProgress: true,
          highLightColor: colorMain,
          circlePadding: 2.5,
          storyItemList: [
            for (var item in _.notificacionesGroup)
              StoryItem(
                name: "",
                thumbnail: NetworkImage(item.imgId),
                stories: [
                  for (var historia in item.notifications)
                  Scaffold(
                    body: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            imageUrl: historia.notificationImg,
                            placeholder: (_,__) => Center(child: lottieLoading,),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(historia.message),
                          ),
                          Container(
                            width: double.maxFinite,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Enviado: ${historia.notificationDate}',
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}