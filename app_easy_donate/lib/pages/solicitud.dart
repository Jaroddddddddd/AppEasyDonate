import 'package:app_easy_donate/model/solicitud.dart';
import 'package:app_easy_donate/model/backend.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_easy_donate/utilities/MyRoutes.dart';
import '../constants.dart';
import '../model/backend.dart';
import '../widget/SolicitudWidget.dart';
import '../constants.dart';
import 'detailsSolicitud.dart';
import 'join.dart';

List<Solicitud> solicitudes=Backend().getSolicitudes();

class SolicitudPage extends StatefulWidget {
  @override
  State<SolicitudPage> createState() => _SolicitudPageState();
}

class _SolicitudPageState extends State<SolicitudPage> {
  // const DonatePage({Key? key}) : super(key: key);
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  double _currentSliderValue = 10;

  moveToSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.submitRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

var solicitudes = Backend().getSolicitudes();

  void markSolicitudesAsRead(int id) {
    Backend().markSolicitudesAsRead(id);
    setState(() {
      solicitudes = Backend().getSolicitudes();
    });
  }

  void deleteSolicitudes(int id) {
    Backend().deleteSolicitudes(id);
    setState(() {
      solicitudes = Backend().getSolicitudes();
    });
  }

  void showDetail(Solicitud solicitud) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailsSolicitud(solicitud: solicitud);
    }));

    Backend().markSolicitudesAsRead(solicitud.id);
    setState(() {
      solicitudes = Backend().getSolicitudes();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
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
      
        
      
      body: (
      
        ListView.separated(
          itemCount: solicitudes.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(
            color: primaryColor,
            indent: 40.0,
            endIndent: 20.0,
          ),
          itemBuilder: (BuildContext context, int index) => SolicitudesWidget(
            solicitud: solicitudes[index],
            onTap: showDetail,
            onLongPress: markSolicitudesAsRead,
            onSwipe: deleteSolicitudes,
            
            ),

        
        
        )
        ),
        );
     
        
   
  }
}
