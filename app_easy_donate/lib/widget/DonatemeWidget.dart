import 'dart:math';
import 'package:flutter/material.dart';

import '../model/donate.dart';
import '../model/backend.dart';


class DonatemeWidget extends StatelessWidget {
   final Donate donate;


  const DonatemeWidget({
    Key? key,
    required this.donate, 

    })
    :super(key: key);





  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(

      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 120.0,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 12.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle),
                ),
              ),
              Expanded(
                flex: 9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(donate.id.toString()),
                    Text(donate.date.toString(), ),
                    Text(donate.time.toString(), ),
                    Text(donate.alimentos),
                    Text(donate.direccion),
                    Text(donate.cantidad.toString()),

                  ],
                ),
              ),
            
          ],
        ),
      ),
    
    );
  }
}

