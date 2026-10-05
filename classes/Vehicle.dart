import '../GPSLocation.dart';
import 'User.dart';

abstract class Vehicle with GPSLocation {
  String id;
  int bateriaPercentatge;
  bool enUs = false;
  double preuPerMinut;

  Vehicle(this.id, this.bateriaPercentatge, this.preuPerMinut);

  String estatBateria() {
    return switch (bateriaPercentatge) {
      >= 80 => "Alta",
      >= 20 && <= 79 => "Mitjana",
      < 20 => "Crítica (Requereix càrrega)",
      _ => "Valor no vàlid"
    };
  }

  double calcularCostReserva(int minuts, User usuari);

}