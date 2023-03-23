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
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: 
      Center(
        child:  Column(
          children: [
              AppButton(
                operation: 'GET',
                operationColor: Colors.lightGreen,
                description: 'Fetch users',
                onPressed: () async {
                  var response = await BaseClient().get('').catchError((err) {});
                  if (response == null) return;
                  debugPrint('successful:');
                  var users = animalFromJson(response);
                  debugPrint('Animal count: ${users.length}');
                   
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

                  var response = await BaseClient().post('', animal).catchError((err) {});
                  if (response == null) return;
                  debugPrint('successful:');
                },
              ),
          ],
        ),
      ))
    );
  }
}