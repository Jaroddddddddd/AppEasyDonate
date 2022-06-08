class Donate {
  final int id;
  final String date;
  final String time;
  final String alimentos;
  final String direccion;
  final int cantidad;
  final String image;
  bool read;

  Donate({
    required this.id,
    required this.date,
    required this.time,
    required this.alimentos,
    required this.direccion,
    required this.cantidad,
    required this.image,
    this.read = false,
  });
}
