import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src2/app/styles/styles.dart';

emergencia(BuildContext context) {
  return InkWell(
    borderRadius: BorderRadius.circular(15.0),
    onTap: () => Get.toNamed('navLista', arguments: {
      "filtros": [8]
    }),
    // Navigator.pushNamed(context, 'navLista', arguments: {
    //   "filtros": [8]
    // }),
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

consulta(BuildContext context) {
  return InkWell(
    borderRadius: BorderRadius.circular(15.0),
    onTap: () => Get.toNamed('navLista', arguments: {
      "filtros": [2]
    }),
    // Navigator.pushNamed(context, 'navLista', arguments: {
    //   "filtros": [2]
    // }),
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

vacuna(BuildContext context) {
  return InkWell(
    borderRadius: BorderRadius.circular(15.0),
    onTap: () => Get.toNamed('navLista', arguments: {
      "filtros": [4]
    }),
    // Navigator.pushNamed(context, 'navLista', arguments: {
    //   "filtros": [4]
    // }),
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

banio(BuildContext context) {
  return InkWell(
    borderRadius: BorderRadius.circular(15.0),
    onTap: () => Get.toNamed('navLista', arguments: {
      "filtros": [1]
    }),
    // Navigator.pushNamed(context, 'navLista', arguments: {
    //   "filtros": [1]
    // }),
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

desparasita(BuildContext context) {
  return InkWell(
    borderRadius: BorderRadius.circular(15.0),
    onTap: () => Get.toNamed('navLista', arguments: {
      "filtros": [11]
    }),
    // Navigator.pushNamed(context, 'navLista', arguments: {
    //   "filtros": [11]
    // }),
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
