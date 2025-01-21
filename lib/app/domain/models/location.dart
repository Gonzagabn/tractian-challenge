import 'dart:convert';

import 'package:tractian_challenge/app/domain/models/element.dart';

LocationModel locationModelFromJson(String str) =>
    LocationModel.fromJson(json.decode(str));

class LocationModel {
  final List<Location> items;

  LocationModel({
    this.items = const [],
  });

  factory LocationModel.fromJson(List<dynamic> jsonList) => LocationModel(
        items: List<Location>.from(
          jsonList.map(
            (location) => Location.fromJson(location),
          ),
        ),
      );
}

class Location extends ElementModel {
  Location({
    required super.id,
    required super.name,
    required super.type,
    super.parentId,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        type: ElementType.location,
        parentId: json["parentId"],
      );
}
