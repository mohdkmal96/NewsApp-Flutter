import 'dart:async';

import 'package:app05/description_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'build_container.dart';
import 'json_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
        routes: {
        '/x1' : (context) => DescriptionScreen (),

        },

    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> MyHomePage() ));
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/launch_image.png', height: 300,),
          SizedBox(height: 20),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),

        ],
      ),

      ),
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 ApiProvider().fetchNews();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("News App"),
      ),
      body: Center(
      child: FutureBuilder(
        future:  ApiProvider().fetchNews(),
        builder: (ctx, snapShot){
            return ListView.builder(
                itemBuilder: (_, index){
                  return BuildContainer(snapShot.data['articles'][index]['author'],
                      snapShot.data['articles'][index]['urlToImage'],
                      snapShot.data['articles'][index]['title'],
                      snapShot.data['articles'][index]['description']
                  );

                }

            );

        },

      ),
      ),
     );
  }
}
