
import 'package:app_easy_donate/model/donate.dart';
import 'package:app_easy_donate/model/backend.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_easy_donate/utilities/MyRoutes.dart';
import '../constants.dart';
import '../model/backend.dart';
import '../widget/DonatemeWidget.dart';
import '../constants.dart';
import 'detailsDonate.dart';
import 'detailsDonateONG.dart';
import 'join.dart';

List<Donate> donates=Backend().getDonates();

class DonatemePageONG extends StatefulWidget {

  const DonatemePageONG({Key? key, }) : super(key: key);
  @override
  State<DonatemePageONG> createState() => _DonatemePageStateONG();
}

class _DonatemePageStateONG extends State<DonatemePageONG> {
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

var donates = Backend().getDonates();

  void markEmailAsRead(int id) {
    Backend().markDonatesAsRead(id);
    setState(() {
      donates = Backend().getDonates();
    });
  }

  void deleteEmail(int id) {
    Backend().deleteDonates(id);
    setState(() {
      donates = Backend().getDonates();
    });
  }

  void showDetail(Donate donate) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailsDonateONG(donate: donate);
    }));

    Backend().markSolicitudesAsRead(donate.id);
    setState(() {
      donates = Backend().getDonates();
    });
  }

   static const _myTabs = <Tab>[
    Tab(text: 'Peticiones'),
    Tab(text: 'Aprobadas'),
  ];


  @override
   Widget build(BuildContext context) => 
   
   DefaultTabController(
        length: _myTabs.length,
        
        child: Material(
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                backgroundColor: primaryColor,
                title: Text("Gestión de Donaciones", style:TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                )),
                bottom: TabBar(tabs: _myTabs, labelColor: Colors.white,),
              
                ),
              SliverFillRemaining(
                child: TabBarView(
                  children: [
                    ListView.separated(
                      itemCount: donates.length,
                      separatorBuilder: (BuildContext context, int index) => const Divider(
                        color: primaryColor,
                        indent: 40.0,
                        endIndent: 20.0,
                      ),
                      itemBuilder: (BuildContext context, int index) => DonatemeWidget(
                        
                        
                        donate: donates[index],
                        onTap: showDetail,
                        onLongPress: markEmailAsRead,
                        onSwipe: deleteEmail,
                        ),
                    ),
                    ListView.separated(
                      itemCount: donates.length,
                      separatorBuilder: (BuildContext context, int index) => const Divider(
                        color: primaryColor,
                        indent: 40.0,
                        endIndent: 20.0,
                      ),
                      itemBuilder: (BuildContext context, int index) => DonatemeWidget(
                        donate: donates[index],
                        onTap: showDetail,
                        onLongPress: markEmailAsRead,
                        onSwipe: deleteEmail,
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
