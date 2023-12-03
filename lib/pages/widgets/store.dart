import 'package:flutter/material.dart';
import 'package:infocar/data/exceptions.dart';
import 'package:infocar/models/carro.dart';
import 'package:infocar/services/carro_service.dart';

class CarroStore {
  final ICarro repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<Carro>> state = ValueNotifier<List<Carro>>([]);

  final ValueNotifier<String> erro = ValueNotifier<String>('');

  CarroStore({required this.repository});

  Future getCar() async {
    isLoading.value = true;

    try {
      final result = await repository.getCar();
      state.value = result.cast<Carro>();
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}
