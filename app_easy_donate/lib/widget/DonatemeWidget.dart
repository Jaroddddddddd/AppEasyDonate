import 'dart:math';
import 'package:app_easy_donate/constants.dart';
import 'package:flutter/material.dart';

import '../model/donate.dart';
import '../model/backend.dart';


class DonatemeWidget extends StatelessWidget {
   final Donate donate;
   //final Function onTap;
   final Function onSwipe;
   final Function onLongPress;


  const DonatemeWidget({
    Key? key,
    required this.donate, 
    //required this.onTap,
    required this.onSwipe,
    required this.onLongPress

    })
    :super(key: key);





  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        onSwipe(donate.id);
      },
      onLongPress: () {
        onLongPress(donate.id);
      },
      onTap: () {
        //onTap(donate);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 131.0,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(15.0)
              ),
              Expanded(
                flex: 9,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(donate.date.toString(), style: fromTextStyle,),
                    Text(donate.time.toString(), style: bodyTextStyle, ),
                    Text(donate.alimentos, style: alimentosTextStyle,),
                    Text(donate.direccion, style: bodyTextStyle),
                    Text('Cantidad: '+donate.cantidad.toString(), style: bodyTextStyle),

                  ],
                ),
              ),
              
          ],
        ),
      ),
    
    );
  }
}

