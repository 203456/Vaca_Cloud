import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Prueba2 extends StatefulWidget {
  const Prueba2({super.key});

  @override
  State<Prueba2> createState() => _Prueba2State();
}

File? images;

class _Prueba2State extends State<Prueba2> {
  TextEditingController _name = TextEditingController();
  TextEditingController _animal = TextEditingController();
  TextEditingController _race = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _birthdate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _name,
                decoration: const InputDecoration(labelText: 'nombre'),
              ),
              TextField(
                controller: _animal,
                decoration: const InputDecoration(labelText: 'animal'),
              ),
              TextField(
                controller: _race,
                decoration: const InputDecoration(labelText: 'race'),
              ),
              TextField(
                controller: _number,
                decoration: const InputDecoration(labelText: 'number'),
              ),
              TextField(
                controller: _birthdate,
                decoration: const InputDecoration(labelText: 'nacimiento'),
              ),
              ElevatedButton(
                onPressed: () {
                  selectImg();
                },
                child: const Text('selecciona una imagen'),
              ),
              ElevatedButton(
                onPressed: () {
                  var data = {
                    "name": _name.text,
                    "animal": _animal.text,
                    "race": _race.text,
                    "number": _number.text,
                    "birthdate": _birthdate.text,
                  };
                  print(data);
                  dioConnect(images!, data);
                },
                child: const Text('Enviar'),
              ),
              images != null
                  ? Image.file(
                      images!,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : FlutterLogo(
                      size: 40,
                    )
            ],
          ),
        ),
      ),
    );
  }

  Future selectImg() async {
    XFile? picture = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (picture == null) {
      return;
    }
    setState(() {
      images = File(picture.path);
    });
  }

  void dioConnect(File images, data) async {
    if (images == null) {
      print('No hay imagen');
      FormData formData = FormData.fromMap({
        "name": data["name"],
        "animal": data["animal"],
        "race": data["race"],
        "number": data["number"],
        "birthdate": data["birthdate"]
      });

      Dio dio = Dio();
      final response = await dio.post(
        "http://3.137.176.225/api/v1/animal/",
        data: formData,
      );

      print(response.data);
    } else {
      var file = await MultipartFile.fromFile(images.path);

      FormData formData = FormData.fromMap({
        "name": data["name"],
        "animal": data["animal"],
        "race": data["race"],
        "number": data["number"],
        "birthdate": data["birthdate"],
        "photo": file
      });
      Dio dio = Dio();
      final response = await dio.post(
        "http://3.137.176.225/api/v1/animal/",
        data: formData,
      );

      print(response.data);
    }
  }
}
