import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart';
import 'package:vaca_cloud/pages/Prueba.dart';
import 'package:dio/dio.dart';
import 'package:vaca_cloud/pages/Register.dart';


class Login extends StatefulWidget {
  const Login({super.key});
  


  @override
  State<Login> createState() => _LoginState();


  

}

class _LoginState extends State<Login> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  
  late TapGestureRecognizer tapGestureRecognizer;
  
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
                              top: 180, left: 20, right: 20),
                          child: Image.asset("assets/images/logo3.png"),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(right: 232, top: 60, bottom: 4),
                          child: Text(
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              "Username"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: _username,
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
                              hintText: 'username',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(151, 156, 152, 152)),
                            ),
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(right: 245, top: 10, bottom: 4),
                          child: Text(
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              "Contraseña"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
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
                                right: 30.0, left: 30, top: 40),
                            child: SizedBox(
                              height: 50,
                              width: 350,
                              child: MaterialButton(
                                color: Color.fromARGB(255, 104, 91, 227),
                                onPressed: () {
                                  print(_password.text);
                                  print(_username.text);
                                  if (_password.text == '' &&
                                      _username.text == '') {
                                    _showAlertDialog("Acceso deGANADO",
                                        "Por favor llene todo los campos");
                                  } else {
                                    var data = {
                                      "username": _username.text,
                                      "password": _password.text,
                                    };
                                    dioConnect(data);
                                  }
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
                            )
                          ),
                        Padding(padding: EdgeInsets.only(top: 20),
                        child: InkWell( // child tapped will fire onTap
                          child: RichText(
                            text: const TextSpan(text: '¿Aun no tienes cuenta?', style:TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18)),
                          ),
                          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Register())),
                          // ↑ Navigate to new page here
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

  void dioConnect(data) async {
    FormData formData = FormData.fromMap({
      "username": data["username"],
      "password": data["password"],
    });

    Dio dio = Dio();
    try {
      final response = await dio.post(
        "http://3.12.155.9/api/v1/login/",
        data: formData,
      );
      print(response.data);
      String Token = response.data["token"];
      int userID = response.data["user_id"];
      print(Token);

      Navigator.push(
          context, MaterialPageRoute(builder: (_) => Prueba(token: Token,userId: userID,)));
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 400) {
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
}
