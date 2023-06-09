import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemonapi/details_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var pokemonapi="https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  late List pokedex = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
      fetchData();
    }
  }
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/backgroundwallpaper.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(''),
                ),
              ),
              Positioned(
                  top: -20,
                  right: -50,
                  child: Image.asset('images/pokeball.png', width: 220,fit: BoxFit.fitWidth ,)
              ),

              Positioned(
                  top: 60,
                  left: 20,
                  child: Container(
                      width: width*0.9,
                      height:height*0.07 ,
                      color: Color(0xFF0E3311).withOpacity(0.3),
                      child: Image.asset('images/pokemons.png',))),

              Positioned(
                top: 120,
                bottom: 0,
                width: width,
                child: Column(
                  children: [
                    Expanded(child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                    ),itemCount: pokedex.length,
                      itemBuilder:(context,index){
                        var type=pokedex[index]['type'][0];
                        return InkWell(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal:12 ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: type=='Grass'? Colors.teal : type=="Fire"?Colors.red : type =="Water" ? Colors.lightBlue : type =="Bug" ? Colors.orange : type =="Psychic" ? Colors.deepPurple : type =="Electric" ? Colors.deepOrangeAccent : type =="Poison" ? Colors.deepPurpleAccent : type =="Normal" ? Colors.indigo : type =="Ground" ? Colors.brown : type =="Rock" ? Colors.cyan:Colors.pink,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Stack(
                                  children: [
                                    Positioned(
                                        bottom:-6,
                                        right: 110,
                                        child: Image.asset('images/pokemonball2.png',
                                          height:50,
                                          fit: BoxFit.fitHeight ,)),

                                    Positioned(

                                      child: Padding(

                                        padding: const EdgeInsets.only(left: 10,right: 8.0,top: 10,bottom: 4),
                                        child: Text(
                                          pokedex[index]['name'],
                                          //textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      top: 33,
                                      left: 10,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 5,bottom: 4),
                                          child: Text(
                                            type.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          color: Colors.black12,

                                        ),
                                      ),
                                    ),

                                    Positioned(
                                        bottom: 5,
                                        right: 5,
                                        child: CachedNetworkImage(imageUrl: pokedex[index]['img'],height: 80,fit: BoxFit.fitHeight,)),
                                  ]
                              ),

                            ),
                          ),
                          onTap: (){
                            //TODO Navigate to detail screen describe each pokemon :)
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>Details(pokemonDetail: pokedex[index], color: type=='Grass'? Colors.teal : type=="Fire"?Colors.red : type =="Water" ? Colors.lightBlue : type =="Bug" ? Colors.orange : type =="Psychic" ? Colors.deepPurple : type =="Electric" ? Colors.deepOrangeAccent : type =="Poison" ? Colors.deepPurpleAccent : type =="Normal" ? Colors.indigo : type =="Ground" ? Colors.brown : type =="Rock" ? Colors.cyan:Colors.pink,

                                tag: index)));
                          },


                        );
                      } ,
                    ),
                    ),
                  ],
                ),
              ),
            ]
        )
    );
  }
  void fetchData(){
    var url = Uri.https('raw.githubusercontent.com', '/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    http.get(url).then((value) {
      if(value.statusCode==200){
        var decodedJsonData=jsonDecode(value.body);
        pokedex=decodedJsonData['pokemon'];
        print(pokedex[0]['name']);
        setState(() {

        });

      }

    });

  }
}