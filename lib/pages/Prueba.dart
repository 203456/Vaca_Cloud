import 'package:flutter/material.dart';
import 'package:vaca_cloud/components/app_button.dart';
import 'package:vaca_cloud/models/animal_models.dart';
import 'package:vaca_cloud/components/animal.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';

class Prueba extends StatefulWidget {
  const Prueba({super.key});
  Future<http.Response> fetchAlbum() {
    return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  }

  @override
  State<Prueba> createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  List<Animal>? animalsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        children: [
          AppButton(
            operation: 'GET',
            operationColor: Colors.lightGreen,
            description: 'Fetch users',
            onPressed: () async {
              var response = await BaseClient().get('').catchError((err) {});
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
            },
          ),
          AppButton(
            operation: 'POST',
            operationColor: Colors.lightBlue,
            description: 'Add animal',
            onPressed: () async {
              var animal = Animal(
                name: 'Doris',
                animal: 'Pescado',
                race: 'azul',
                number: '001',
              );
              print(animal.name);

              var response =
                  await BaseClient().post('', animal).catchError((err) {});
              if (response == null) return;
              debugPrint('successful:');
            },
          ),
          SizedBox(height: 10),
          if (animalsList != null)
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: animalsList!
                    .map((animal) => Card(
                          child: Column(
                            children: [
                              if (animal.photo != null)
                                Image.network(
                                    '${animal.photo}'),
                              Text(animal.name!),
                              Text(animal.animal!),
                              Text(animal.race!),
                              // Aquí puede agregar más widgets para mostrar otros datos de cada animal, como su raza, peso, color, etc.
                            ],
                          ),
                        ))
                    .toList(),
              ),
            )),
        ],
      ),
    )));
  }
}
