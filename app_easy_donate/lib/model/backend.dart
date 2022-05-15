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
      alimentos: 'Latas de Átun 400g',
      direccion: 'Manta. Calle 15, Avenidad 24',
      cantidad: 60
    ),
    Donate(
      id: 2,
      date: '2022 - 02 - 15',
      time: '14h: 00',
      alimentos: 'Saco de arroz 50Kg',
      direccion: 'Manta. Calle 321, Avenidad 4 de Noviembre',
      cantidad: 20
    ),
        Donate(
      id: 3,
      date: '2022 - 01 - 20',
      time: '10h: 30',
      alimentos: 'Latas de Átun 400g',
      direccion: 'Manta. Calle 15, Avenidad 24',
      cantidad: 60
    ),
    Donate(
      id: 1,
      date: '2022 - 02 - 15',
      time: '14h: 00',
      alimentos: 'Saco de arroz 50Kg',
      direccion: 'Manta. Calle 321, Avenidad 4 de Noviembre',
      cantidad: 20
    ),
        Donate(
      id: 1,
      date: '2022 - 01 - 20',
      time: '10h: 30',
      alimentos: 'Latas de Átun 400g',
      direccion: 'Manta. Calle 15, Avenidad 24',
      cantidad: 60
    ),
    Donate(
      id: 1,
      date: '2022 - 02 - 15',
      time: '14h: 00',
      alimentos: 'Saco de arroz 50Kg',
      direccion: 'Manta. Calle 321, Avenidad 4 de Noviembre',
      cantidad: 20
    ),
        Donate(
      id: 1,
      date: '2022 - 01 - 20',
      time: '10h: 30',
      alimentos: 'Latas de Átun 400g',
      direccion: 'Manta. Calle 15, Avenidad 24',
      cantidad: 60
    ),
    Donate(
      id: 1,
      date: '2022 - 02 - 15',
      time: '14h: 00',
      alimentos: 'Saco de arroz 50Kg',
      direccion: 'Manta. Calle 321, Avenidad 4 de Noviembre',
      cantidad: 20
    ),
    
    


  ];

  ///
  /// Public API starts here :)
  ///

  /// Returns all emails.
  List<Donate> getDonates() {
    return _donates;
  }


  /// Deletes email identified by its id.
  void deleteEmail(int id) {
    _donates.removeWhere((email) => email.id == id);
  }
}
