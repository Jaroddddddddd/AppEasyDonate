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
      id: 4,
      date: '2022 - 02 - 15',
      time: '14h: 00',
      alimentos: 'Saco de arroz 50Kg',
      direccion: 'Manta. Calle 321, Avenidad 4 de Noviembre',
      cantidad: 20
    ),
        Donate(
      id: 5,
      date: '2022 - 01 - 20',
      time: '10h: 30',
      alimentos: 'Latas de Átun 400g',
      direccion: 'Manta. Calle 15, Avenidad 24',
      cantidad: 60
    ),
    Donate(
      id: 6,
      date: '2022 - 02 - 15',
      time: '14h: 00',
      alimentos: 'Saco de arroz 50Kg',
      direccion: 'Manta. Calle 321, Avenidad 4 de Noviembre',
      cantidad: 20
    ),
        Donate(
      id: 7,
      date: '2022 - 01 - 20',
      time: '10h: 30',
      alimentos: 'Latas de Átun 400g',
      direccion: 'Manta. Calle 15, Avenidad 24',
      cantidad: 60
    ),
    Donate(
      id: 8,
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

  List<Donate> getDonates() {
    return _donates;
  }

  void markDonatesAsRead(int id) {
    final index = _donates.indexWhere((donate) => donate.id == id);
    _donates[index].read = true;
  }

  void deleteDonates(int id) {
    _donates.removeWhere((email) => email.id == id);
  }
}
