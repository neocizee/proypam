import 'package:flutter/material.dart';
//import 'package:mainpam/core/api_client.dart';
import 'package:fixedmainpam/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  final String token;
  final String nombreUsuario;
  final String rol;
  const HomeScreen(
      {Key? key,
      required this.token,
      required this.nombreUsuario,
      required this.rol})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /*
    final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>> getUserData() async {
    dynamic userRes;
    userRes = await _apiClient.getUserProfileData();
    return userRes;
  }
  */
  Future<void> logout() async {
    //await _apiClient.logout(widget.token);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  Future<void> dataArbol() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.add_circle),
                title: const Text('Editar arbol'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.remove_circle),
                title: const Text('Eliminar arbol'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cerrar'),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Arbolado',
        ),
        backgroundColor: const Color.fromARGB(255, 82, 188, 74),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        //padding: const EdgeInsets.all(5),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border:
                              Border.all(width: 1, color: Colors.blue.shade100),
                        ),
                        child: Container(
                          height: 100,
                          width: 100,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset('lib/assets/images/tree.png',
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        widget.nombreUsuario,
                        style: const TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),

                      
            TextButton(
              onPressed: () async {
                //await _apiClient.logout(widget.token);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.redAccent.shade700,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 25)),
              child: const Text(
                'Cerrar sesion',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.bar_chart,
              ),
              title: const Text('Estadisticas'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.map,
              ),
              title: const Text('Mapa'),
              onTap: () {
                Navigator.pop(context);
              },
            ),  
            ListTile(
              leading: const Icon(
                Icons.person_pin_sharp,
              ),
              title: const Text('Perfil'),
              onTap: () {
                Navigator.pop(context);
              },
            ), 
                        ListTile(
              leading: const Icon(
                Icons.add_box_rounded,
              ),
              title: const Text('Nuevo Arbol'),
              onTap: () {
                Navigator.pop(context);
              },
            ), 

            Align(
              alignment: Alignment.topCenter,
              child: Text(
                widget.token,
                style:
                    const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child: Text(
                widget.rol,
                style:
                    const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: FutureBuilder<Map<String, dynamic>>(
            //future: getUserData(),
            builder: (context, snapshot) {
          /*
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                height: size.height,
                width: size.width,
                color: Colors.blueGrey,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            
            String token = snapshot.data!['token'];
            String nombreUsuario = snapshot.data!['nombreUsuario'];
            String authorities = snapshot.data!['authorities'];
            */
          return Container(
            width: size.width,
            height: size.height,
            color: Colors.blueGrey.shade400,
            child: const SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:
                     EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [


                    /*firstname
                      Container(
                        width: size.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        decoration: BoxDecoration(
                            color: const Color(0xFF48484A),
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('First Name:',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white38)),
                            const SizedBox(height: 7),
                            Text(firstName,
                                style: const TextStyle(
                                    fontSize: 19, color: Colors.white)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      //lastname
                      Container(
                        width: size.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        decoration: BoxDecoration(
                            color: const Color(0xFF48484A),
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Last Name:',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white38)),
                            const SizedBox(height: 7),
                            Text(lastName,
                                style: const TextStyle(
                                    fontSize: 19, color: Colors.white)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      Container(
                        width: size.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        decoration: BoxDecoration(
                            color: const Color(0xFF48484A),
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Birthday:',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white38)),
                            const SizedBox(height: 7),
                            Text(birthDate,
                                style: const TextStyle(
                                    fontSize: 19, color: Colors.white)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      Container(
                        width: size.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        decoration: BoxDecoration(
                            color: const Color(0xFF48484A),
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Gender:',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white38)),
                            const SizedBox(height: 7),
                            Text(gender,
                                style: const TextStyle(
                                    fontSize: 19, color: Colors.white)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      */

                    //LOG OUT

                  ],
                ),
              ),
            ),
          );
        }
            //return const SizedBox();
            ),
      ),
    );
  }
}
