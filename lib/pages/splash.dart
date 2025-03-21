import 'package:flutter/material.dart';

import '../routing/routes.dart';

class SplashPage extends StatefulWidget{
  const SplashPage({super.key});

  @override
  State<SplashPage> createState()=> _SplashPageState();
}

class _SplashPageState extends State<SplashPage>{
  @override
  void initState(){
    super.initState();
    Future.delayed(
      const Duration(seconds: 5)
    ).then((value) => {
      Navigator.pushReplacementNamed(context, Routes.home),
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
            height: 200.0,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[ 
                SizedBox(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(),
                ),
                Image(
                    image: AssetImage('lib/assets/flutter_logo.png'),
                    width: 100,
                    height: 100,
                  ),
              ],
            ),
          )
      )
    );
  }
}