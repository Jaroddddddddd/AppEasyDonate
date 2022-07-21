import 'package:app_easy_donate/pages/homeONG.dart';
import 'package:app_easy_donate/pages/loginpage.dart';
import 'package:app_easy_donate/pages/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:app_easy_donate/utilities/MyRoutes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_easy_donate/provider/authprovider.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController _usuarioController = TextEditingController();
  TextEditingController _emailController= TextEditingController();
  TextEditingController _passwordController= TextEditingController();
  TextEditingController _confipasswordController= TextEditingController();
@override
  void initState() { 
  
    super.initState();
    _usuarioController = TextEditingController(text: "");
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
    _confipasswordController = TextEditingController(text: "");
  }

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
    return Material(
      child:Scaffold(
    body:ListView(
          children : [Container(
        padding: EdgeInsets.only(top:50 , left:20 , right: 20),
         child:Column(
           children:[
             Text("Registro en App Easy Donate" , textAlign: TextAlign.center, style:TextStyle(fontSize:32.0  , fontWeight: FontWeight.w600, color:Color.fromARGB(255, 14, 14, 14))),
              SizedBox(height:70),
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/icon.png'),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),

                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextFormField(
               controller: _emailController,
               
                  style: TextStyle(
                    
            fontSize: 16,
            color: Color.fromARGB(255, 8, 8, 8),
            fontWeight: FontWeight.bold,
            
          ),
          decoration: InputDecoration(
            
            hintText:"Introduzca su nombre de usuario", 
            suffixIcon: Icon(Icons.mail , color:Color.fromARGB(255, 16, 16, 16)),
            labelText: 'Correo Electronico:',
            labelStyle: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 11, 11, 11),
              fontWeight: FontWeight.bold,
            ),
            enabledBorder: UnderlineInputBorder(      
              borderSide: BorderSide(
                color: Color.fromARGB(255, 7, 7, 7),
                width: 2,  
              ),
            ),  
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 2,  
              ),
            ),
              border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2,  
              ),)
                  ),
          
               ),

SizedBox(height:25),



             TextField(
               controller: _passwordController,
                  style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 33, 33, 33),
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            hintText:"Introduzca su contraseña", 
            suffixIcon: Icon(Icons.vpn_key , color:Color.fromARGB(255, 9, 9, 9)),
            labelText: 'contraseña:',
            labelStyle: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 11, 11, 11),
              fontWeight: FontWeight.bold,
            ),
            enabledBorder: UnderlineInputBorder(      
              borderSide: BorderSide(
                color: Color.fromARGB(255, 15, 15, 15),
                width: 2,  
              ),
            ),  
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 2,  
              ),
            ),
              border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2,  
              ),)
                  ),
          
               ),
               
               SizedBox(height:40),

                          TextField(
               controller: _usuarioController,
                  style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 25, 24, 24),
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            hintText:"Introduzca su usuario", 
            suffixIcon: Icon(Icons.account_box , color:Colors.black),
            labelText: 'Usuario:',
            labelStyle: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 2, 2, 2),
              fontWeight: FontWeight.bold,
            ),
            enabledBorder: UnderlineInputBorder(      
              borderSide: BorderSide(
                color: Color.fromARGB(255, 9, 9, 9),
                width: 2,  
              ),
            ),  
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 10, 10, 10),
                width: 2,  
              ),
            ),
              border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2,  
              ),)
                  ),
          
               ),
SizedBox(height:30),
           TextField(
               controller: _confipasswordController,
                  style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 17, 17, 17),
            fontWeight: FontWeight.bold,
            
          ),
          decoration: InputDecoration(
            hintText:"Introduzca nuevamente su contraseña", 
            suffixIcon: Icon(Icons.vpn_key , color:Color.fromARGB(255, 13, 13, 13)),
            labelText: 'Confirmar Contraseña',
            
            labelStyle: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 11, 11, 11),
              fontWeight: FontWeight.bold,
            ),
            enabledBorder: UnderlineInputBorder(      
              borderSide: BorderSide(
                color: Color.fromARGB(255, 14, 13, 13),
                width: 2,  
              ),
            ),  
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 2,  
              ),
            ),
              border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2,  
                //border: UnderlineInputBorder
                //
              ),)
                  ),
          
               ),
                
                      ],
                    ),
                  ),
SizedBox(height:50),
        Container(
          width: double.infinity,
          child: TextButton(
                    
                    onPressed: () async {

                              //await Firebase.initializeApp();
  
                        if(_emailController.text.isEmpty || _usuarioController.text.isEmpty || _passwordController.text.isEmpty || _confipasswordController.text.isEmpty) {
                            Fluttertoast.showToast(
                            msg: "Por favor complete los dos campos!! ",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 13.0
                        );
                            print("El usuario, correo electrónico y la contraseña no pueden estar vacíos");
                            return;
                          }
                          bool res = await AuthProvider().createUserWithemail(_emailController.text, _passwordController.text);
                           if(!res) {
                    print("signup failed");
                  Fluttertoast.showToast(
                    msg: "Sign Up Faild! :(",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 13.0
                );

                    }else{
                     Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                              );

                  }
                    
                    },


                     child: Text("Registrarse" , style: TextStyle(fontSize:21.0 ,color:Colors.white, fontWeight:FontWeight.w700),) , 
                     style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.white)
                            )),
                       backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 85, 93, 227)),
                    ),
                     ),

                     
        ),

                  SizedBox(height:25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("¿Ya tienes una cuenta ? " ,style:TextStyle(color: Color.fromARGB(255, 18, 17, 17) , fontWeight:FontWeight.w400)),
                                
                                InkWell(
                                  onTap: (){
                                    

                            Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                                  },
                                child: Text("¿Login? " ,
                               
                                  style:TextStyle(color: Color.fromARGB(255, 12, 12, 12) ,   fontWeight:FontWeight.w400)),
                                  
                                ),

                          
                    ],
                    
                  )

                   
                       
             ]
         )
         
      ),
       SizedBox(height:100), 
      
          ]
    )
    
      )
      
    );
  }
}
