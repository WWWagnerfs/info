import 'dart:convert';
import 'package:infocar/data/exceptions.dart';
import 'package:infocar/models/carro.dart';
import 'package:infocar/services/http_client.dart';

abstract class IdCarro {
  Future<List<Carro>> getCar();
}

class ICarro implements IdCarro {
  final IHttpClient client;

  ICarro({required this.client});

  @override
  Future<List<Carro>> getCar() async {
    final response = await client.get(
      url:
          'https://parallelum.com.br/fipe/api/v2/cars/brands/1/models/2/years/1992-1',
    );

    if (response.statusCode == 200) {
      final List<Carro> carros = [];

      final body = json.decode(response.body);
      if (body.containsKey('1992-1')) {
        final List<dynamic> carList = body['1992-1'];

        for (var item in carList) {
          final Carro carro = Carro.fromJson(item);
          carros.add(carro);
        }

        return carros;
      } else {
        throw Exception('Chave não encontrada no JSON');
      }
    } else if (response.statusCode == 404) {
      throw NotFoundException('A URL não foi encontrada');
    } else {
      throw Exception('Não foi possível carregar');
    }
  }
}
