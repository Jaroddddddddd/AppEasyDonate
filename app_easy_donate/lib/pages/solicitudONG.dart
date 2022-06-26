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
import 'detailsSolicitudONG.dart';
import 'join.dart';

List<Solicitud> solicitudes=Backend().getSolicitudes();

class SolicitudPageONG extends StatefulWidget {
  @override
  State<SolicitudPageONG> createState() => _SolicitudPageONGState();
}

class _SolicitudPageONGState extends State<SolicitudPageONG> {
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
      return DetailsSolicitudONG(solicitud: solicitud);
    }));

    Backend().markSolicitudesAsRead(solicitud.id);
    setState(() {
      solicitudes = Backend().getSolicitudes();
    });
  }

  static const _myTabs = <Tab>[
    Tab(text: 'Peticiones'),
    Tab(text: 'Aprobadas'),
  ];

Widget build(BuildContext context) => 
   
   DefaultTabController(
        length: _myTabs.length,
        
        child: Material(
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                backgroundColor: primaryColor,
                title: Text("Gestión de Solicitudes", style:TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                )),
                bottom: TabBar(tabs: _myTabs, labelColor: Colors.white,),
              
                ),
              SliverFillRemaining(
                child: TabBarView(
                  children: [
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
                    ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
   );
}
