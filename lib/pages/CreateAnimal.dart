import 'dart:io';
import 'package:date_field/date_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vaca_cloud/pages/Prueba.dart';

class CreateAnimal extends StatefulWidget {
  final String token;
  final int userId;

  const CreateAnimal({Key? key, required this.token, required this.userId})
      : super(key: key);

  @override
  State<CreateAnimal> createState() => _CreateAnimalState();
}

File? images;

class _CreateAnimalState extends State<CreateAnimal> {
  DateTime? selectedDate;
  String year = '';
  String month = '';
  String day = '';
  TextEditingController _name = TextEditingController();
  TextEditingController _animal = TextEditingController();
  TextEditingController _race = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _birthdate = TextEditingController();
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
                          padding: const EdgeInsets.only(left: 87, top: 30),
                          child: Row(
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                onPressed: () {
                                  selectImg();
                                },
                                child: const Text('AGREGAR IMAGEN'),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 20, right: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: images != null
                                  ? Image.file(
                                      images!,
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      "assets/images/predeterminado.jpeg",
                                      width: 215.0,
                                      height: 215.0,
                                      fit: BoxFit.cover,
                                    ),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 35, bottom: 20),
                            child: SizedBox(
                              height: 50,
                              child: TextField(
                                controller: _name,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              134, 115, 57, 231))),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  hintText: "NOMBRE",
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(149, 0, 0, 0)),
                                ),
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                              height: 50,
                              child: TextField(
                                controller: _animal,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              134, 115, 57, 231))),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  hintText: "ANIMAL",
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(149, 0, 0, 0)),
                                ),
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                              height: 50,
                              child: TextField(
                                controller: _race,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white, // C
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              134, 115, 57, 231))),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  hintText: "RAZA",
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(149, 0, 0, 0)),
                                ),
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                              height: 50,
                              child: TextField(
                                controller: _number,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              134, 115, 57, 231))),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  hintText: "NUMERO",
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(149, 0, 0, 0)),
                                ),
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                              height: 50,
                              child: TextField(
                                controller: _birthdate,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              134, 115, 57, 231))),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  hintText: "DIA DE NACIMIENTO",
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(149, 0, 0, 0)),
                                ),
                              ),
                            )),
                        DateTimeField(
                            mode: DateTimeFieldPickerMode.date,
                            decoration: const InputDecoration(
                                hintText:
                                    'Please select your birthday date and time'),
                            selectedDate: selectedDate,
                            onDateSelected: (DateTime value) {
                              setState(() {
                                selectedDate = value;
                                year = selectedDate!.year.toString();
                                month = selectedDate!.month.toString();
                                day = selectedDate!.day.toString();
                              });
                            }),
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
                                            builder: (_) => Prueba(
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
                                        color:
                                            Color.fromARGB(255, 250, 250, 250)),
                                    'REGRESAR',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: SizedBox(
                                  height: 60,
                                  width: 140,
                                  child: MaterialButton(
                                    color: Color.fromARGB(255, 104, 91, 227),
                                    onPressed: () {
                                      String formattedDate = selectedDate!
                                          .toIso8601String()
                                          .substring(0, 10);
                                      var data = {
                                        "name": _name.text,
                                        "animal": _animal.text,
                                        "race": _race.text,
                                        "number": _number.text,
                                        "birthdate": formattedDate,
                                      };

                                      dioConnect(images!, data);
                                    },
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Text(
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color.fromARGB(
                                              255, 250, 250, 250)),
                                      'SUBIR',
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
    String token = widget.token;
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

      final response = await dio.post("http://3.12.155.9/api/v1/animal/",
          data: formData,
          options: Options(headers: {
            'Authorization': 'Token $token',
          }));

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
      final response = await dio.post("http://3.12.155.9/api/v1/animal/",
          data: formData,
          options: Options(headers: {
            'Authorization': 'Token $token',
          }));
      _showAlertDialog("Exito", "Animal nuevo guardado");
      print(response.data);
    }
  }

  void _showAlertDialog(String title, String content) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              ElevatedButton(
                child: Text(
                  "CERRAR",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Prueba(
                        token: widget.token,
                        userId: widget.userId,
                      ),
                    ),
                  );
                },
              )
            ],
          );
        });
  }
}
