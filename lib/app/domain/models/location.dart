import 'dart:convert';

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

class Location {
  String id;
  String name;
  String? parentId;

  Location({
    required this.id,
    required this.name,
    this.parentId,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        parentId: json["parentId"],
      );
}
