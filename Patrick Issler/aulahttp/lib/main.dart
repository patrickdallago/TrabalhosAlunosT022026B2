import 'dart:convert';

import 'package:aulahttp/models/Pessoa.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var usuarios = [];

  void _buscarDados() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    final List lista = jsonDecode(response.body);
    // for(int i = 0; i < lista.length; i++){
    //   print(lista[i]['name']);
    // }
    setState(() {
      usuarios = lista.map((item) =>
        Pessoa.fromJson(item)
      ).toList();
    });

  }

  @override
  Widget build(BuildContext context) {
    _buscarDados();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
      child:  ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (context, index){
          final usuario = usuarios[index] ;
          return ListTile(
            title: Text(usuario.name),
            subtitle: Text(usuario.phone),
          );
        },

      )
      ),

    );
  }
}








