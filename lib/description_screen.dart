import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {

   // static const routeName = 'News_details';

 // final String description;
 //
 //    const DescriptionScreen({this.description}) ;

  Widget buildContainer(Widget child) {
    return SingleChildScrollView(
      child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    ));
  }

  @override
  Widget build(BuildContext context) {
   final args = ModalRoute.of(context).settings.arguments as Map<String, Object>;

    return Scaffold(
      appBar: AppBar(
        title: Text("Description"),

      ),
      body: Center(
        child: buildContainer(Text(args['desc'])),

      ),
    );
  }
}
