import 'package:flutter/material.dart';
import 'package:tractian_challenge/app/domain/models/node.dart';
import 'package:tractian_challenge/app/presentation/screens/assets/widgets/node_item.dart';

class NodeListView extends StatelessWidget {
  final List<NodeModel> nodes;

  const NodeListView({super.key, required this.nodes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: nodes.length,
      itemBuilder: (context, index) {
        final node = nodes[index];
        return NodeItem(node: node);
      },
    );
  }
}
