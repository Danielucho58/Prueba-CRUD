
import 'package:flutter/material.dart';
import 'package:pruebasilice_app/add_activity.dart';
import 'package:pruebasilice_app/db/database.dart';
import 'package:pruebasilice_app/edit_activity.dart';
import 'package:pruebasilice_app/listview.dart';




class HomeScreen extends  StatefulWidget {
   
  @override
  State<StatefulWidget> createState() => _HomeScreen();  
}

class _HomeScreen extends State<HomeScreen>{
  

  List<Actividad> Actividades = [
    Actividad(Titulo: 'Gimnasio', Descripcion: '02/04/2024',Fecha: '01/7/85'),
    Actividad(Titulo: 'Trabajo', Descripcion: '02/04/2024',Fecha: '01/7/85'),
    Actividad(Titulo: 'Escuela',  Descripcion: '15/04/2024',Fecha: '01/7/85'),
    Actividad(Titulo: 'Supermercado', Descripcion: '02304/2024',Fecha: '01/7/85'),   
    
  ];

  


  void onEditActivity (int index){
    Navigator.push(
      context, MaterialPageRoute(
         builder: (_)=>editActivity(Actividades[index])))
         .then((newActivity) {
            if(newActivity != null){
               setState(() {
                 Actividades.removeAt(index);
                 Actividades.insert(index,newActivity);
             });
          }
      }
    );
  }

  void onDeleteActividad (int index){
    setState(() {
    Actividades.removeAt(index);    
    });
  }
  @override
  Widget build(BuildContext context) {

    Operation.activities();
    
   return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('Mis Actividades'),
    ),
    body: ListView.separated(
      itemCount: Actividades.length,
      separatorBuilder: (_,__)=>Divider(color: Colors.black,height: 15,),
      itemBuilder: (context, index)
       {
        return Dismissible(
          key: UniqueKey(),
          background: Container(
            color: Colors.red,
            child: Icon(Icons.delete_outline_rounded),
            alignment: Alignment.centerLeft ,
            padding: EdgeInsets.only(left: 15),
          ),
          secondaryBackground: Container(
            color: Colors.blue,
            child: Icon(Icons.edit),
            alignment: Alignment.centerRight ,
            padding: EdgeInsets.only(right: 15),
          ),
          onDismissed:  (direction) {
            if (direction == DismissDirection.startToEnd ) {
              print("Eliminar esta actividad $Actividades");
              onDeleteActividad(index);
            } 
          },
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.endToStart) {
              onEditActivity(index);
              return false;
            }
            return true;
          },
          
          child: ListTile(
            onTap: () {
             Navigator.push(context,MaterialPageRoute(builder: (_)=>viewActivity(Actividades[index]))); 
            },
            
            title: Text(Actividades[index].Titulo),
            subtitle: Text(Actividades[index].Fecha)
            ),
            
        );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (_)=>AddActivity()))
          .then((newActivity){
            if(newActivity != null){
              setState(() {
               Actividades.add(newActivity); 
              });
            }
          });

        },
        tooltip: "Crear Actividad",
        child: Icon(Icons.add_outlined,color: Colors.deepOrange,)
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
       
   );
  }
}

class Actividad {
  var Titulo;
  var Descripcion;
  var Fecha;
 

  Actividad ({this.Titulo, this.Descripcion, this.Fecha});
}


