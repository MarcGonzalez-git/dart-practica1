import '../classes/User.dart';
import '../classes/Vehicle.dart';
import '../classes/Patinet.dart';
import '../classes/Cotxe.dart';

void main() {
  List<Vehicle> flota = [];

  Patinet patinet1 = Patinet('P001', 90, 0.20, 25);
  Patinet patinet2 = Patinet('P002', 50, 0.25, 25);
  Patinet patinet3 = Patinet('P003', 10, 0.20, 20);

  Cotxe cotxe1 = Cotxe('C001', 85, 0.40, 5, true);
  Cotxe cotxe2 = Cotxe('C002', 30, 0.50, 4, false);

  patinet1.actualitzarUbicacio(39.5696, 2.6502);
  patinet2.actualitzarUbicacio(39.5705, 2.6485);
  patinet3.actualitzarUbicacio(39.5680, 2.6530);

  cotxe1.actualitzarUbicacio(39.5750, 2.6450);
  cotxe2.actualitzarUbicacio(39.5650, 2.6600);

  flota.add(patinet1);
  flota.add(patinet2);
  flota.add(patinet3);
  flota.add(cotxe1);
  flota.add(cotxe2);

  Vehicle vehicleBateriaMesAlta = flota.reduce((vehicle1, vehicle2) {
    if (vehicle1.bateriaPercentatge > vehicle2.bateriaPercentatge) {
      return vehicle1;
    } else {
      return vehicle2;
    }
  });

  print("Vehicle amb la bateria més alta: ${vehicleBateriaMesAlta.id} (${vehicleBateriaMesAlta.bateriaPercentatge}%)");

  List<Vehicle> vehiclesDisponibles = flota.where((vehicle) {
    return vehicle.bateriaPercentatge > 20 && vehicle.enUs == false;
  }).toList();

  print("Vehicles amb bateria superior al 20% i no en ús:");

  for (Vehicle vehicle in vehiclesDisponibles) {
    print("${vehicle.id} - ${vehicle.bateriaPercentatge}%");
  }

  User usuari = User.nou(
    id: "U001",
    nom: "Marc González",
    correu: "marcgonzalez1@paucasesnovescifp.cat",
  );

  double cost = patinet1.calcularCostReserva(15, usuari);
  print("Cost de la reserva: $cost €");

  patinet1.actualitzarUbicacio(39.5710, 2.6510);

  var (lat, lng) = patinet1.obtenirCoordenades();
  print("La nova ubicació és: Latitud $lat, Longitud $lng");

  try {
    usuari.recarregarSaldo(-10.0);
  } catch (e) {
    print("Error: $e");
  }
}