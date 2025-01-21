import 'package:flutter/material.dart';
import 'package:tractian_challenge/app/domain/models/element.dart';
import 'package:tractian_challenge/app/domain/models/node.dart';
import 'package:tractian_challenge/app/presentation/screens/assets/widgets/node_list_view.dart';
import 'package:tractian_challenge/app/utils/constants/icons.dart';
import 'package:tractian_challenge/app/utils/resources/spacing.dart';
import 'package:tractian_challenge/app/utils/themes/colors.dart';

class NodeItem extends StatefulWidget {
  final NodeModel node;

  const NodeItem({super.key, required this.node});

  @override
  NodeItemState createState() => NodeItemState();
}

class NodeItemState extends State<NodeItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(
              vertical: SpacingValue.xxxs,
            ),
            child: Row(
              children: [
                Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  size: 16.0,
                  color: widget.node.children.isNotEmpty
                      ? AppColors.darkBlue
                      : Colors.transparent,
                ),
                HorizontalSpacing.xxxs,
                Image.asset(
                  getImagePathByDataType(widget.node.data.type),
                  height: 22,
                ),
                HorizontalSpacing.xxxs,
                Flexible(
                  child: Text(
                    widget.node.data.name,
                    style: TextStyle(color: AppColors.darkBlue),
                  ),
                ),
                if (widget.node.data.sensorType == "energy") ...[
                  HorizontalSpacing.xxxs,
                  Image.asset(
                    AppIcons.bolt,
                    height: 12.0,
                  )
                ],
                if (widget.node.data.status == "alert") ...[
                  HorizontalSpacing.xxxs,
                  ClipOval(
                    child: Container(
                      height: 8.0,
                      width: 8.0,
                      color: AppColors.critic,
                    ),
                  )
                ],
              ],
            ),
          ),
        ),
        if (_isExpanded)
          Padding(
            padding: EdgeInsets.only(left: SpacingValue.xs),
            child: NodeListView(nodes: widget.node.children),
          ),
      ],
    );
  }
}

String getImagePathByDataType(ElementType type) => switch (type) {
      ElementType.asset => AppIcons.asset,
      ElementType.component => AppIcons.component,
      ElementType.location => AppIcons.location,
      _ => ""
    };
