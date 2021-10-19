import 'package:flutter_crud_firebase_1/data/model/ratecalulation_model.dart';

class RateCalculationData {
  List _data = [
    RateCalculationModel(
      id: 0,
      name: "Budi",
      desc: "Good Job..",
      stars: 5,
    ),
    RateCalculationModel(
      id: 1,
      name: "Alex",
      desc: "Good Job..",
      stars: 5,
    ),
    RateCalculationModel(
      id: 2,
      name: "Jones",
      desc: "Good Job..",
      stars: 5,
    ),
    RateCalculationModel(
      id: 3,
      name: "George",
      desc: "Good Job..",
      stars: 4,
    ),
    RateCalculationModel(
      id: 4,
      name: "Francis",
      desc: "Good Power..",
      stars: 5,
    ),
  ];

  List get data {
    return [..._data];
  }
}
