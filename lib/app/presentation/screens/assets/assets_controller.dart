import 'package:get/get.dart';
import 'package:tractian_challenge/app/core/base/base_controller.dart';
import 'package:tractian_challenge/app/domain/models/asset.dart';
import 'package:tractian_challenge/app/domain/models/company.dart';
import 'package:tractian_challenge/app/domain/models/element.dart';
import 'package:tractian_challenge/app/domain/models/location.dart';
import 'package:tractian_challenge/app/domain/models/node.dart';
import 'package:tractian_challenge/app/domain/use_cases/assets_use_case.dart';
import 'package:tractian_challenge/app/domain/use_cases/locations_use_case.dart';

class AssetsController extends BaseController {
  final IAssetsUseCase assetsUseCase;
  final ILocationsUseCase locationsUseCase;

  AssetsController({
    required this.assetsUseCase,
    required this.locationsUseCase,
  });

  final Rx<Company> company = Company.empty().obs;
  final Rx<AssetModel> assets = AssetModel().obs;
  final Rx<LocationModel> locations = LocationModel().obs;
  final Rx<NodeModel> processedData = NodeModel.root().obs;

  String get companyId => company.value.id;
  String get companyName => company.value.name;

  void onRefresh(String companyId) => getData(companyId);

  Future<void> getData(String companyId) async {
    loadingData.value = true;
    await Future.wait([
      getAssets(companyId),
      getLocations(companyId),
    ]);
    processData();
    loadingData.value = false;
  }

  Future<dynamic> getAssets(String companyId) async {
    try {
      await assetsUseCase
          .getAssets(companyId)
          .then((data) => assets.value = data);
    } catch (error) {
      throw Exception('AssetsController: getAssets $error');
    }
  }

  Future<dynamic> getLocations(String companyId) async {
    try {
      loadingData.value = true;
      await locationsUseCase
          .getLocations(companyId)
          .then((data) => locations.value = data);
    } catch (error) {
      throw Exception('LocationsController: getLocations $error');
    }
  }

  void processData() {
    // Limpa os dados processados anteriores
    processedData.value.children.clear();

    // Conjunto temporário para armazenar os dados não processados sem duplicação
    final Set<NodeModel> unprocessedData = {};

    // Função auxiliar para preencher o conjunto de dados não processados
    void fillUnprocessedList(List<ElementModel> elements) {
      unprocessedData.addAll(
          elements.map((element) => NodeModel(data: element, children: [])));
    }

    // Preenche o conjunto de dados não processados com os itens de locations e assets
    fillUnprocessedList(locations.value.items);
    fillUnprocessedList(assets.value.items);

    // Constrói a árvore a partir dos dados não processados e define como filhos dos dados processados
    processedData.value.children = buildTree(unprocessedData.toList(), null);
  }

  List<NodeModel> buildTree(List<NodeModel> nodes, String? id) {
    // Mapa para agrupar nós por parentId e locationId
    final Map<String?, List<NodeModel>> groupedNodes = {};

    for (var node in nodes) {
      final key = node.data.parentId ?? node.data.locationId;
      if (groupedNodes.containsKey(key)) {
        groupedNodes[key]!.add(node);
      } else {
        groupedNodes[key] = [node];
      }
    }

    // Função recursiva para construir a árvore
    List<NodeModel> build(String? id) {
      if (!groupedNodes.containsKey(id)) return [];

      final children = groupedNodes[id]!;
      for (var child in children) {
        child.children = build(child.data.id);
      }
      return children;
    }

    return build(id);
  }
}
