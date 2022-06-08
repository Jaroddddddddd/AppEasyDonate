class Solicitud {
  final int id;
  final String nombre;
  final String direccion;
  final String descripcion;
  final String image;
  bool read;

  Solicitud({
    required this.id,
    required this.nombre,
    required this.direccion,
    required this.descripcion,
    required this.image,
    this.read = false,
  });
}