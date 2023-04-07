
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonDetails extends StatefulWidget {
  final pokemonDetail;
  final Color color;
  final int tag;

  const PokemonDetails({super.key, required this.pokemonDetail, required this.color, required this.tag});

  @override
  _PokemonDetailsState createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor:widget.color ,
      body: Stack(
        alignment:Alignment .center,
        children: [
          Positioned(
            top: 30,
            left: 5,
            child: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,),onPressed: (){
              Navigator.pop(context);
            },),
          ),
          Positioned(
              top: 90,
              left: 20,
              child: Text(widget.pokemonDetail['name'],style: const TextStyle(
                color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30,
              ),)),
          Positioned(
              top:126,
              left: 20,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 4.0,bottom: 4.0),
                  child: Text(widget.pokemonDetail['type'].join(','),style: TextStyle(
                      color: Colors.white
                  ),),
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20),),
                  color: Colors.black12,
                ),
              )),

          Positioned(
              top: height*1,
              right: -10,
              child: Image.asset('images/pokeball.png',height: 150,fit: BoxFit.fitWidth,)
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height*0.70,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(30)),
                  color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.start ,
                  children: [
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[

                            Container(
                              width: width * 0.45,
                              child: Row(
                                children: const [
                                  SizedBox(width: 5),
                                  Text("Name", style: TextStyle(color: Colors.blueGrey, fontSize: 20)),
                                ],
                              ),
                            ),Container(
                              width:width *0.2,
                              child: Text(widget.pokemonDetail['name'],style: const TextStyle(
                                  color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold
                              ),),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[

                            Container(
                              width: width * 0.45,
                              child: Row(
                                children: const [
                                  SizedBox(width: 5),
                                  Text("Height", style: TextStyle(color: Colors.blueGrey, fontSize: 20)),
                                ],
                              ),
                            ),Container(
                              width:width *0.2,
                              child: Text(widget.pokemonDetail['height'],style: const TextStyle(
                                  color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold
                              ),),
                            ),
                          ]),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[

                            Container(
                              width: width * 0.45,
                              child: Row(
                                children: const [
                                  SizedBox(width: 5),
                                  Text("Candy", style: TextStyle(color: Colors.blueGrey, fontSize: 20)),
                                ],
                              ),
                            ),Container(
                              width:width *0.2,
                              // ignore: prefer_const_constructors
                              child: Text(widget.pokemonDetail['candy'],style: TextStyle(
                                  color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold
                              ),),
                            ),
                          ]),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[

                            Container(
                              width: width * 0.45,
                              child: Row(
                                children: const [
                                  SizedBox(width: 5),
                                  Text("Weight", style: TextStyle(color: Colors.blueGrey, fontSize: 20)),
                                ],
                              ),
                            ),Container(
                              width:width *0.2,
                              child: Text(widget.pokemonDetail['weight'],style: const TextStyle(
                                  color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold
                              ),),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[

                            Container(
                              width: width * 0.45,
                              child: Row(
                                children: const [
                                  SizedBox(width: 5),
                                  Text("Sp Time", style: TextStyle(color: Colors.blueGrey, fontSize: 20)),
                                ],
                              ),
                            ),Container(
                              width:width *0.2,
                              child: Text(widget.pokemonDetail['spawn_time'],style: const TextStyle(
                                  color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold
                              ),),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[

                            Container(
                              width: width * 0.45,
                              child: Row(
                                children: const [
                                  SizedBox(width: 5),
                                  Text("Weakness", style: TextStyle(color: Colors.blueGrey, fontSize: 20)),
                                ],
                              ),
                            ),Container(
                              width:width *0.3,
                              child: Text(widget.pokemonDetail['weaknesses'].join(','),style: const TextStyle(
                                  color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold
                              ),),
                            ),
                          ]),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: height*0.1,
              left: (width / 2),
              child: CachedNetworkImage(
                imageUrl:widget.pokemonDetail['img'],
                height: 100,
                fit: BoxFit.fitHeight,
              ))
        ],

      ),
    );

  }
}