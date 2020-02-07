import 'package:flutter/material.dart';
import 'Usuario.dart';

class Presentacion extends StatelessWidget {
  final Usuario Persona;

  Presentacion(this.Persona);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our Clients',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text(Persona.Nombre)),),
        body: Cuerpo(Persona),
      ),
    );
  }
}

class Cuerpo extends StatelessWidget {
  final Usuario Persona;

  Cuerpo(this.Persona);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //verticalDirection: VerticalDirection.up,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
                    child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(Persona.ImagenLARGE)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.person, color: Colors.green),
                        SizedBox(width: 6.0),
                        SelectableText(Persona.Username, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.email, color: Colors.deepPurpleAccent),
                        SizedBox(width: 6.0),
                        SelectableText(Persona.Email, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.location_on, color: Colors.red),
                        SizedBox(width: 6.0),
                        SelectableText(Persona.Pais, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.location_city),
                        SizedBox(width: 6.0),
                        SelectableText(Persona.Estado, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.cake, color: Colors.pink),
                        SizedBox(width: 6.0),
                        SelectableText(Persona.Cumple + " (" + Persona.Edad.toString() + " years old)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.phone, color: Colors.lightBlue),
                        SizedBox(width: 6.0),
                        SelectableText(Persona.Telefono, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.cloud_upload),
                        SizedBox(width: 6.0),
                        SelectableText(Persona.RegistradoFecha + " (" + Persona.RegistradoHace.toString() + " years ago)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                      ],
                    ),
                  ),
                ],)
        ),
    );
  }
}
