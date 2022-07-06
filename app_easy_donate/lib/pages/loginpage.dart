import 'package:app_easy_donate/pages/homeONG.dart';
import 'package:app_easy_donate/pages/homepage.dart';
import 'package:app_easy_donate/pages/registerpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_easy_donate/utilities/MyRoutes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app_easy_donate/pages/authprovider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool changeButton=false;

  
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
@override
  void initState() { 
  
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }



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
    return  Material(
      child:Scaffold(
    body:ListView(
            children:[Container(
        padding: EdgeInsets.only(top:50 , left:20 , right: 20),
         child:Column(
           children:[
             Text("Iniciar Sesión en App Easy Donate" , style:TextStyle(fontSize:32.0  , fontWeight: FontWeight.w600, color:Color.fromARGB(255, 14, 14, 14))),
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
            color: Color.fromARGB(255, 9, 9, 9),
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
                color: Color.fromARGB(255, 3, 3, 3),
                width: 2,  
              ),
            ),  
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 13, 13, 13),
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


            SizedBox(height:20),



             TextField(
               controller: _passwordController,
               obscureText: true,
                  style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 18, 18, 18),
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
          hintText:"Introduzca nuevamente su contraseña", 
            suffixIcon: Icon(Icons.vpn_key , color:Color.fromARGB(255, 13, 13, 13)),
            labelText: 'Contraseña',
            labelStyle: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 13, 13, 13),
              fontWeight: FontWeight.bold,
            ),
            enabledBorder: UnderlineInputBorder(      
              borderSide: BorderSide(
                color: Color.fromARGB(255, 14, 14, 14),
                width: 2,  
              ),
            ),  
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 9, 9, 9),
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
                    
                      ],
                    ),
                  ),
               
               SizedBox(height:60),

        Container(
          width: double.infinity,
          child: TextButton(
                    
                    onPressed: () async{

                        if(_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                    Fluttertoast.showToast(
                    msg: "Por  Favor complete los datos !! ",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 13.0
                );
                    print("El correo electrónico y la contraseña no pueden estar vacíos");
                    return;
                  }
                  bool res = await AuthProvider().signInWithEmail(_emailController.text, _passwordController.text);
                  
                  if(!res) {
                    print("Login fallido");
                  Fluttertoast.showToast(
                    msg: "Email y password incorrecta :(",
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
                     child: Text("Entrar" , style: TextStyle(fontSize:21.0 ,color:Color.fromARGB(255, 255, 255, 255), fontWeight:FontWeight.w700),) , 
                     style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: Color.fromARGB(255, 234, 234, 240))
                            )),
                       backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 71, 81, 216)),
                    ),
                     ),

                     
        ),

                  SizedBox(height:25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("¿No tienes una cuenta ? " ,style:TextStyle(color: Color.fromARGB(255, 15, 15, 15) , fontWeight:FontWeight.w400)),
                                
                                InkWell(
                                  onTap: (){
                                Navigator.push(
                                   context,
                                 MaterialPageRoute(builder: (context) => RegisterPage()),
                                                          );
                                  },
                                child: Text("Registrate! " ,
                               
                                  style:TextStyle(color: Colors.blueAccent ,   fontWeight:FontWeight.w400)),
                                ),

                                SizedBox(height:10),
//backgroundColor
                      
                      Text("Entrar como ONG " ,style:TextStyle(color: Color.fromARGB(255, 18, 17, 17) , fontWeight:FontWeight.w400)),
                            InkWell(
                                  onTap: (){
                                    
                            Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeONG()),
                          );
                                  },
                                child: Text("¿Entrar? " ,
                               
                                  style:TextStyle(color: Color.fromARGB(255, 113, 65, 234) ,   fontWeight:FontWeight.w400) ),
                                  
                                ),  
                                          
                    ],
                  )
                        
             ]
         )
    ),]
     )
      )
    
    );
  }
}
