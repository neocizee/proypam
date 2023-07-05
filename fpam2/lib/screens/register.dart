
import 'package:flutter/material.dart';
import 'package:fixedmainpam/core/api_client.dart';
import 'package:fixedmainpam/screens/login_screen.dart';
import 'package:fixedmainpam/utils/validator.dart';


class RegisterScreen extends StatefulWidget {
  static String id = "register_screen";
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController  = TextEditingController();

  final ApiClient _apiClient = ApiClient();
  bool _showPassword = true;

  Future<void> registerUsers() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cargando'),
          backgroundColor: Color.fromARGB(255, 13, 178, 18),
        )
      );
      
      Map<String, dynamic> userData = {
        "nombre": (nombreController.text + ' ' + apellidoController.text),
        "nombreUsuario": usuarioController.text,
        "email": emailController.text,
        "password": passwordController.text,
      };
      
      dynamic res = await _apiClient.registerUser(userData);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      //debugPrint(res["statuscode"].toString());
      
     if (res["statuscode"] == 201 || res["status"] == 201) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      } else if (res["status"] == -1 || res["status"] == 401 || res["statuscode"] == 401 || res["statuscode"] == 400 || res["status"] == 400) {
        String mensaje = res["mensaje"].toString();
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
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Form(
        key: _formKey,
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: size.width * 0.88,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(  
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                       

                    //const Center(
                      const Text(
                        "Registro",
                        style: TextStyle(
                          fontSize: 25,
                          //fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 0, 0, 1)
                        ),
                      ),
                    //),
                    SizedBox(height: size.height * 0.05),

                    //SizedBox(height: size.height * 0.08),



                    TextFormField(
                      
                      validator: (value) =>
                          Validator.validateNombre(value ?? ""),
                      controller: nombreController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Color.fromARGB(255, 104, 215, 94)),
                        hintText: "Nombre",
                        isDense: false,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 30, 255, 0)),
                        ),
                      ),
                      
                    ),
                    


                    SizedBox(height: size.height * 0.02),


                    TextFormField(
                      validator: (value) =>
                          Validator.validateApellido(value ?? ""),
                      controller: apellidoController,
                      keyboardType: TextInputType.name,

                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Color.fromARGB(255, 104, 215, 94)),
                        hintText: "Apellido",
                        isDense: false,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 30, 255, 0)),
                        ),
                      ),
                    ),



                    SizedBox(height: size.height * 0.02),


                    TextFormField(
                      validator: (value) =>
                          Validator.validateEmail(value ?? ""),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 104, 215, 94)),
                        hintText: "Email",
                        isDense: false,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 30, 255, 0)),
                        ),
                      ),
                    ),
                    

                    SizedBox(height: size.height * 0.03),

                    TextFormField(
                      validator: (value) =>
                          Validator.validateName(value ?? ""),
                      controller: usuarioController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.account_circle_outlined, color: Color.fromARGB(255, 104, 215, 94)),
                        hintText: "Usuario",
                        isDense: false,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 30, 255, 0)),
                        ),
                      ),
                    ),




                    SizedBox(height: size.height * 0.03),


                    TextFormField(
                      obscureText: _showPassword,
                      validator: (value) => Validator.validatePassword(value ?? ""),
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.password_rounded, 
                          color: Color.fromARGB(255, 104, 215, 94)
                        ),
                        hintText: "Contraseña",
                        suffixIcon: GestureDetector(
                          onTap: () {setState(() {_showPassword = !_showPassword;});},
                          child: Icon(
                                _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
                        isDense: false,
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 30, 255, 0)),
                        ),
                      ),
                    ),


                    SizedBox(height: size.height * 0.03),


                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: registerUsers,
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 104, 215, 94),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15)),
                        child: const Text(
                          "Registrar",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen())),
                          child: 
                          const Row(children: [
                            Text('¿Ya tienes una cuenta? ',                          
                              style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                           Text('Iniciar sesion',                          
                              style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 104, 215, 94),
                              ),
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
    );
  }
}