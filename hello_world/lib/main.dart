import 'dart:convert';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hello_world/models/user.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  Users _users= Users();
  bool isLoading=true;
  
  void getData() async{
  var url=Uri.parse('http://104.211.219.98/train/auth/');
  
  final response=await http.get(url,headers: {
    HttpHeaders.authorizationHeader: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2ODM4ODU5MDQsImNvbXBhbnlOYW1lIjoiVHJhaW4gQ2VudGVyIiwiY2xpZW50SUQiOiJlYmIxNDAxOC0wYjZmLTRjY2EtYTJiMy02YzE1ZmRjMWE5Y2MiLCJvd25lck5hbWUiOiIiLCJvd25lckVtYWlsIjoiIiwicm9sbE5vIjoiMzQifQ.BFZ_tuJ2wVCImo26KntLz6J5cVJbbB9WexAa09qPUsg',
  },);
  
  var json=jsonDecode(response.body);
  setState(() {
  _users=Users.fromJson(json);
  isLoading=false;
  });
 
 }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
}
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:isLoading?Center(
          child: CircularProgressIndicator(),
        ): Column(
          children: [
            ListView.builder(
              itemCount: _users.departureTime!.length,
              itemBuilder:(context,index){
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green
                ),
                child: Column(children: [
                  Text(_users.departureTime!.hours as String),
                  Text(_users.departureTime!.minutes as String),
                  Text(_users.departureTime!.seconds as String), 
                ]),
              );
            }
             ),
             Container(
              child: Column(
                children: [
             ListView.builder(
              itemCount: _users.price!.length,
              itemBuilder:(context,index){
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green
                ),
                child: Column(children: [
                  Text(_users.price!.sleeper as String),
                  Text(_users.price!.ac as String), 
                  Text(_users.seatsAvailable as String),
                  Text(_users.delayedBy as String)
                ]),
              );

            }
             ),
                ],
              ),
             ),
          ],
        ),

      ),
    );
  }
}