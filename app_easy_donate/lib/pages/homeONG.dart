import 'package:app_easy_donate/pages/solicitud.dart';
import 'package:app_easy_donate/pages/solicitudONG.dart';
import 'package:flutter/material.dart';
import 'package:app_easy_donate/pages/donatepage.dart';
import 'package:app_easy_donate/pages/helpUs.dart';
import 'package:app_easy_donate/pages/join.dart';
import 'package:app_easy_donate/utilities/MyRoutes.dart';

import 'donateme.dart';
import 'donatemeONG.dart';

class HomeONG extends StatefulWidget {
  const HomeONG({Key? key}) : super(key: key);

  @override
  State<HomeONG> createState() => _HomeONGState();
}

class _HomeONGState extends State<HomeONG> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFF9A826)
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.indigoAccent,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/icon.png'),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.indigoAccent,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "App Easy Donate",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreenAccent),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Pasión por Ayudar",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 20,
              ),
            ),

          
             
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 20,
              ),
            ),


            Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  
                  children: [
                    
                    Column(
                      
                      children: [
                        InkWell(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DonatemePageONG()))
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 40,
                            backgroundImage: AssetImage('assets/donateme.png'),
                          ),
                        ),
                        Text(
                          "Donaciones",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          "Gestión de Donaciones",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        InkWell(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SolicitudPageONG()))
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 40,
                            backgroundImage: AssetImage('assets/donateme.png'),
                          ),
                        ),
                        Text(
                          "Solicitudes",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          "Gestión de Solicitudes",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                  ],
                  ),
  
               
                    


                  
                
              
    
            Container(
                height: 208,
                width: 200,
                child: Image.asset('assets/background.png'))
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => JoinUs()));
                          },
        child: Container(
            color: Color(0xFFF9A826),
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: Text(
              "Únase a la ONG para ayudar",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ))),
      ),
    );
  }
}
