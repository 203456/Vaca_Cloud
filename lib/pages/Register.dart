import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vaca_cloud/pages/Prueba.dart';
import 'package:dio/dio.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _username = TextEditingController();
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
                          padding:
                              EdgeInsets.only( top: 50, bottom: 4),
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
                              "Nombre de usuario"),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextField(

                            decoration:  InputDecoration(
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
                              hintText: 'Nombre de usuario',
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
                              "Correo electrónico"),
                        ),
                       const  Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextField(

                            obscureText: true,
                            decoration:  InputDecoration(
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
                              hintText: 'Correo electrónico',
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
                        const Padding(
                          padding:  EdgeInsets.only(bottom: 20),
                          child: TextField(

                            obscureText: true,
                            decoration:  InputDecoration(
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
                        const Padding(
                          padding:
                              EdgeInsets.only(right: 175, top: 10, bottom: 4),
                          child: Text(
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              "Confirma la contraseña"),
                        ),
                        const Padding(
                          padding:  EdgeInsets.only(bottom: 20),
                          child: TextField(

                            obscureText: true,
                            decoration:  InputDecoration(
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
                              hintText: 'Confirma la contraseña',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(151, 156, 152, 152)),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                              right: 25.0, left: 30, top: 30, bottom: 30),
                            child: Row(
                              children: [
                              SizedBox(
                                height: 60,
                                width: 150,
                                child: MaterialButton(
                                  color: Color.fromARGB(255, 117, 203, 88),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>  Register()
                                        )
                                      );
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
                                    'CANCELAR',
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 10),
                              child: SizedBox(
                                  height: 60,
                                  width: 150,
                                  child: MaterialButton(
                                    color: Color.fromARGB(255, 104, 91, 227),
                                    onPressed: () {
                                      
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
}