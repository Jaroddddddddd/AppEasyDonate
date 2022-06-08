import 'dart:math';
import 'package:app_easy_donate/constants.dart';
import 'package:flutter/material.dart';
import '../model/solicitud.dart';
import '../model/backend.dart';


class SolicitudesWidget extends StatelessWidget {
   final Solicitud solicitud;
   final Function onTap;
   final Function onSwipe;
   final Function onLongPress;

  const SolicitudesWidget({
    Key? key,
    required this.solicitud, 
    required this.onTap,
    required this.onSwipe,
    required this.onLongPress

    })
    :super(key: key);


  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        onSwipe(solicitud.id);
      },
      onLongPress: () {
        onLongPress(solicitud.id);
      },
      onTap: () {
        onTap(solicitud);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 70,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 12.0,
                decoration: BoxDecoration(
                    color: solicitud.read ? Colors.transparent : primaryColor,
                    shape: BoxShape.circle),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0)
              ),
              Expanded(
                flex: 9,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(solicitud.nombre, style: fromTextStyle,),
                    Text(solicitud.direccion, style: bodyTextStyle),

                  ],
                ),
              ),
              Container(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
              solicitud.image,
              height: 145.0,
                
              )
               ),
          ],
        ),
      ),
    
    );
  }
}

