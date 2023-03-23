import 'package:flutter/material.dart';
import 'package:vaca_cloud/pages/Principal.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(223, 221, 209, 250),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only( left: 20, right: 20),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints){
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Column(
                        children:  [
                          Padding( 
                          padding: const EdgeInsets.only(top: 180, left: 20, right: 20),
                            child: Image.asset("assets/images/logo3.png"),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 232, top: 60, bottom: 4),
                            child: Text(
                              style: TextStyle(fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),
                              "Correo electronico"
                            ),
                          ),
                          const Padding(
                            padding:  EdgeInsets.only(bottom: 20),
                            child: TextField(                           
                              decoration: InputDecoration(                               
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(color: Color.fromARGB(134, 115, 57, 231))
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                prefix: Icon(Icons.email),  
                                         
                                hintText: 'Correo electronico', hintStyle: TextStyle(color: Color.fromARGB(151, 156, 152, 152)),    
                                                                                            
                              ),
                            ),
                          ), 
                          const Padding(
                            padding: EdgeInsets.only(right: 245, top: 10, bottom: 4),
                            child: Text(
                              style: TextStyle(fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),
                              "Contraseña"
                            ),
                          ),
                          const Padding(
                            padding:  EdgeInsets.only(bottom: 20),
                            child: TextField(                           
                              decoration: InputDecoration(                               
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(color: Color.fromARGB(133, 84, 73, 235))
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                prefix: Icon(Icons.email),  
                                         
                                hintText: 'Contraseña', hintStyle: TextStyle(color: Color.fromARGB(151, 156, 152, 152)),    
                                                                                            
                              ),
                            ),
                          ), 
                          Padding(                        
                            padding: const  EdgeInsets.only(right: 30.0, left: 30, top: 40), 
                            child: SizedBox(
                              height: 50,
                              width: 350,
                              child:MaterialButton(
                                color: Color.fromARGB(255, 104, 91, 227),
                                onPressed: () {
                                  Navigator.push(
                                    context, 
                                    MaterialPageRoute(
                                    builder: (_) => const Principal()
                                    )
                                  );
                                },
                                shape: RoundedRectangleBorder(
                                side: const BorderSide(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                                child: const Text(
                                  style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 250, 250, 250)),
                                  'Enviar solicitud', 
                                ),
                                
                              ) ,
                            )
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