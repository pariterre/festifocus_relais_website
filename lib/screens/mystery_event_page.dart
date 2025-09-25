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

Pour cette édition du FestiFocus, j'ai décidé d'honorer le contrat que j'ai fait avec ma communauté il y a plus d'un an, soit écouter la vidéo de moi enfant qui danse la lambada!

Pour l'occasion, j'en profite pour honorer un second contrat, cuisiner avec vous une tarte aux bleuets! 

Soyez donc des nôtres pour ce moment détente au milieu de l'activité de coworking. On va bien s'amuser!
''',
          ),
          SizedBox(height: MediaQuery.of(context).size.height - 375),
        ],
      ),
    );
  }
}
