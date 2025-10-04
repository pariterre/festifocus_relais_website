import 'package:festifocus_relais_website/managers/config_manager.dart';
import 'package:festifocus_relais_website/models/markdown_configs.dart';
import 'package:festifocus_relais_website/models/price.dart';
import 'package:festifocus_relais_website/widgets/tab_container.dart';
import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';

class ThankingPage extends StatelessWidget {
  const ThankingPage({super.key, required this.maxWidth});

  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final cm = ConfigManager.instance;

    return TabContainer(
      maxWidth: maxWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MarkdownBlock(
            config: customMarkdownConfigs(context),
            selectable: false,
            data:
                '''
# REMERCIEMENTS

Un immense merci aux coanimatrices et coanimateurs de l'événement. Honnêtement, je suis sans mots face à la confiance et l'accueil que vous portez à chaque itération de ce projet. Ça me touche sincèrement. Merci!

Merci aux animateurs et animatrices qui ont accepté de de donner des prix de participation. Votre générosité est sincèrement appréciée.

Finalement, un grand merci à tous les auditeurs et toutes les auditrices pour votre présence et votre support, que ce soit pendant ou à l'extérieur de l'événement. Vous êtes tellement importants et importantes pour nous, vous êtes notre motivation.\nUn grand merci à chacun et chacune d'entre vous \u2665.

## Prix de participation
Encore une fois cette année, nos animateurs et animatrices ont été généreux pour vous! Plusieurs ont proposé d'offrir de la marchandise de leur chaine aux participants et participantes du marathon. Voici les prix qui ont été offerts :
${cm.prices.asMap().keys.map((index) => _priceToText(index: index, price: cm.prices[index])).join('\n')}

## Crédits
Site web réalisé par Benjamin Michaud.
Une partie des illustrations ont été produites par [Freepik](https://freepik.com).
Idée originale et création de l'affiche par *Lièvre*.
''',
          ),
          SizedBox(height: MediaQuery.of(context).size.height - 375),
        ],
      ),
    );
  }

  String _priceToText({required int index, required Price price}) {
    return '1. ${price.title}, **${price.person}** '
        '${price.url != null ? '    [En savoir plus...](${price.url})' : ''}';
  }
}
