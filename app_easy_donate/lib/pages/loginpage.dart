import 'package:app_easy_donate/pages/homeONG.dart';
import 'package:flutter/material.dart';
import 'package:app_easy_donate/utilities/MyRoutes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool changeButton=false;

  final _formkey = GlobalKey<FormState>();

  movetoHome(BuildContext context) async{
    if(_formkey.currentState!.validate()){
      setState(() {
                        changeButton=true;
                      });
                    await Future.delayed(Duration(seconds: 1));
                    await Navigator.pushNamed(context, MyRoutes.homeRoute);
                    setState(() {
                        changeButton=false;
                      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/icon.png'),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    "Iniciar sesión en App Easy Donate",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText:"Introduzca su nombre de usuario",
                            labelText: "Nombre de usuario",
                          ),
                          validator: (value) {
                            if(value!.isEmpty){
                              return "El nombre de usuario no puede estar vacío";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              
                            });
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText:"Introducir la contraseña",
                            labelText: "Contraseña",
                            
                          ),
                          validator: (value) {
                            if(value!.isEmpty){
                              return "La contraseña no puede estar vacía";
                            }
                            else if(value.length<8){
                              return "La longitud de la contraseña debe ser al menos 8 digitos";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  InkWell(
                    onTap: () => movetoHome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeButton? 50 :150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changeButton
                        ? CircularProgressIndicator(
                          color: Colors.indigoAccent,
                        )
                        : Text(
                          "Entrar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                          ),
                       
                          decoration: BoxDecoration(
                            color: changeButton?Colors.transparent:Colors.indigoAccent,
                            borderRadius: BorderRadius.circular(changeButton?50:8),
                          ), 
                    ),
                  ),



                  TextButton(
                //Estilo boton
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.indigo[300]),
                    shape: MaterialStateProperty.all(const StadiumBorder())),
                child: const Text(
                  'Entrar como ONG',
                  //Estilo texto
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18.0,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
               onPressed: () => Navigator.pushReplacementNamed(
                  context,
                  '/homeONG',
                ),
              ),


                  TextButton(
                //Estilo boton
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.indigo[300]),
                    shape: MaterialStateProperty.all(const StadiumBorder())),
                child: const Text(
                  'Crear una nueva cuenta',
                  //Estilo texto
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18.0,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => Navigator.pushReplacementNamed(
                  context,
                  '/register',
                ),
              ),
                  
                ],
                
              ),
            ),
          ),
        ),
      ),
    );
  }
}
