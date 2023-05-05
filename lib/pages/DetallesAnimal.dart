import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vaca_cloud/components/animal.dart';
import 'package:vaca_cloud/pages/CreateAnimal.dart';
import 'package:vaca_cloud/pages/CreateAnimal.dart';
import 'package:vaca_cloud/pages/EditAnimal.dart';
import 'package:vaca_cloud/pages/Prueba.dart';
import 'package:vaca_cloud/services/local_notification_service.dart';

class DetallesAnimal extends StatefulWidget {
  const DetallesAnimal(
      {Key? key,
      required this.animal,
      required this.token,
      required this.userId})
      : super(key: key);
  final Animal animal;
  final String token;
  final int userId;

  @override
  State<DetallesAnimal> createState() => _DetallesAnimalState();
}

class _DetallesAnimalState extends State<DetallesAnimal> {
  int idNotification = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(223, 221, 209, 250),
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                widget.animal.photo!,
                                width: 215.0,
                                height: 215.0,
                                fit: BoxFit.cover,
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            widget.animal.name!,
                            style: const TextStyle(
                                fontSize: 32, color: Colors.black),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    10), // Establecer el radio de la esquina
                                color: Color.fromARGB(68, 63, 72, 33),
                              ),
                              child: SizedBox(
                                  height: 275,
                                  width: 300,
                                  child: Column(
                                    children: [
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(top: 50),
                                          child: Text(
                                            'ANIMAL:               ${widget.animal.animal!}',
                                            style: TextStyle(fontSize: 20),
                                          )),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(top: 25),
                                          child: Text(
                                            'RAZA:                ${widget.animal.race!}',
                                            style: TextStyle(fontSize: 20),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                            top: 25,
                                          ),
                                          child: Text(
                                            'NUMBER:             ${widget.animal.number!}',
                                            style: TextStyle(fontSize: 20),
                                          )),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(top: 26),
                                          child: Text(
                                            'BIRTHDATE:     ${widget.animal.birthdate!}',
                                            style: TextStyle(fontSize: 20),
                                          )),
                                    ],
                                  )),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 40, bottom: 30),
                          child: SizedBox(
                            height: 60,
                            width: 130,
                            child: MaterialButton(
                              color: Color.fromARGB(255, 117, 203, 88),
                              onPressed: () {
                                Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Prueba(
                                              token: widget.token,
                                              userId: widget.userId,
                                            )));
                              },
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Text(
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 250, 250, 250)),
                                'REGRESAR',
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            idNotification = idNotification + 1;
                            print('Aqui ira la local notification');
                            showNotification(
                                idNotification, widget.animal.name);
                          },
                          child: Text(
                            'Agregar evento',
                            style: TextStyle(
                                color: Colors.deepPurple, fontSize: 22.5),
                          ),
                        )
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
