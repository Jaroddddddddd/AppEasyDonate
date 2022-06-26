class Donate {
  final int id;
  final String date;
  final String time;
  final String tipodonation;
  final String descripcion;
  final String direccion;
  final int cantidad;
  final String image;
  bool estado;
  bool read;

  Donate({
    required this.id,
    required this.date,
    required this.time,
    required this.tipodonation,
    required this.descripcion,
    required this.direccion,
    required this.cantidad,
    required this.image,
    this.estado = false,
    this.read = false,
  });
}
