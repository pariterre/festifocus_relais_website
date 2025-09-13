import 'package:festifocus_relais_website/managers/config_manager.dart';
import 'package:festifocus_relais_website/managers/theme_manager.dart';
import 'package:festifocus_relais_website/models/information_setter.dart';
import 'package:festifocus_relais_website/models/markdown_configs.dart';
import 'package:festifocus_relais_website/widgets/tab_container.dart';
import 'package:festifocus_relais_website/widgets/youtube_box.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:markdown_widget/markdown_widget.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key, required this.maxWidth});

  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final cm = ConfigManager.instance;

    final youtubeController = YoutubePlayerController.fromVideoId(
      videoId: cm.youtubeEventUrlId,
      autoPlay: false,
      params: const YoutubePlayerParams(
        mute: false,
        showControls: true,
        showFullscreenButton: true,
      ),
    );

    return TabContainer(
      maxWidth: maxWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MarkdownBlock(
            config: customMarkdownConfigs(context),
            selectable: false,
            data: '''# INTRODUCTION''',
          ),
          YoutubeBox(
            controller: youtubeController,
            videoId: cm.youtubeEventUrlId,
            widthRatio: 0.8,
          ),
          MarkdownBlock(
            config: customMarkdownConfigs(context),
            selectable: false,
            data: '''
Bienvenue au **FestiFocus-Relais**!! Yeah!! Heu... le quoi?
Le grand FestiFocus-Relais, voyons!.. non? D'accord, d'accord, je vous explique...

Le **FestiFocus-Relais** est un événement de cotravail (*coworking*) du Twitch francophone où durant 48h consécutives, vos animateurs et animatrices préféré·e·s se relaient pour travailler avec vous dans une séries de sessions de focus sous forme de [Pomodoro](https://fr.wikipedia.org/wiki/Technique_Pomodoro) Que vous soyez du type sessions longues ou sessions courtes, avec ou sans musique, il y en a pour tous les goûts.\n\n
Au menu de ce sprint de travail : concentration, pauses dynamiques, belles rencontres, camaraderie, motivation et surtout beaucoup de plaisir!

Ceci vous intrigue et intéresse? Alors n'hésitez pas à vous joindre à nous! Le lancement officiel se fait sur la chaîne de [Pariterre](https://twitch.tv/pariterre)le lundi 6 octobre 2025 dès 10h, heure du Québec (16h en France)!''',
          ),
          const SizedBox(height: 12),
          const _EmailFormField(),
          SizedBox(height: MediaQuery.of(context).size.height - 375),
        ],
      ),
    );
  }
}

class _EmailFormField extends StatefulWidget {
  const _EmailFormField();

  @override
  State<_EmailFormField> createState() => _EmailFormFieldState();
}

class _EmailFormFieldState extends State<_EmailFormField> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    // Send the email to the server
    await InformationSetter.setEmailReminder(_emailController.text);

    // Clear the form
    _emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MarkdownBlock(
          config: customMarkdownConfigs(context),
          selectable: false,
          data: '''
### Rappel

Si vous souhaitez vous inscrire au rappel pour l'événement, vous pouvez indiquer votre courriel dans la boite suivante :
''',
        ),
        Form(
          key: _formKey,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Courriel',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return 'Veuillez entrer un courriel';
                    }

                    if (!RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    ).hasMatch(value!)) {
                      return 'Veuillez entrer un courriel valide';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeManager.instance.colorButtonSelected,
                  foregroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(),
                ),
                child: Text(
                  'Envoyer',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
