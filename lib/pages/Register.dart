import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vaca_cloud/pages/Login.dart';
import 'package:vaca_cloud/pages/Prueba.dart';
import 'package:dio/dio.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _name = TextEditingController();
  TextEditingController _last_name = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(223, 221, 209, 250),
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
                          padding: const EdgeInsets.only(
                              top: 40, left: 20, right: 20),
                          child: Image.asset("assets/images/logo3.png"),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 50, bottom: 4),
                          child: Text(
                              style: TextStyle(
                                  fontSize: 36,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              "R E G I S T R A T E"),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(right: 210, top: 20, bottom: 4),
                          child: Text(
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              "Ingrese su nombre"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: _name,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(134, 115, 57, 231))),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              prefix: Icon(Icons.person),
                              hintText: 'Nombre',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(151, 156, 152, 152)),
                            ),
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(right: 225, top: 10, bottom: 4),
                          child: Text(
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              "Ingrese su apellido"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: _last_name,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(133, 84, 73, 235))),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              prefix:
                                  Icon(Icons.face_retouching_natural_outlined),
                              hintText: 'Apellido',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(151, 156, 152, 152)),
                            ),
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(right: 140, top: 10, bottom: 4),
                          child: Text(
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              "Ingrese su nombre de usuario"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: _username,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(133, 84, 73, 235))),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              prefix: Icon(Icons.face_retouching_natural),
                              hintText: 'Nombre de usuario',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(151, 156, 152, 152)),
                            ),
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(right: 145, top: 10, bottom: 4),
                          child: Text(
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              "Ingrese su correo electronico"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: _email,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(133, 84, 73, 235))),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              prefix: Icon(Icons.email),
                              hintText: 'Correo electronico',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(151, 156, 152, 152)),
                            ),
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(right: 185, top: 10, bottom: 4),
                          child: Text(
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              "Ingrese su contraseña"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: _password,
                            obscureText: true,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(133, 84, 73, 235))),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              prefix: Icon(Icons.lock),
                              hintText: 'Contraseña',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(151, 156, 152, 152)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 25.0, left: 30, top: 30, bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 60,
                                width: 110,
                                child: MaterialButton(
                                  color: Color.fromARGB(255, 117, 203, 88),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Login()));
                                  },
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Text(
                                    style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(255, 250, 250, 250)),
                                    'CANCELAR',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: SizedBox(
                                  height: 60,
                                  width: 110,
                                  child: MaterialButton(
                                    color: Color.fromARGB(255, 104, 91, 227),
                                    onPressed: () {
                                      print(_name.text);
                                      print(_last_name.text);
                                      print(_username.text);
                                      print(_password.text);
                                      print(_email.text);
                                      if (_password.text == '' ||
                                          _username.text == '' ||
                                          _name.text == '' ||
                                          _email.text == '' ||
                                          _last_name.text == '') {
                                        _showAlertDialog("Datos faltantes",
                                            "Por favor llene todo los campos");
                                      } else {
                                        var data = {
                                          "first_name": _name.text,
                                          "last_name": _last_name.text,
                                          "username": _username.text,
                                          "email": _email.text,
                                          "password": _password.text,
                                        };
                                        dioPost(data);
                                      }
                                    },
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Text(
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color.fromARGB(
                                              255, 250, 250, 250)),
                                      'REGISTRARSE',
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

  void dioPost(data) async {
    FormData formData = FormData.fromMap({
      "first_name": data["first_name"],
      "last_name": data["last_name"],
      "email": data["email"],
      "username": data["username"],
      "password": data["password"],
    });
    print("Se entro al post");

    Dio dio = Dio();
    try {
      final response = await dio.post(
        "http://3.16.215.229/api/v1/register/",
        data: formData,
      );
      print(response.data);
      _showAlertDialog2("Usuario creado", "Por favor inicie sesion");
    } catch (e) {
      print("Error");
      print(e);
      if (e is DioError) {
        print(e.response!.data);
        if (e.response?.statusCode == 400) {
          _showAlertDialog("Acceso deGANADO", "${e.response!.data}");
          print("Bad request error: ${e.response!.data}");
        }
        if (e.response?.statusCode == 404) {
          _showAlertDialog("Acceso deGANADO", "Credenciales invalidas");
          print("Bad request error: ${e.response!.data}");
        }
      }
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
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _showAlertDialog2(String title, String content) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              ElevatedButton(
                child: Text(
                  "Iniciar sesion",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const Login()),
                      (route) => false);
                },
              )
            ],
          );
        });
  }
}
