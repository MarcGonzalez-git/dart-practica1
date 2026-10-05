class User {
  String _id;
  String _nomComplet;
  double _saldo;

  String correu;
  bool esVIP;

    User.nou({
      required String id,
      required String nom,
      required String correu
    }) : _id = id,
        _nomComplet = nom,
        _saldo = 0.0,
        this.correu = correu,
        esVIP = false;

  User(this._id, this._nomComplet, this._saldo, this.correu, this.esVIP);

  double get saldo {
    return _saldo;
  }

  String get id {
    return _id;
  }

  void recarregarSaldo(double quantitat) {
      if(quantitat <= 0) {
          throw ArgumentError("La quantitat ha de ser major que zero");
      }
  }
}