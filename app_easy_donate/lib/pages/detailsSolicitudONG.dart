import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:app_easy_donate/model/solicitud.dart';

class DetailsSolicitudONG extends StatelessWidget {
  final Solicitud solicitud;

  const DetailsSolicitudONG({Key? key, required this.solicitud}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Mis Solicitudes', style: TextStyle(
          color: primaryColor,
          fontSize: 30,
          fontWeight: FontWeight.bold
          )
          ),
        
        backgroundColor: Colors.white, elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        
      
      
      ),
      
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Solicitante: ${solicitud.nombre}', style: fromTextStyle),
              const SizedBox(height: 10.0),
              const Divider(color: primaryColor),
              const SizedBox(height: 10.0),
              Text(solicitud.direccion, style: dateTextStyle),
              const SizedBox(height: 5.0),
              const Divider(color: primaryColor),
              const SizedBox(height: 10.0),
              Text(solicitud.descripcion, style: bodyTextStyle),


                const SizedBox(height: 30),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () {},
                child: const Text('Aprobar', style: TextStyle( 
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                 style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                onPressed: () {},
                child: const Text('Rechazar', style: TextStyle( 
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              ),




            ],
          ),
        ));
  }
}
