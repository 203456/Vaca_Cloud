import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vaca_cloud/components/animal.dart';
import 'package:vaca_cloud/pages/Prueba2.dart';

class DetallesAnimal extends StatefulWidget {
  const DetallesAnimal({super.key, required this.animal});
  final Animal animal;
  

  @override
  State<DetallesAnimal> createState() => _DetallesAnimalState();
}

class _DetallesAnimalState extends State<DetallesAnimal> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    padding: const EdgeInsets.only(top: 24),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [ 
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 20),
                                ),
                                onPressed: null,
                                child: const Text('Agregar imagen'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 100),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: null,
                                  child: const Text('Agregar imagen'),
                                ),
                              )
                            ],
                          ),
                        ),
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
                              prefix: const Icon(Icons.email),
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
                              prefix: const Icon(Icons.email),
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
                              prefix: const Icon(Icons.email),
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
                              prefix: const Icon(Icons.email),
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
                              prefix: const Icon(Icons.email),
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
                              prefix: const Icon(Icons.email),
                              hintText: widget.animal.name,
                              hintStyle: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(149, 0, 0, 0)),
                              ),
                            ),
                          )
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                right: 30.0, left: 30, top: 40),
                            child: SizedBox(
                              height: 50,
                              width: 350,
                              child: MaterialButton(
                                color: Color.fromARGB(255, 104, 91, 227),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Prueba2()));
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
                                  'Enviar solicitud',
                                ),
                              ),
                            )),
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
