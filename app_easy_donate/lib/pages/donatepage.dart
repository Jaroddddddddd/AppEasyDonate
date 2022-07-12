import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_easy_donate/utilities/MyRoutes.dart';
import '../constants.dart';
import 'package:firebase_database/firebase_database.dart';
class DonatePage extends StatefulWidget {
  


  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  // const DonatePage({Key? key}) : super(key: key);

  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _horaController = TextEditingController();
  final TextEditingController _diaController = TextEditingController();
  final TextEditingController _cantidadController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();
  


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
        title: const Text('Donación de Comida', style: TextStyle(
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
                    child: 
                    TextFormField(
                      
                      keyboardType: TextInputType.streetAddress,
                      autofocus: false,
                      controller: _direccionController,
                      decoration: InputDecoration(
                        
                          labelText: "Recoger en (Dirección)",
                          hintText: 'Introduzca la dirección',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "La ubicación no puede estar vacía";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                      autofocus: false,
                      controller: _tipoController,
                      decoration: InputDecoration(
                          labelText: "Tipo de Donación",
                          hintText: 'Alimentos, Ropa, Juguetes',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Los artículos no pueden estar vacíos";
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
                          hintText: 'Introduzca la descripción de la donación',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "La descripción de la Donación no pueden estar vacía";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autofocus: false,
                      controller: _horaController,
                      decoration: InputDecoration(
                          labelText: "Hora de recogida",
                          hintText: 'Introduzca la hora de recogida',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "La hora de recogida no puede estar vacía";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.datetime,
                      autofocus: false,
                      controller: _diaController,
                      decoration: InputDecoration(
                          labelText: "Día de recogida",
                          hintText: 'Introduzca el día',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "El día no puede estar vacío";
                        }
                        return null;
                      },
                    ),
                  ),
                  
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.datetime,
                      autofocus: false,
                      controller: _cantidadController,
                      decoration: InputDecoration(
                          labelText: "Cantidad de Articulos",
                          hintText: 'Introduzca la cantidad de articulos',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "La cantidad no puede estar vacío";
                        }
                        return null;
                      },
                    ),
                  ),
                 
                  SizedBox(height: 20,),
                  Material(
                          color: Color(0xFFF9A826),
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 8),
                          child: InkWell(
                            onTap: () async{

                              if(_formKey.currentState!.validate()){
                                bool respuesta = await saveDonationes(
                                  _direccionController.text,
                                  _tipoController.text,
                                  _descripcionController.text,
                                  _horaController.text,
                                  _diaController.text,
                                  _cantidadController.text,
                                  _estadoController.text='false'
                                );

                                if(respuesta){
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Donacion agregada correctamente'),
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
                        
              ),
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Future<bool> saveDonationes(
    String direccion,
    String tipo,
    String descripcion,
    String hora,
    String dia,
    String cantidad,
    String estado
    ) async {
      try{
        await FirebaseDatabase.instance
            .reference()
            .child('Donaciones')
            .push()
            .set(
              {
                'direccion': direccion,
                'tipo': tipo,
                'descripcion': descripcion,
                'hora': hora,
                'dia': dia,
                'cantidad': cantidad,
                'estado': estado
              }
            );
          return true;
      } catch (e){
        print(e);
        return false;
      }
    }
}
