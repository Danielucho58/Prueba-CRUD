import 'package:flutter/material.dart';
import 'package:pruebasilice_app/home_screen.dart';
import 'package:pruebasilice_app/text_box.dart';





class viewActivity extends StatefulWidget {
  final Actividad _actividad;
  viewActivity(this._actividad);
  @override
  State<StatefulWidget> createState() =>_viewActivity(); 
}

class _viewActivity extends State<viewActivity>{
  late TextEditingController controllerTitulo;
  late TextEditingController controllerDescripcion;
  late TextEditingController controllerFecha;
  @override
  void initState(){
  Actividad c = widget._actividad;
  controllerTitulo = TextEditingController(text: c.Titulo);
  controllerDescripcion = TextEditingController(text: c.Descripcion);
  controllerFecha = TextEditingController(text: c.Fecha);
  super.initState();
  }
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: Text ( "Mi Actividad"),
    ),
    body: ListView(
      children: [
          listviewTextBox(controllerTitulo, "Titulo"),
          listviewTextBox1(controllerDescripcion, "Descripción"),
          //Fecha(controllerFecha, "Fecha"),
      ],
    ),
   );
  }


}