import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class DatePicker extends StatefulWidget{
  //final TextEditingController _date = TextEditingController();
  //final TextEditingController _controller;
  //final String _label;
  //DatePicker(this._controller, this._label);
  
  @override
  State<DatePicker> createState()=> DatePickerState();

}

class DatePickerState extends State<DatePicker>{
final TextEditingController _date = TextEditingController();
  
  
  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
       
        body: TextField(
          controller: _date,
          decoration: InputDecoration(
            icon: Icon(Icons.calendar_month_outlined),
            labelText: "Seleccionar Fecha"
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
      );
  }
}
