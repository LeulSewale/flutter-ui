import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'screen/home_page.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LogInPage(),
      ),
    );
  }
}

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 32, 59, 218),
            Color.fromARGB(255, 134, 156, 230)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ), //color: Color.fromARGB(255, 37, 82, 179)) ,
      alignment: Alignment.center,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'LogIn',
            style: TextStyle(
              fontSize: 35,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Form(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius:
                              BorderRadius.all(Radius.circular(14))),
                    ),
                    onChanged: (String value) {},
                    validator: (value) {
                      return value!.isEmpty ? 'please inter username' : null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      labelText: 'password',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                      ),
                    ),
                    onChanged: (String value) {
                      if (true) {
                        // Your navigation code
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }
                    },
                    
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            )),
          ),
        

            Column(
              children: [
                Center(
      child: SvgPicture.asset(
        "assets/svg/ethioStarLogo.svg",
        alignment: Alignment.center,
      ),
      ),
            
      const SizedBox(
                  height: 100,
                ),
         Center(
          child: SvgPicture.asset(
            "assets/svg/Ethiostars.com.svg",
            alignment: Alignment.center,
          ),
      ),
      const SizedBox(
                  height: 10,
                ),
              
       Center(
      child: SvgPicture.asset(
        "assets/svg/© Copyright Ethiostars 2022. All Rights Reserved..svg",
        alignment: Alignment.center,
      ),
      ),
      ],
            ),
     ] )
      
    );
  }
}
