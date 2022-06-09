import 'package:flutter/material.dart';
import 'package:app_easy_donate/utilities/MyRoutes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool changeButton=false;

  final _formkey = GlobalKey<FormState>();

  movetologin(BuildContext context) async{
    if(_formkey.currentState!.validate()){
      setState(() {
                        changeButton=true;
                      });
                    await Future.delayed(Duration(seconds: 1));
                    await Navigator.pushNamed(context, MyRoutes.loginRoute);
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
                    "Registro en App Easy Donate",
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
                             hintText: 'correo@gmail.com',
                             labelText: 'Correo electronico',
                          ),
                          validator: (value) {
                            if(value!.isEmpty){
                              return "correo incorrecto";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              
                            });
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                             hintText: 'usuario01',
                             labelText: 'Ingresar Usuario',
                          ),
                          validator: (value) {
                            if(value!.isEmpty){
                              return "usuario Incorrecto";
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
                            labelText: "ingresar Contraseña",
                            
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
                         TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText:"Introduzca la contraseña nuevamnete",
                            labelText: "Confirmar Contraseña",
                            
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
                    onTap: () => movetologin(context),
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
                          "Registrarse",
                          
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
                  '¿Ya tienes una cuenta?',
                  //Estilo texto
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18.0,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => Navigator.pushReplacementNamed(
                  context,
                  '/login',
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
