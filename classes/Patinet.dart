import 'Vehicle.dart';
import 'User.dart';

class Patinet extends Vehicle {
  int velocitatMaxima;

  Patinet(String id, int bateriaPercentatge, double preuPerMinut, this.velocitatMaxima) : super(id, bateriaPercentatge, preuPerMinut);

  @override 
  double calcularCostReserva(int minuts, User usuari) {
    double cost = minuts * preuPerMinut;

    if (usuari.esVIP == true) {
      cost = cost * 0.9;
    }

    return cost;
  }
}