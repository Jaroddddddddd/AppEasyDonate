import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:app_easy_donate/model/donate.dart';

class DetailsDonate extends StatelessWidget {
  final Donate donate;

  const DetailsDonate({Key? key, required this.donate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Mis Donaciones', style: TextStyle(
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
              Text('Tipo de Articulos: ${donate.tipodonation}', style: fromTextStyle),
              const SizedBox(height: 10.0),
              const Divider(color: primaryColor),
              const SizedBox(height: 10.0),
              Text('Fecha y Hora: '+donate.date+ '  -  '+donate.time, style: dateTextStyle),
              const SizedBox(height: 5.0),
              const Divider(color: primaryColor),
              const SizedBox(height: 10.0),
              Text('Dirección: '+donate.direccion, style: alimentosTextStyle),
              const SizedBox(height: 5.0),
              const Divider(color: primaryColor),
              const SizedBox(height: 10.0),
              Text('Cantidad: '+donate.cantidad.toString(), style: alimentosTextStyle),
              const SizedBox(height: 5.0),
              const Divider(color: primaryColor),
              const SizedBox(height: 10.0),
              Text('Descripción:  \n' +donate.descripcion, style: bodyTextStyle),
            ],
          ),
        ));
  }
}
