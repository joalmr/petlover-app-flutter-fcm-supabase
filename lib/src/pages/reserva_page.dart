import 'package:flutter/material.dart';
import 'package:proypet/src/pages/reserva_detalle_page.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';
import 'package:proypet/src/pages/shared/card_swiper.dart';
import 'package:proypet/src/pages/shared/form_control.dart';
import '../../main.dart';

final List vets = [
  {
    'image':['images/vet_prueba.jpg','images/imagesvet.jpg'],
    'title':'Vet prueba 1',
    'logo':'images/veterinaria.png'
  },
  {
    'image':['images/imagesvet.jpg','images/vet_prueba.jpg'],
    'title':'Vet prueba 2',
    'logo':'images/veterinaria2.png'
  },
  {
    'image':['images/vet_prueba.jpg','images/imagesvet.jpg'],
    'title':'Vet prueba 3',
    'logo':'images/veterinaria3.png'
  },
];

//final _shape = BorderRadius.circular(100.0);

class ReservaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorMain,
        leading: leadingH,
        title: titleH,
        actions: actionsH,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0,),
                FormControl().textfieldBtn('Ingrese veterinaria..',Icon(Icons.search),(){})
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index){
                return _buildVets(context,index);
              },
              childCount: vets.length
            ),
          ),
        ],
      ),
      //bottomNavigationBar: NavigationBar(),
    );
  }

  Widget _buildVets(BuildContext context, int index){
    var vet = vets[index % vets.length];
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0,horizontal: 20.0),
      child: InkWell(
        onTap: ()=>Navigator.push(context, MaterialPageRoute(
          builder: (_)=>ReservaDetallePage(),
        )),
        child: Material(
          //elevation: 5.0,
          //borderRadius: BorderRadius.circular(5.0),
          //color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  _swiperVets(vet['image']),
                  Positioned(//logo
                    bottom: 5.0,
                    right: 10.0,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      //color: Colors.white,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(vet['logo']),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(vet['title'],style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 2.5,),
                    Text('Pequeña descripción',maxLines: 1,),
                    SizedBox(height: 2.5,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.star, color: colorMain,),
                        Icon(Icons.star, color: colorMain,),
                        Icon(Icons.star, color: colorMain,),
                        Icon(Icons.star, color: colorMain,),
                        Icon(Icons.star_border, color: colorMain,),
                        SizedBox(width: 5.0,),
                        Text('(220)', style: TextStyle(color: Colors.grey),)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _swiperVets(imagen){
    return CardSwiper(imagenes : imagen,autoplay1: false);    
  }
}
