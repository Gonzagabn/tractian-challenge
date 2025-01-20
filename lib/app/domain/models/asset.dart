import 'dart:convert';

AssetModel assetModelFromJson(String str) =>
    AssetModel.fromJson(json.decode(str));

class AssetModel {
  final List<Asset> items;

  AssetModel({
    this.items = const [],
  });

  factory AssetModel.fromJson(List<dynamic> jsonList) => AssetModel(
        items: List<Asset>.from(
          jsonList.map(
            (asset) => Asset.fromJson(asset),
          ),
        ),
      );
}

class Asset {
  String id;
  String name;
  String? parentId;
  String? sensorId;
  String? sensorType;
  String? status;
  String? gatewayId;
  String? locationId;

  Asset({
    required this.id,
    required this.name,
    this.parentId,
    this.sensorId,
    this.sensorType,
    this.status,
    this.gatewayId,
    this.locationId,
  });

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
        id: json["id"],
        name: json["name"],
        parentId: json["parentId"],
        sensorId: json["sensorId"],
        sensorType: json["sensorType"],
        status: json["status"],
        gatewayId: json["gatewayId"],
        locationId: json["locationId"],
      );
}
