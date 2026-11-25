import 'package:flutter/material.dart';
import 'package:paisesgui/ui/screens/continentes_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String _emailCorrecto = "pepito@yahoo.com";
  final String _passwordCorrecto = "123";

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {  
  _emailController.dispose();
  _passwordController.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Card(
        elevation: 12,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Iniciar Sesión",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,),),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (_emailController.text.isEmpty) {
                            return "No puede estar vacío";
                          }

                          if (!_emailController.text.contains("@")) {
                            return "La dirección de correo no es válida";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Correo electrónico",
                          border: OutlineInputBorder(),
                        ),
                      )),
                  ],
                ),
                SizedBox(height: 12,),
                Row(
                  children: [
                    Icon(Icons.lock),
                    SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        validator: (value) {
                          if (_passwordController.text.isEmpty) {
                            return "No puede estar vacío";
                          }                              
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Contraseña",
                          border: OutlineInputBorder(),
                        ),
                      )),
                  ],
                ),
                SizedBox(height: 12,),
                ElevatedButton(
                  onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_emailController.text != _emailCorrecto || _passwordController.text != _passwordCorrecto) {
                          
                          showDialog(
                            context: context,
                            builder: (context) {

                              return AlertDialog(
                                 title: const Text("Error"),
                                 content: const Text("El usuario o la contraseña son incorrectas"),
                                 actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Volver"),
                                    
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _emailController.text = _emailCorrecto;
                                      _passwordController.text = _passwordCorrecto;

                                    },
                                    child: const Text("Rellenar usuario"),
                                    )
                                 ],
                                 
                              );
                            }
                          );
                        }
                        else {
                          Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => ContinentesScreen(),
                          ),
                        );
                        }
                      }
                    },
                  child: Text("Iniciar sesión")
                  ),
              ],
            ),
          ),
        ),
      )
    ),
  );
  }
}
