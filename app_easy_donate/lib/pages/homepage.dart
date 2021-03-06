import 'package:app_easy_donate/pages/solicitud.dart';
import 'package:flutter/material.dart';
import 'package:app_easy_donate/pages/donatepage.dart';
import 'package:app_easy_donate/pages/helpUs.dart';
import 'package:app_easy_donate/pages/join.dart';
import 'package:app_easy_donate/utilities/MyRoutes.dart';

import 'donateme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  "Pasi??n por Ayudar",
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
                                builder: (context) => DonatePage()))
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 40,
                        backgroundImage: AssetImage('assets/donate.png'),
                      ),
                    ),
                    Text(
                      "Donar",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Text(
                      "Donar a una ONG",
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HelpUs()));
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 40,
                        backgroundImage: AssetImage('assets/help.png'),
                      ),
                    ),
                    Text(
                      "Solicitar Ayuda",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Text(
                      "Necesito ayuda de una ONG",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
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
                                    builder: (context) => DonatemePage()))
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 40,
                            backgroundImage: AssetImage('assets/donateme.png'),
                          ),
                        ),
                        Text(
                          "Mis Donaciones",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          "Mis donaciones a una ONG",
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
                                    builder: (context) => SolicitudPage()))
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 40,
                            backgroundImage: AssetImage('assets/donateme.png'),
                          ),
                        ),
                        Text(
                          "Mis Solicitudes",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          "Mis solicitudes a una ONG",
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
              "??nase a la ONG para ayudar",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ))),
      ),
    );
  }
}
