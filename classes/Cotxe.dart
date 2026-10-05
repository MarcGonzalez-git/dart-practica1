import 'User.dart';
import 'Vehicle.dart';

class Cotxe extends Vehicle {
  int places;
  bool requereixLlicencia;

  Cotxe(String id, int bateriaPercentatge, double preuPerMinut, this.places, this.requereixLlicencia) : super(id, bateriaPercentatge, preuPerMinut);

  @override
  double calcularCostReserva(int minuts, User usuari) {
    double suplementFiltreEcologic = 2.0;
    double cost = (minuts * preuPerMinut) + suplementFiltreEcologic;
    return cost;
  }
}