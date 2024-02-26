import 'package:flutter/material.dart';
import 'package:medical_test_range/infrastructure/model/meta_data_model.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider();

  final List<MetaDataResponse> metaData = [
    MetaDataResponse(
      rangeStart: 0,
      rangeEnd: 30,
      meaning: "Dangerous",
      color: Colors.red,
    ),
    MetaDataResponse(
      rangeStart: 30,
      rangeEnd: 40,
      meaning: "Moderate",
      color: Colors.orange,
    ),
    MetaDataResponse(
      rangeStart: 40,
      rangeEnd: 60,
      meaning: "Ideal",
      color: Colors.green,
    ),
    MetaDataResponse(
      rangeStart: 60,
      rangeEnd: 70,
      meaning: "Moderate",
      color: Colors.orange,
    ),
    MetaDataResponse(
      rangeStart: 70,
      rangeEnd: 120,
      meaning: "Dangerous",
      color: Colors.red,
    )
  ];
}
