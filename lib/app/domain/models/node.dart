import 'package:tractian_challenge/app/domain/models/element.dart';
import 'package:tractian_challenge/app/domain/models/location.dart';

class NodeModel {
  List<NodeModel> children;
  final ElementModel data;

  NodeModel({
    required this.data,
    required this.children,
  });

  factory NodeModel.root() => NodeModel(
        data: Location(
          id: "",
          name: "",
          type: ElementType.root,
        ),
        children: [],
      );
}
