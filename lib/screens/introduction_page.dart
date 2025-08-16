import 'package:festifocus_relais_website/managers/config_manager.dart';
import 'package:festifocus_relais_website/managers/theme_manager.dart';
import 'package:festifocus_relais_website/models/information_setter.dart';
import 'package:festifocus_relais_website/widgets/tab_container.dart';
import 'package:festifocus_relais_website/widgets/youtube_box.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

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
          Text('INTRODUCTION', style: Theme.of(context).textTheme.titleLarge),
          YoutubeBox(
            controller: youtubeController,
            videoId: cm.youtubeEventUrlId,
            widthRatio: 0.8,
          ),
          const SizedBox(height: 12),
          const Text.rich(
              textAlign: TextAlign.justify,
              TextSpan(
                  text:
                      'Bienvenue au FestiFocus-Relais!! Yeah!! Heu... le quoi?')),
          const SizedBox(height: 12),
          const _EmailFormField(),
          const SizedBox(height: 50),
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
        Text('Rappel', style: Theme.of(context).textTheme.titleSmall),
        const Text.rich(
            textAlign: TextAlign.justify,
            TextSpan(
                text:
                    'Si vous souhaitez vous inscrire à rappel pour l\'événement, vous pouvez '
                    'indiquer votre courriel dans la boite suivante :')),
        const SizedBox(height: 12),
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
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                        .hasMatch(value!)) {
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
                child: Text('Envoyer',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 16)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
