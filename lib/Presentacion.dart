import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Usuario.dart';
import 'package:url_launcher/url_launcher.dart';

class Presentacion extends StatelessWidget {
  final Usuario Persona;

  Presentacion(this.Persona);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

    _launchMapsUrl(String pais) async {
      final url = 'https://www.google.com/maps/search/?api=1&query=$pais';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }

      return Void;
    }

    return SingleChildScrollView(
      child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //verticalDirection: VerticalDirection.up,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: CircleAvatar(
                        radius: 95,
                        backgroundImage: NetworkImage(Persona.ImagenLARGE)),
                  ),
                  Divider(indent: 20.0, endIndent: 20.0),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.person, color: Colors.green),
                        SizedBox(width: 6.0),
                        SelectableText(Persona.Username, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0)),
                      ],
                    ),
                  ),
                  OutlineButton(
                    onPressed: () {
                      final correo = Persona.Email;
                      final String msgSubject= 'An important message from Our Clients';
                      final String name = Persona.Nombre;
                      final String msgBody = 'Hello $name. We are communicating to you via email to inform you of...';
                      launch('mailto:$correo?subject=$msgSubject&body=$msgBody');
                      },
                    onLongPress: () {
                      Clipboard.setData(ClipboardData(text: Persona.Email));
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Copied to clipboard!")));
                      },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.email, color: Colors.deepPurpleAccent),
                        SizedBox(width: 6.0),
                        Text(Persona.Email, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0)),
                      ],
                    ),
                  ),
                  OutlineButton(
                    onPressed: () {_launchMapsUrl(Persona.Pais);},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.location_on, color: Colors.red),
                        SizedBox(width: 6.0),
                        Text(Persona.Estado + ", " + Persona.Pais, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.cake, color: Colors.pink),
                        SizedBox(width: 6.0),
                        SelectableText(Persona.Cumple + " (" + Persona.Edad.toString() + " years old)", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0)),
                      ],
                    ),
                  ),
                  OutlineButton(
                    onPressed: () { final numero = Persona.Telefono; launch('tel:$numero');},
                    onLongPress: () {
                      Clipboard.setData(ClipboardData(text: Persona.Telefono));
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Copied to clipboard!"),
                      ));
                    },
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.phone, color: Colors.lightBlue),
                          SizedBox(width: 6.0),
                          Text(Persona.Telefono, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0)),
                        ],
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.cloud_upload),
                        SizedBox(width: 6.0),
                        SelectableText(Persona.RegistradoFecha + " (" + Persona.RegistradoHace.toString() + " years ago)", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0)),
                      ],
                    ),
                  ),
                ],)
        ),
    );
  }
}
