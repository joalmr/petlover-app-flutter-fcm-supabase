import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';

// final control = Get.find<NavigationController>();

emergencia() {
  return InkWell(
    borderRadius: BorderRadius.circular(15.0),
    onTap: () {
      // control.currentTabIndex = 2;
      Get.toNamed('navLista', arguments: {
        "filtros": [8]
      });
    },
    child: Stack(
      children: <Widget>[
        Container(
          width: 120.0,
          height: 100.0,
          padding: EdgeInsets.all(15.0),
          foregroundDecoration: BoxDecoration(
            color: Colors.red.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15.0),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/fre-emergencia.jpg'),
              )),
        ),
        Container(
          width: 120.0,
          height: 100.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Emergencia', style: TextStyle(color: Colors.white)),
              Text('24 horas', style: TextStyle(color: Colors.white, fontSize: sizeSmallx2)),
            ],
          ),
        )
      ],
    ),
  );
}

consulta() {
  return InkWell(
    borderRadius: BorderRadius.circular(15.0),
    onTap: () {
      // control.currentTabIndex = 2;
      Get.toNamed('navLista', arguments: {
        "filtros": [2]
      });
    },
    child: Stack(
      children: <Widget>[
        Container(
          width: 120.0,
          height: 100.0,
          padding: EdgeInsets.all(15.0),
          foregroundDecoration: BoxDecoration(
            color: Colors.black.withOpacity(0.25),
            borderRadius: BorderRadius.circular(15.0),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/fre-consulta.jpg'),
              )),
        ),
        Container(
          width: 120.0,
          height: 100.0,
          child: Center(
            child: Text('Consulta', style: TextStyle(color: Colors.white)),
          ),
        )
      ],
    ),
  );
}

vacuna() {
  return InkWell(
    borderRadius: BorderRadius.circular(15.0),
    onTap: () {
      // control.currentTabIndex = 2;
      Get.toNamed('navLista', arguments: {
        "filtros": [4]
      });
    },
    child: Stack(
      children: <Widget>[
        Container(
          width: 120.0,
          height: 100.0,
          padding: EdgeInsets.all(15.0),
          foregroundDecoration: BoxDecoration(
            color: Colors.black.withOpacity(0.25),
            borderRadius: BorderRadius.circular(15.0),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/fre-vacuna.jpeg'),
              )),
        ),
        Container(
          width: 120.0,
          height: 100.0,
          child: Center(
            child: Text('Vacuna', style: TextStyle(color: Colors.white)),
          ),
        )
      ],
    ),
  );
}

banio() {
  return InkWell(
    borderRadius: BorderRadius.circular(15.0),
    onTap: () {
      // control.currentTabIndex = 2;
      Get.toNamed('navLista', arguments: {
        "filtros": [1]
      });
    },
    child: Stack(
      children: <Widget>[
        Container(
          width: 120.0,
          height: 100.0,
          padding: EdgeInsets.all(15.0),
          foregroundDecoration: BoxDecoration(
            color: Colors.black.withOpacity(0.25),
            borderRadius: BorderRadius.circular(15.0),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/fre-banio.jpg'),
              )),
        ),
        Container(
          width: 120.0,
          height: 100.0,
          child: Center(
            child: Text('Baño', style: TextStyle(color: Colors.white)),
          ),
        )
      ],
    ),
  );
}

desparasita() {
  return InkWell(
    borderRadius: BorderRadius.circular(15.0),
    onTap: () {
      // control.currentTabIndex = 2;
      Get.toNamed('navLista', arguments: {
        "filtros": [11]
      });
    },
    child: Stack(
      children: <Widget>[
        Container(
          width: 120.0,
          height: 100.0,
          padding: EdgeInsets.all(15.0),
          foregroundDecoration: BoxDecoration(
            color: Colors.black.withOpacity(0.25),
            borderRadius: BorderRadius.circular(15.0),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/fre-desparacita.jpg'),
              )),
        ),
        Container(
          width: 120.0,
          height: 100.0,
          child: Center(
            child: Text('Desparasitación', style: TextStyle(color: Colors.white)),
          ),
        )
      ],
    ),
  );
}
