import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Usuario.dart';
import 'Presentacion.dart';

class Lista extends StatefulWidget {
  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  final List<Usuario> Items = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future _getData() async {
    print('esperando respuesta...');
    Usuario User = Usuario();
    final http.Response respuesta = await http.get(
        "https://randomuser.me/api?results=400");
    print('respuesta: $respuesta');

    final Personas = json.decode(respuesta.body)['results'];
    Personas.forEach((Persona) => {
      User = Usuario(
        Nombre: Persona['name']['first'] + ' ' + Persona['name']['last'],
        Username: Persona['login']['username'],
        Email: Persona['email'],
        Cumple: Persona['dob']['date'].substring(0,10), //Se trunca para sacar la hora del nacimiento
        Edad: Persona['dob']['age'],
        Telefono: Persona['cell'],
        Pais: Persona['location']['country'],
        RegistradoFecha: Persona['registered']['date'].substring(0,10), //Se trunca para sacar la hora de registro
        RegistradoHace: Persona['registered']['age'],
        Estado: Persona['location']['state'],
        ImagenTHUMB: Persona['picture']['thumbnail'],
        ImagenMEDIUM: Persona['picture']['medium'],
        ImagenLARGE: Persona['picture']['large'],
      ),

      setState(() {
        Items.add(User);
      })
    });

  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: listTiles,
        separatorBuilder: (context, index) =>
            Divider(color: Colors.black, indent: 8.0, endIndent: 8.0,),
        itemCount: this.Items.length);
  }

  Widget listTiles(BuildContext context, int index) {
    return ListTile(
      dense: false,
        contentPadding: EdgeInsets.all(10.0),
        leading: CircleAvatar(
            backgroundImage: NetworkImage(this.Items[index].ImagenTHUMB)
        ),
        title: Text(this.Items[index].Nombre),
        onLongPress: () {
          Scaffold.of(context).showSnackBar(
              SnackBar(elevation: 0.0,
                backgroundColor: Colors.white70,
                duration: Duration(seconds: 1),
                content: Text(
                  'Show more information about ${this.Items[index].Nombre}', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                   ));
        },
        subtitle: Text(this.Items[index].Username),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Presentacion(this.Items[index])),
          );
        });
  }
}