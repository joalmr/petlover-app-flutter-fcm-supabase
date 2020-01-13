//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/pages/reserva_detalle_page.dart';
import '../../main.dart';
import 'shared/navigation_bar.dart';

final List vets = [
  {
    'image':'images/vet_prueba.jpg',
    'title':'Vet prueba 1',
    'logo':'images/veterinaria.png'
  },
  {
    'image':'images/vet_prueba.jpg',
    'title':'Vet prueba 2',
    'logo':'images/veterinaria2.png'
  },
  {
    'image':'images/vet_prueba.jpg',
    'title':'Vet prueba 3',
    'logo':'images/veterinaria3.png'
  },
];

class ReservaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 180.0,
            backgroundColor: colorMain,
            floating: true,
            flexibleSpace: ListView(
              children: <Widget>[
                SizedBox(height: 35.0,),
                Text('Establecimientos veterinarios', 
                  textAlign: TextAlign.center, 
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                  )
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.0)
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ingrese veterinaria',
                      border: InputBorder.none,
                      icon: IconButton(onPressed: (){}, icon: Icon(Icons.search),)
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10.0,),),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index){
                return _buildVets(context,index);
              },
              childCount: 3
            ),
          )
        ],
      ),
      bottomNavigationBar: NavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        backgroundColor: colorSec,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildVets(BuildContext context, int index){
    var vet = vets[index % vets.length];
    return Container(
      margin: EdgeInsets.all(20.0),
      child: InkWell(
        onTap: ()=>Navigator.push(context, MaterialPageRoute(
          builder: (_)=>ReservaDetallePage(),
        )),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 145.0,
                    width: double.infinity,
                    child: Image.asset(
                      vet['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20.0,
                    right: 10.0,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      //color: Colors.white,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40.0),
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
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(vet['title'],style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 5.0,),
                    Text('Pequeña descripción'),
                    SizedBox(height: 10.0,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.star, color: Colors.green,),
                        Icon(Icons.star, color: Colors.green,),
                        Icon(Icons.star, color: Colors.green,),
                        Icon(Icons.star, color: Colors.green,),
                        Icon(Icons.star_border, color: Colors.green,),
                        SizedBox(width: 5.0,),
                        Text('(220 reviews)', style: TextStyle(color: Colors.grey),)
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

}
