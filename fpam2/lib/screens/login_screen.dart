import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fixedmainpam/core/api_client.dart';
import 'package:fixedmainpam/screens/home.dart';
import 'package:fixedmainpam/screens/register.dart';
import 'package:fixedmainpam/utils/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiClient _apiClient = ApiClient();
  bool _showPassword = true;

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Procesando'),
        backgroundColor: Colors.green.shade300,
      ));

      dynamic res = await _apiClient.login(userController.text, passwordController.text);
      //debugPrint(res.toString());
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      //version mala beta
      if (res["statuscode"] == 200 || res["status"] == 200) {
        dynamic rbody = res["body"];
        String token = rbody['token'];
        String nombreUsuario = rbody['nombreUsuario'];
        String role = "ROLE_USER";
        if (rbody['authorities'].toString().contains("ROLE_ADMIN")) {
          role = "ROLE_ADMIN";
        }
        //debugPrint(rbody['authorities'].toString().contains("ROLE_ADMIN").toString());

        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(token: token, nombreUsuario: nombreUsuario, rol: role)));
      
      } else if (res["status"] == -1 || res["status"] == 401 || res["statuscode"] == 401 || res["statuscode"] == 400 || res["status"] == 400) {
        String mensaje = res["message"];
        debugPrint("error login");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('$mensaje'),
          backgroundColor: Colors.red.shade300,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Form(
          key: _formKey,
          child: Stack(children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: size.width * 0.88,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Center(
                            child: Image.asset(
                              'lib/assets/images/tree.png',
                              height: 80,
                              width: 80,
                              alignment: Alignment.center,
                            ),
                          ),

                          
                          SizedBox(height: size.height * 0.05),
                          const Text(
                            "Inicio",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          
                          SizedBox(height: size.height * 0.05),


                          TextFormField(
                            controller: userController,
                            validator: (value) {
                              return Validator.validateName(value ?? "");
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.account_circle_outlined, color: Color.fromARGB(255, 104, 215, 94)),
                              hintText: "Usuario",
                              isDense: false,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 30, 255, 0)),
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.02),

                          TextFormField(
                            obscureText: _showPassword,
                            controller: passwordController,
                            validator: (value) {
                              return Validator.validatePassword(value ?? "");
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(
                                      () => _showPassword = !_showPassword);
                                },
                                child: Icon(
                                  _showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.password, 
                                color: Color.fromARGB(255, 104, 215, 94)
                              ),
                              hintText: "Contraseña",
                              isDense: false,
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 30, 255, 0)),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.04),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: login,
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 104, 215, 94),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 15)
                                  ),
                                  child: const Text(
                                    "Iniciar",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const RegisterScreen())
                              ),
                              child: const Row(
                                children: [
                                Text(
                                  '¿No tienes una cuenta? ',
                                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                                Text(
                                  'Registrarse',
                                  style: TextStyle(color: Color.fromARGB(255, 104, 215, 94)),
                                )
                                ],
                              )
                              ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
