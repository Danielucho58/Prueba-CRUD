import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:pruebasilice_app/add_activity.dart';
import 'package:pruebasilice_app/home_screen.dart';
import 'package:pruebasilice_app/text_box.dart';





class editActivity extends StatefulWidget {
  final Actividad _actividad;
  editActivity(this._actividad);
  @override
  State<StatefulWidget> createState() =>_editActivity(); 
}

class _editActivity extends State<editActivity>{
  late TextEditingController controllerTitulo;
  late TextEditingController controllerDescripcion;
  late TextEditingController controllerFecha;
  late TextEditingController _date = TextEditingController();
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
      title: Text ( "Editar Actividad"),
    ),
    body: ListView(
      children: [
          TextBox(controllerTitulo, "Titulo"),
          TextBox1(controllerDescripcion, "Descripción"),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 20),
            child: TextField(
              controller: _date,
              decoration: InputDecoration(
                icon: Icon(Icons.date_range_outlined),
                labelText: "Seleccione la fecha"               
              ),
            onTap: () async {
              DateTime? selectdate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(), 
                firstDate: DateTime(2024), 
                lastDate: DateTime(2030));
              if (selectdate != null){
                setState(() {
                  _date.text = DateFormat('yyyy-MM-dd').format(selectdate);
                });
              }
            }
            
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 127, 87)),
              onPressed: () {
                String Titulo = controllerTitulo.text;
                String Descripcion = controllerDescripcion.text;
                String Fecha = _date.text;
                if (Titulo.isNotEmpty && Descripcion.isNotEmpty)
                {
                  Navigator.pop(context, Actividad(Titulo: Titulo, Descripcion: Descripcion,Fecha: Fecha));
                }
              }, 
              child: Text("Guardar Actividad",style: TextStyle(fontSize:20,color: Colors.black))
              ),
          )
      ],
    ),
   );
  }


}