import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/design/styles/lottie.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/home/domain/controller/home_controller.dart';

class StoriesPet extends StatelessWidget {
  final pageController = PageController(
    initialPage: 0
  );

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (_) {
        return Container(
          child: SingleChildScrollView(
            child: Row(
              children: [
                for (var item in _.notificacionesGroup)
                  CircleAvatar(
                    radius: 32,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: colorMain[300],
                            width: 2,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CachedNetworkImage(
                            imageUrl: item.imgId,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      onTap: (){
                        showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                          barrierColor: Theme.of(context).backgroundColor,
                          transitionDuration: Duration(milliseconds: 200),
                          pageBuilder: (BuildContext context, Animation first, Animation second){
                            return SafeArea(
                              child: Column(
                                children: [
                                  SizedBox(height: 2.5),
                                  Row(children: [
                                    // i==index-1 ? colorMain :
                                    for (var i = 0; i < item.notifications.length; i++)
                                      Container(
                                        height: 4,
                                        width: MediaQuery.of(context).size.width/item.notifications.length,
                                        padding: EdgeInsets.symmetric(horizontal: 2),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                  ],),
                                  Expanded(
                                    child: PageView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: item.notifications.length,
                                      controller: pageController,
                                      itemBuilder: (BuildContext context, int index){
                                        // Timer(Duration(milliseconds: 2000), (){
                                        //   pageController.nextPage(
                                        //     duration: Duration(milliseconds: 200), 
                                        //     curve: Curves.easeInCubic,
                                        //   );
                                        //   if(index==item.notifications.length-1){
                                        //     Get.back();
                                        //   }
                                        // });
                                        if(index==item.notifications.length-1){
                                          Timer(Duration(milliseconds: 2000), (){
                                            Get.back();
                                          });
                                        }
                                        final historia = item.notifications[index];
                                        return Scaffold(
                                          body: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(100),
                                                      child: CachedNetworkImage(
                                                        imageUrl: item.imgId,
                                                        fit: BoxFit.cover,
                                                        height: 32,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: MediaQuery.of(context).size.height*0.20),
                                              Container(
                                                child: Column(
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
                                            ],
                                          ),
                                        );
                                      }
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
          
        );
        // return Stories(
        //   displayProgress: true,
        //   highLightColor: colorMain,
        //   circlePadding: 2.5,
        //   storyItemList: [
        //     for (var item in _.notificacionesGroup)
        //       StoryItem(
        //         name: "",
        //         thumbnail: NetworkImage(item.imgId),
        //         stories: [
        //           for (var historia in item.notifications)
        //           Scaffold(
        //             body: Container(
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   CachedNetworkImage(
        //                     imageUrl: historia.notificationImg,
        //                     placeholder: (_,__) => Center(child: lottieLoading,),
        //                   ),
        //                   SizedBox(height: 20),
        //                   Padding(
        //                     padding: const EdgeInsets.symmetric(horizontal: 20),
        //                     child: Text(historia.message),
        //                   ),
        //                   Container(
        //                     width: double.maxFinite,
        //                     child: Padding(
        //                       padding: const EdgeInsets.symmetric(horizontal: 20),
        //                       child: Text(
        //                         'Enviado: ${historia.notificationDate}',
        //                         style: TextStyle(fontSize: 10),
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //   ],
        // );
      },
    );
  }
}