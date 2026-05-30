import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/screens/experiences/feed_list.dart';
import 'package:luxora_ai/widgets/lux_secondary_app_bar.dart';

class ExperiencesScreen extends StatelessWidget {
  const ExperiencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: LuxSecondaryAppBar(title: l.feedTitle),
      body: const FeedList(),
    );
  }
}
