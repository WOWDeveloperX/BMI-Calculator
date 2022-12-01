import 'dart:ffi';

import 'dart:math';

class CalculationBrain {
  CalculationBrain({this.height, this.weight});

  final int? height;

  final int? weight;

  late double _bmi;

  String calculationBMI() {
    _bmi = weight! / pow(height! / 100, 2);

    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "лишний вес";
    } else if (_bmi > 25) {
      return "Норма";
    } else {
      return "Вес слишком мал";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "Нужно начать заниматься  активным спортом и соблюдать диету";
    } else if (_bmi > 25) {
      return "Вес нормальный так держать!";
    } else {
      return "Нужно больше есть, купи протеин и иди в зал";
    }
  }
}
