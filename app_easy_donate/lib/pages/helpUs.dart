import 'package:app_easy_donate/constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:app_easy_donate/utilities/MyRoutes.dart';

class HelpUs extends StatefulWidget {
  const HelpUs({ Key? key }) : super(key: key);

  @override
  State<HelpUs> createState() => _HelpUsState();
}

class _HelpUsState extends State<HelpUs> {

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();


  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  double _currentSliderValue = 20;

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
        title: const Text('Estamos aquí para ayudarte ', style: TextStyle(
          color: primaryColor,
          fontSize: 30,
          fontWeight: FontWeight.bold
          )
          ),
        
        backgroundColor: Colors.white, elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        
      
      
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 20),
          
            ),
            SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      autofocus: false,
                      controller: _nombreController,
                      decoration: InputDecoration(
                        
                          labelText: "Nombre",
                          hintText: 'Introduzca su nombre',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "El nombre no puede estar vacío";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autofocus: false,
                      controller: _direccionController,
                      decoration: InputDecoration(
                          labelText: "Dirección",
                          hintText: 'Introduzca dirección',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "La dirección no puede estar vacía";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                      autofocus: false,
                      controller: _descripcionController,
                      decoration: InputDecoration(
                          labelText: "Descripción",
                          hintText: 'Describe cómo podemos ayudarte...',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "La descripción no puede estar vacía";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  
                  SizedBox(height: 10,),
                  Material(
                          color: Color(0xFFF9A826),
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 8),
                          child: InkWell(
                            onTap: () async{

                              if(_formKey.currentState!.validate()){
                                bool respuesta = await saveSolicitudes(
                                  _nombreController.text,
                                  _direccionController.text,
                                  _descripcionController.text,
                                  _estadoController.text='false'
 
                                );

                                if(respuesta){
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Solicitud agregada correctamente'),
                                      backgroundColor: Colors.green,
                                      )
                                  );

                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Algo salió mal!!!'),
                                      backgroundColor: Colors.red,
                                      ),
                                  );
                                }
                              }
                              
                            },
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: changeButton ? 50 : 150,
                              height: 50,
                              alignment: Alignment.center,
                              child: changeButton
                                  ? Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : Text(
                                      "Enviar",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                            ),
                          ),
                        
              )],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Future<bool> saveSolicitudes(
    String nombre, 
    String direccion, 
    String descripcion, 
    String estado
    ) async {
      try{
        await FirebaseDatabase.instance
            .reference()
            .child('Solicitudes')
            .push()
            .set(
              {
                'nombre': nombre,
                'direccion': direccion,
                'descripcion': descripcion,
                'estado': 'false'
        
              }
            );
          return true;
      } catch (e){
        print(e);
        return false;
      }
    }
}
