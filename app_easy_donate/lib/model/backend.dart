import 'package:app_easy_donate/model/solicitud.dart';
import 'package:app_easy_donate/pages/donateme.dart';

import 'donate.dart';

class Backend {
  /// Singleton pattern used here.
  static final Backend _backend = Backend._internal();

  factory Backend() {
    return _backend;
  }

  Backend._internal();

  /// Private list of emails. Hardcoded here for testing purposes.
  final _donates = [
    Donate(
      id: 1,
      date: '2022 - 01 - 20',
      time: '10h: 30',
      tipodonation: 'Alimentos',
      descripcion: 'Latas de Átun Isabel de 400g cada una, cantidad total 30 unidades. Ademas, 10 sacos de arroz de 20 lbs.',
      direccion: 'Manta. Calle 15, Avenidad 24',
      cantidad: 60,
      image: 'assets/image/alimentos.jpg',
      estado: false,
      
    ),
    Donate(
      id: 2,
      date: '2022 - 02 - 15',
      time: '14h: 00',
      tipodonation: 'Alimentos, Ropa',
      descripcion: 'Saco de arroz 50Kg, 10 unidades. En ropa cuento con 5 pantalones nuevos de talla 32 de tipo jeans y 5 pares de zapatos deportivos usados en exelente estado.',
      direccion: 'Manta. Calle 321, Avenidad 4 de Noviembre',
      cantidad: 20,
      image: 'assets/image/alimentos.jpg',
      estado: false,
    ),
        Donate(
      id: 3,
      date: '2022 - 01 - 20',
      time: '10h: 30',
      tipodonation: 'Alimentos, Juguetes',
      descripcion: 'Latas de Átun Isabel de 400g, 30 unidades. Ademas, se cuenta con 30 juguetes para niños (pelotas de soccer).',
      direccion: 'Manta. Calle 15, Avenidad 24',
      cantidad: 60,
      image: 'assets/image/alimentos.jpg',
      estado: false,
    ),
    Donate(
      id: 4,
      date: '2022 - 02 - 15',
      time: '14h: 00',
      tipodonation: 'Alimentos',
      descripcion: 'Latas de Átun Isabel de 400g cada una, cantidad total 30 unidades. Ademas, 10 sacos de arroz de 20 lbs.',
      direccion: 'Manta. Calle 321, Avenidad 4 de Noviembre',
      cantidad: 20,
      image: 'assets/image/alimentos.jpg',
      estado: false,
    ),
        Donate(
      id: 5,
      date: '2022 - 01 - 20',
      time: '10h: 30',
      tipodonation: 'Alimentos, Ropa',
      descripcion: 'Saco de arroz 50Kg, 10 unidades. En ropa cuento con 5 pantalones nuevos de talla 32 de tipo jeans y 5 pares de zapatos deportivos usados en exelente estado.',
      direccion: 'Manta. Calle 15, Avenidad 24',
      cantidad: 60,
      image: 'assets/image/alimentos.jpg',
      estado: false,
    ),
    Donate(
      id: 6,
      date: '2022 - 02 - 15',
      time: '14h: 00',
      tipodonation: 'Alimentos, Juguetes',
      descripcion: 'Latas de Átun Isabel de 400g, 30 unidades. Ademas, se cuenta con 30 juguetes para niños (pelotas de soccer).',
      direccion: 'Manta. Calle 321, Avenidad 4 de Noviembre',
      cantidad: 20,
      image: 'assets/image/alimentos.jpg',
      estado: false,
    ),
        Donate(
      id: 7,
      date: '2022 - 01 - 20',
      time: '10h: 30',
      tipodonation: 'Alimentos, Juguetes',
      descripcion: 'Latas de Átun Isabel de 400g, 30 unidades. Ademas, se cuenta con 30 juguetes para niños (pelotas de soccer).',
      direccion: 'Manta. Calle 15, Avenidad 24',
      cantidad: 60,
      image: 'assets/image/alimentos.jpg',
      estado: false,
    ),
    Donate(
      id: 8,
      date: '2022 - 02 - 15',
      time: '14h: 00',
      tipodonation: 'Alimentos',
      descripcion: 'Latas de Átun Isabel de 400g cada una, cantidad total 30 unidades. Ademas, 10 sacos de arroz de 20 lbs.',
      direccion: 'Manta. Calle 321, Avenidad 4 de Noviembre',
      cantidad: 20,
      image: 'assets/image/alimentos.jpg',
      estado: true,
    ),

  ];


