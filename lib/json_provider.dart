import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ApiProvider{



  Future fetchNews() async{
    var req = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=da599cf86da745a59ce7e038f9e9012c"));

    String fileName = 'pathString.json';
    var dir = await getTemporaryDirectory();

    File file = File(dir.path + '/' + fileName);

    if(file.existsSync()){
      print("Reading from device cache");

      //read from cache
      final data = file.readAsStringSync();
      final res = json.decode(data);
      return res;
    }
    else{
      print("Fetch from Network");
      // fetch from network
      final req = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=da599cf86da745a59ce7e038f9e9012c"));
      if(req.statusCode == 200){
       final body = req.body;
       // save to json cache
       file.writeAsStringSync(body, flush: true, mode: FileMode.write);
       final res = json.decode(body);

       return res;
      }
      else{
        return json.decode(req.body);
      }
    }


  }
}