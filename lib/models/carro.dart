class Carro {
  int? vehicleType;
  String? price;
  String? brand;
  String? model;
  int? modelYear;
  String? fuel;
  String? codeFipe;
  String? referenceMonth;
  String? fuelAcronym;

  Carro(
      {this.vehicleType,
      this.price,
      this.brand,
      this.model,
      this.modelYear,
      this.fuel,
      this.codeFipe,
      this.referenceMonth,
      this.fuelAcronym});

  Carro.fromJson(Map<String, dynamic> json) {
    vehicleType = json['vehicleType'];
    price = json['price'];
    brand = json['brand'];
    model = json['model'];
    modelYear = json['modelYear'];
    fuel = json['fuel'];
    codeFipe = json['codeFipe'];
    referenceMonth = json['referenceMonth'];
    fuelAcronym = json['fuelAcronym'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vehicleType'] = vehicleType;
    data['price'] = price;
    data['brand'] = brand;
    data['model'] = model;
    data['modelYear'] = modelYear;
    data['fuel'] = fuel;
    data['codeFipe'] = codeFipe;
    data['referenceMonth'] = referenceMonth;
    data['fuelAcronym'] = fuelAcronym;
    return data;
  }
}