  final _solicitudes = [
    Solicitud(
      id: 1,
      nombre: 'Leonardo Dennis García Saltos',
      direccion: 'Manta. Calle 15, Avenidad 24',
      descripcion: 'Reciba en estas líneas nuestro cordial saludo esperando que se encuentre bien de salud. Quien se dirige a usted de parte de la iglesia La Merced que durante 15 años ha brindado ayuda espiritual, psicológica y humanitaria a quienes más lo necesitan. Es por esta razón que nos tomamos el atrevimiento de pedir su colaboración con tan noble causa esperando pueda hacernos llegar un donativo voluntario que ayude a retribuir la esmerada acción de estas mujeres con este pequeño pero significativo compartir por el día de las madres.',
      image: 'assets/image/personas.png'
    ),
    Solicitud(
      id: 2,
      nombre: 'Katherine Susana Cevallos Ponce',
      direccion: 'Manta. Calle 15, Avenidad 24',
      descripcion: 'Reciba en estas líneas nuestro cordial saludo esperando que se encuentre bien de salud. Quien se dirige a usted de parte de la iglesia La Merced que durante 15 años ha brindado ayuda espiritual, psicológica y humanitaria a quienes más lo necesitan. Es por esta razón que nos tomamos el atrevimiento de pedir su colaboración con tan noble causa esperando pueda hacernos llegar un donativo voluntario que ayude a retribuir la esmerada acción de estas mujeres con este pequeño pero significativo compartir por el día de las madres.',
      image: 'assets/image/personas.png'
    ),
    Solicitud(
      id: 3,
      nombre: 'Lidia Martina Teran Rojas',
      direccion: 'Manta. Calle 15, Avenidad 24',
      descripcion: 'Reciba en estas líneas nuestro cordial saludo esperando que se encuentre bien de salud. Quien se dirige a usted de parte de la iglesia La Merced que durante 15 años ha brindado ayuda espiritual, psicológica y humanitaria a quienes más lo necesitan. Es por esta razón que nos tomamos el atrevimiento de pedir su colaboración con tan noble causa esperando pueda hacernos llegar un donativo voluntario que ayude a retribuir la esmerada acción de estas mujeres con este pequeño pero significativo compartir por el día de las madres.',
      image: 'assets/image/personas.png'
    ),
    Solicitud(
      id: 4,
      nombre: 'Tania Maribel Quinde Anchundia',
      direccion: 'Manta. Calle 15, Avenidad 24',
      descripcion: 'Reciba en estas líneas nuestro cordial saludo esperando que se encuentre bien de salud. Quien se dirige a usted de parte de la iglesia La Merced que durante 15 años ha brindado ayuda espiritual, psicológica y humanitaria a quienes más lo necesitan. Es por esta razón que nos tomamos el atrevimiento de pedir su colaboración con tan noble causa esperando pueda hacernos llegar un donativo voluntario que ayude a retribuir la esmerada acción de estas mujeres con este pequeño pero significativo compartir por el día de las madres.',
      image: 'assets/image/personas.png'
    ),
    Solicitud(
      id: 5,
      nombre: 'Nayeli Fabiana Delgado Hernandez',
      direccion: 'Manta. Calle 15, Avenidad 24',
      descripcion: 'Reciba en estas líneas nuestro cordial saludo esperando que se encuentre bien de salud. Quien se dirige a usted de parte de la iglesia La Merced que durante 15 años ha brindado ayuda espiritual, psicológica y humanitaria a quienes más lo necesitan. Es por esta razón que nos tomamos el atrevimiento de pedir su colaboración con tan noble causa esperando pueda hacernos llegar un donativo voluntario que ayude a retribuir la esmerada acción de estas mujeres con este pequeño pero significativo compartir por el día de las madres.',
      image: 'assets/image/personas.png'
    ),
    Solicitud(
      id: 6,
      nombre: 'Paul Antonio Vera Suarez',
      direccion: 'Manta. Calle 15, Avenidad 24',
      descripcion: 'Reciba en estas líneas nuestro cordial saludo esperando que se encuentre bien de salud. Quien se dirige a usted de parte de la iglesia La Merced que durante 15 años ha brindado ayuda espiritual, psicológica y humanitaria a quienes más lo necesitan. Es por esta razón que nos tomamos el atrevimiento de pedir su colaboración con tan noble causa esperando pueda hacernos llegar un donativo voluntario que ayude a retribuir la esmerada acción de estas mujeres con este pequeño pero significativo compartir por el día de las madres.',
     image: 'assets/image/personas.png'
    )
  ];

  
  ///
  /// Public API starts here :)
  ///

  List<Donate> getDonates() {
    return _donates;
  }

  void markDonatesAsRead(int id) {
    final index = _donates.indexWhere((donate) => donate.id == id);
    _donates[index].read = true;
  }

  void deleteDonates(int id) {
    _donates.removeWhere((donate) => donate.id == id);
  }

  List<Solicitud> getSolicitudes() {
    return _solicitudes;
  }

  void markSolicitudesAsRead(int id) {
    final index = _solicitudes.indexWhere((solicitud) => solicitud.id == id);
    _solicitudes[index].read = true;
  }

  void deleteSolicitudes(int id) {
    _solicitudes.removeWhere((solicitud) => solicitud.id == id);
  }
}
