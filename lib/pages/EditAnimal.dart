import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vaca_cloud/components/animal.dart';
import 'package:vaca_cloud/pages/CreateAnimal.dart';
import 'package:vaca_cloud/pages/CreateAnimal.dart';

class EditAnimal extends StatefulWidget {
  const EditAnimal({Key? key, required this.animal,required this.token, required this.userId}): super(key: key);
  final Animal animal;
  final String token;
  final int userId;


  
  
  

  @override
  State<EditAnimal> createState() => _EditAnimalState();
}

class _EditAnimalState extends State<EditAnimal> {
  
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
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [ 
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18
                                  ),
                                ),
                                onPressed:(){       
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAnimal( token: widget.token,userId: widget.userId, )));
                                },
                                child: const Text('AGREGAR IMAGEN'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18
                                      ),
                                  ),
                                  onPressed: null,
                                  child: const Text('ELIMINAR IMAGEN'),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                          top: 20, left: 20, right: 20),
                          child:ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(widget.animal.photo!,
                              width: 215.0,
                              height: 215.0,
                              fit: BoxFit.cover,
                            ),
                          ) 
                        ),

                         Padding(
                          padding:const EdgeInsets.only(top:35,bottom: 20),
                          child: SizedBox( 
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(134, 115, 57, 231))),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              hintText: widget.animal.name,
                              hintStyle: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(149, 0, 0, 0)),
                              ),
                            ),
                          )
                        ),
                        Padding(
                          padding:const EdgeInsets.only(bottom: 20),
                          child: SizedBox( 
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(
                                      color:
                                        Color.fromARGB(134, 115, 57, 231))),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              hintText: widget.animal.animal,
                              hintStyle: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(149, 0, 0, 0)),
                              ),
                            ),
                          )
                        ),
                        Padding(
                          padding:const EdgeInsets.only(bottom: 20),
                          child: SizedBox( 
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(134, 115, 57, 231))),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              hintText: widget.animal.race,
                              hintStyle: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(149, 0, 0, 0)),
                              ),
                            ),
                          )
                        ),
                        Padding(
                          padding:const EdgeInsets.only(bottom: 20),
                          child: SizedBox( 
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(134, 115, 57, 231))),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              hintText: widget.animal.number,
                              hintStyle: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(149, 0, 0, 0)),
                              ),
                            ),
                          )
                        ),
                         Padding(
                          padding:const EdgeInsets.only(bottom: 20),
                          child: SizedBox( 
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(134, 115, 57, 231))),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              hintText: widget.animal.birthdate,
                              hintStyle: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(149, 0, 0, 0)),
                              ),
                            ),
                          )
                        ),
                        
                        Padding(
                          padding:const EdgeInsets.only(bottom: 20),
                          child: SizedBox( 
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(134, 115, 57, 231))),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              hintText: widget.animal.name,
                              hintStyle: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(149, 0, 0, 0)),
                              ),
                            ),
                          )
                        ),
                        Padding(padding: EdgeInsets.only(top: 10),
                          child: TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20
                                    ),
                                  ),
                                  onPressed: null,
                                  child: const Text("AGREGAR EVENTO"),
                                ),
                            ),
                        Padding(
                            padding: const EdgeInsets.only(
                              right: 25.0, left: 40, top: 20, bottom: 30),
                            child: Row(
                              children: [
                              SizedBox(
                                height: 60,
                                width: 130,
                                child: MaterialButton(
                                  color: Color.fromARGB(255, 117, 203, 88),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>  CreateAnimal(token: widget.token,userId: widget.userId,)
                                        )
                                      );
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
                              Padding(padding: EdgeInsets.only(left: 10),
                              child: SizedBox(
                                  height: 60,
                                  width: 140,
                                  child: MaterialButton(
                                    color: Color.fromARGB(255, 104, 91, 227),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>  CreateAnimal(token: widget.token,userId: widget.userId,)
                                          )
                                        );
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
                                      'ACTUALIZAR',
                                    ),
                                  ),
                                ),
                              )
                              
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
