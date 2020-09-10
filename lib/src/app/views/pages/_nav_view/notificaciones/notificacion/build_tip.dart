import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/data/models/model/notificacion/tip_model.dart';

Widget buildTip(context, Tip tip) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    child: InkWell(
        onTap: () {},
        child: Card(
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('ProypeTip:', style: Get.textTheme.subtitle2),
                          Text(tip.title, style: Theme.of(context).textTheme.subtitle1.apply(fontWeightDelta: 2)),
                        ],
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Expanded(
                    child: AspectRatio(
                      aspectRatio: 1.5,
                      child: Image(
                        image: AssetImage(tip.image),
                        // height: 230,
                        // width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
  );
}
