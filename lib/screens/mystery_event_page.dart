import 'package:flutter/material.dart';
import 'package:pomodautomne/widgets/tab_container.dart';

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
          Text('ACTIVITÉ MYSTÈRE',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          const Text.rich(
              textAlign: TextAlign.justify,
              TextSpan(
                  text:
                      'Une activité mystère se déroulera lors de la seconde nuit '
                      'de l\'événement. Cette activité vous sera révélée bientôt!')),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
