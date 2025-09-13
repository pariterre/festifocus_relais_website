import 'package:festifocus_relais_website/models/markdown_configs.dart';
import 'package:festifocus_relais_website/widgets/tab_container.dart';
import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';

class MysteryEventPage extends StatelessWidget {
  const MysteryEventPage({super.key, required this.maxWidth});

  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return TabContainer(
      maxWidth: maxWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MarkdownBlock(
            config: customMarkdownConfigs(context),
            selectable: false,
            data: '''
# ACTIVITÉ MYSTÈRE

Une activité mystère se déroulera lors de la seconde nuit de l'événement. Cette activité vous sera révélée bientôt!
''',
          ),
          SizedBox(height: MediaQuery.of(context).size.height - 375),
        ],
      ),
    );
  }
}
