import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vaca_cloud/components/animal.dart';
import 'package:vaca_cloud/pages/CreateAnimal.dart';
import 'package:vaca_cloud/pages/CreateAnimal.dart';
import 'package:vaca_cloud/pages/EditAnimal.dart';
import 'package:vaca_cloud/pages/Prueba.dart';

class DetallesAnimal extends StatefulWidget {
  const DetallesAnimal({Key? key, required this.animal,required this.token, required this.userId}): super(key: key);
  final Animal animal;
  final String token;
  final int userId;


  
  
  

  @override
  State<DetallesAnimal> createState() => _DetallesAnimalState();
}

class _DetallesAnimalState extends State<DetallesAnimal> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(223, 221, 209, 250),
      appBar: AppBar(
        title: Text(widget.animal.name!),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                          top: 40, left: 20, right: 20),
                          child:ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(widget.animal.photo!,
                              width: 215.0,
                              height: 215.0,
                              fit: BoxFit.cover,
                            ),
                          ) 
                        ),
                        Padding(padding: const EdgeInsets.only(top: 20),
                          child: Text(widget.animal.name!,style: const TextStyle(fontSize: 32, color: Colors.black),),
                        ),
                        Padding(padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10), // Establecer el radio de la esquina
                              color: Color.fromARGB(68, 63, 72, 33),
                            ),
                            child: SizedBox(
                              
                              height: 275,
                              width: 300,                                                         
                              child:
                                Column(
                                  children: [
                                    Padding(padding:const EdgeInsets.only(top: 50),
                                        child: Text('ANIMAL:               ${widget.animal.animal!}', style: TextStyle(fontSize: 20),)
                                    ),
                                    Padding(padding: const EdgeInsets.only(top: 25),
                                        child: Text('RAZA:                ${widget.animal.race!}',style: TextStyle(fontSize: 20),)
                                    ),
                                    Padding(padding: const EdgeInsets.only(top: 25,),
                                        child: Text('NUMBER:             ${widget.animal.number!}',style: TextStyle(fontSize: 20),)
                                    ),
                                    Padding(padding: const EdgeInsets.only(top: 26),
                                        child: Text('BIRTHDATE:     ${widget.animal.birthdate!}',style: TextStyle(fontSize: 20),)
                                    ),
                                  ],
                              )
                            ),
                          )
                        ),




                        Padding(
                            padding: const EdgeInsets.only(
                              right: 25.0, left: 120, top: 40, bottom: 30),
                            child: Row(
                              children: [
                              SizedBox(
                                height: 60,
                                width: 130,
                                child: MaterialButton(
                                  color: Color.fromARGB(255, 117, 203, 88),
                                  onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Prueba(token: widget.token,userId: widget.userId,)));
                                      
                                  },
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Text(
                                    style: TextStyle(
                                        fontSize: 18,
                                        color:
                                          Color.fromARGB(255, 250, 250, 250)),
                                    'REGRESAR',
                                  ),
                                ),
                              ),                             
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
