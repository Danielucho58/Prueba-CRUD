class Activity1 {
  final int? id;
  final String Titulo;
  final String Descripcion;
  final String Fecha;
  
  Activity1({this.id, required this.Titulo,required this.Descripcion,required this.Fecha});

  Activity1 copyWith({int? id, String? Titulo,String? Descripcion,String? Fecha}){
    return Activity1(Titulo: Titulo ?? this.Titulo, Descripcion: Descripcion ?? this.Descripcion, Fecha: Fecha ?? this.Fecha);
  }

  Map <String,dynamic> toMap(){
    return {'id': id, 'Titulo': Titulo, 'Descripcion': Descripcion, 'Fecha': Fecha};
  }


}