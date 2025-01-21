import 'dart:convert';

import 'package:tractian_challenge/app/domain/models/element.dart';

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

class Asset extends ElementModel {
  Asset({
    required super.id,
    required super.name,
    required super.type,
    super.parentId,
    super.sensorId,
    super.sensorType,
    super.status,
    super.gatewayId,
    super.locationId,
  });

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
        id: json["id"],
        name: json["name"],
        type: json["sensorType"] == null
            ? ElementType.asset
            : ElementType.component,
        parentId: json["parentId"],
        sensorId: json["sensorId"],
        sensorType: json["sensorType"],
        status: json["status"],
        gatewayId: json["gatewayId"],
        locationId: json["locationId"],
      );
}
