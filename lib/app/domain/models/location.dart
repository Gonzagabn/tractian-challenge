import 'dart:convert';

LocationModel locationModelFromJson(String str) =>
    LocationModel.fromJson(json.decode(str));

class LocationModel {
  final List<Billboard?> items;

  LocationModel({
    this.items = const [],
  });

  factory LocationModel.fromJson(List<Map<String, dynamic>?> jsonList) =>
      LocationModel(
        items: List<Billboard?>.from(
            jsonList.map((billboard) => Billboard.fromJson(billboard ?? {}))),
      );
}

class Billboard {
  String? id;
  String? title;
  String? description;
  String? imageUrl;
  bool editMode;

  Billboard({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.editMode = false,
  });

  static Billboard newBillboard() => Billboard(
        title: 'Título',
        description: 'Descrição',
      );

  factory Billboard.fromJson(Map<String, dynamic> json) => Billboard(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "imageUrl": imageUrl,
      };

  factory Billboard.fromQueryParameters(Map<String, dynamic>? json) =>
      Billboard(
        id: json?["id"],
        title: json?["title"],
        description: json?["description"],
        imageUrl: json?["imageUrl"],
        editMode: json?["editMode"] == 'true',
      );

  Map<String, String> toQueryParameters() => {
        "id": id ?? '',
        "title": title ?? '',
        "description": description ?? '',
        "imageUrl": imageUrl ?? '',
        "editMode": editMode.toString(),
      };
}
