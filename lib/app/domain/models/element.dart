enum ElementType {
  asset,
  company,
  component,
  location,
  root;

  bool get isAsset => this == ElementType.asset;
  bool get isComponent => this == ElementType.component;
  bool get isLocation => this == ElementType.location;
}

abstract class ElementModel {
  String id;
  String name;
  ElementType type;
  String? parentId;
  String? sensorId;
  String? sensorType;
  String? status;
  String? gatewayId;
  String? locationId;

  ElementModel({
    required this.id,
    required this.name,
    required this.type,
    this.parentId,
    this.sensorId,
    this.sensorType,
    this.status,
    this.gatewayId,
    this.locationId,
  });
}
