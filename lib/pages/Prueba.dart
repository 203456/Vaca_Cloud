import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:vaca_cloud/components/app_button.dart';
import 'package:vaca_cloud/models/animal_models.dart';
import 'package:vaca_cloud/components/animal.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:vaca_cloud/pages/CreateAnimal.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'DetallesAnimal.dart';
import 'EditAnimal.dart';
import 'Login.dart';

class Prueba extends StatefulWidget {
  final String token;
  final int userId;

  const Prueba({Key? key, required this.token, required this.userId})
      : super(key: key);

  Future<http.Response> fetchAlbum() {
    return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  }

  @override
  State<Prueba> createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  List<Animal>? animalsList;
  double? scrolledUnderElevation;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var response = await BaseClient(widget.token, widget.userId.toString())
        .get('')
        .catchError((err) {});
    if (response == null) return;
    debugPrint('successful:');
    var animals = animalFromJson(response);
    debugPrint('Animal count: ${animals.length}');
    for (var animal in animals) {
      debugPrint(animal.name);
    }
    setState(() {
      animalsList = animals;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.cow),
          backgroundColor: Color.fromARGB(210, 169, 199, 250),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateAnimal(
                        token: widget.token,
                        userId: widget.userId,
                      )),
            );
          },
        ),
        backgroundColor: const Color.fromARGB(223, 221, 209, 250),
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset(
              "./assets/images/farm.webp",
              width: 45,
              height: 45,
            ),
          ),
          actions: [
            Container(
                margin: const EdgeInsets.only(top: 25, right: 10),
                child: Text(
                  'Numero de animales: ${animalsList?.length}',
                  style: const TextStyle(fontSize: 18),
                ))
          ],
          backgroundColor: Color.fromARGB(115, 88, 27, 241),
          scrolledUnderElevation: scrolledUnderElevation,
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text(
                  "Cerrar sesion",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const Login()),
                      (route) => false);
                },
              ),
              SizedBox(height: 10),
              if (animalsList != null)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: animalsList!
                          .map((animal) => GestureDetector(
                                onDoubleTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetallesAnimal(
                                                animal: animal,
                                                token: widget.token,
                                                userId: widget.userId,
                                              )));
                                },
                                child: Container(
                                  width:
                                      350.0, // Ancho personalizado de la Card
                                  height:
                                      350.0, // Altura personalizada de la Card
                                  padding: EdgeInsets.all(
                                      16.0), // Espacio externo personalizado
                                  child: Card(
                                    color: Color.fromARGB(185, 221, 209, 250),
                                    child: Center(
                                      // Agregamos un Center widget aquí
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center, // Alinear verticalmente al centro
                                        children: [
                                          if (animal.photo != null)
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              child: Image.network(
                                                '${animal.photo}',
                                                width: 215.0,
                                                height: 215.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          Text(
                                            ' ${animal.name!}',
                                            style: const TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            '${animal.animal!}',
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          Text(
                                            '${animal.race!}',
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          // Aquí puede agregar más widgets para mostrar otros datos de cada animal, como su raza, peso, color, etc.
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                )
            ],
          ),
        )));
  }
}
