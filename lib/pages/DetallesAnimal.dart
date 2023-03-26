import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vaca_cloud/components/animal.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.animal.race!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(widget.animal.birthdate!),
          ],
        ),
      ),
    );
  }
}
