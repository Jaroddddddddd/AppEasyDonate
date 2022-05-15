import 'package:app_easy_donate/model/donate.dart';
import 'package:app_easy_donate/model/backend.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_easy_donate/utilities/MyRoutes.dart';

import '../model/backend.dart';
import '../widget/DonatemeWidget.dart';


List<Donate> donates=Backend().getDonates();

class DonatemePage extends StatefulWidget {
  @override
  State<DonatemePage> createState() => _DonatemePageState();
}

class _DonatemePageState extends State<DonatemePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Mis Donaciones', style: TextStyle(
          color: Color(0xFFF9A826),
          fontSize: 30,
          )
          ),
        
        backgroundColor: Colors.white, elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        
      
      
      ),
      
        

      body: 

    
      
      ListView.separated(
        
      
                
        itemCount:donates.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(
          indent: 40.0,
          endIndent: 20.0,

        ),
        itemBuilder: (BuildContext context, int index) => DonatemeWidget(
          donate: donates[index], 

          ),
      ),
      
        
    );
  }
}
