import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});
  

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
    
  double? scrolledUnderElevation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        leading:Padding(padding: const EdgeInsets.only(left: 20),
          child: Image.asset("./assets/images/farm.webp", width: 45, height: 45,),
          
        ),
        backgroundColor: Color.fromARGB(115, 88, 27, 241),
        scrolledUnderElevation: scrolledUnderElevation, 
      ),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(10),
          children: <Widget> [
            Container(color: Colors.green),
            Container(color: Colors.green),
            Container(color: Colors.green),
            Container(color: Colors.green),
            Container(color: Colors.green),
            Container(color: Colors.green),
            Container(color: Colors.green),
            Container(color: Colors.green),
            Container(color: Colors.green),
            Container(color: Colors.green),
            Container(color: Colors.green),
            Container(color: Colors.green),
            
          ],
        )
      ),
    );
  }
}