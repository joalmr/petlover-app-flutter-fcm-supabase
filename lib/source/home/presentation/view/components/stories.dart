import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:proypet/config/path_variables.dart';
import 'package:proypet/design/styles/lottie.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/home/domain/controller/home_controller.dart';
import 'package:proypet/source/notificaciones/provider/notification_provider.dart';
import 'storiesDot.dart';

class StoriesPet extends StatefulWidget {
  final String petImgId;
  final int specieId;
  const StoriesPet({@required this.petImgId, this.specieId});
  @override
  _StoriesPetState createState() =>
      _StoriesPetState(petImgId: this.petImgId, specieId: this.specieId);
}

class _StoriesPetState extends State<StoriesPet> {
  String petImgId;
  int specieId;
  _StoriesPetState({@required this.petImgId, @required this.specieId});

  final _pageController = PageController(initialPage: 0);
  final _home = Get.find<HomeController>();

  // final timeToBack = Timer(Duration(milliseconds: 4000), () => Get.back());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Widget avatarBells() {
    final dato = _home.notificacionesGroup;
    bool hasStory = false;
    GroupNoti item = new GroupNoti();
    dato.forEach((element) {
      if (element.imgId == petImgId) {
        hasStory = true;
        item = element;
      }
    });

    return Container(
      child: hasStory
          ? CircleAvatar(
              radius: 32.5,
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: colorWhite,
                      width: 2,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Lottie.asset(pathLottie('emailsend')),
                    ],
                  ),
                ),
                onTap: () {
                  showGeneralDialog(
                    context: context,
                    barrierLabel: MaterialLocalizations.of(context)
                        .modalBarrierDismissLabel,
                    barrierColor: Theme.of(context).backgroundColor,
                    pageBuilder: (BuildContext context, Animation first,
                        Animation second) {
                      return SafeArea(
                        child: Column(
                          children: [
                            Expanded(
                              child: PageView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: item.notifications.length,
                                  controller: _pageController,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final historia = item.notifications[index];
                                    return Scaffold(
                                      body: Column(
                                        children: [
                                          SizedBox(height: 2.5),
                                          Row(
                                            children: [
                                              for (var i = 0;
                                                  i < item.notifications.length;
                                                  i++)
                                                if (i <= index)
                                                  StoriesDot(
                                                      isActive: true,
                                                      length: item
                                                          .notifications.length)
                                                else
                                                  StoriesDot(
                                                      isActive: false,
                                                      length: item
                                                          .notifications.length)
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  child: CachedNetworkImage(
                                                    imageUrl: item.imgId,
                                                    fit: BoxFit.cover,
                                                    height: 32,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.20),
                                          Container(
                                            child: Column(
                                              children: [
                                                CachedNetworkImage(
                                                  imageUrl:
                                                      historia.notificationImg,
                                                  placeholder: (_, __) =>
                                                      Center(
                                                    child: lottieLoading,
                                                  ),
                                                ),
                                                SizedBox(height: 20),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20),
                                                  child: Text(historia.message),
                                                ),
                                                Container(
                                                  width: double.maxFinite,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: Text(
                                                      'Enviado: ${historia.notificationDate}',
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            )
          : Padding(
              padding: EdgeInsets.all(3),
              child: specieId == 2
                  ? Image(image: AssetImage(pathGif('perro-kb')))
                  : Image(image: AssetImage(pathGif('gato-kb'))),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return avatarBells();
  }
}
