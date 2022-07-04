import 'package:flutter/material.dart';
import 'package:kraken_pokedex/src/features/sample_feature/domain/models/tip.dart';

class SampleTipCard extends StatelessWidget {
  const SampleTipCard({
    required this.tip,
    super.key,
  });

  final Tip tip;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _CardTitle(tip.title),
                  Divider(color: Colors.green[900]),
                  _CardDescription(tip.description),
                ],
              ),
            ),
          ),
        ),
        const _CardIcon()
      ],
    );
  }
}

class _CardTitle extends StatelessWidget {
  const _CardTitle(
    this.text,
  );

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class _CardDescription extends StatelessWidget {
  const _CardDescription(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
    );
  }
}

class _CardIcon extends StatelessWidget {
  const _CardIcon();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green[800],
      ),
      child: const Padding(
        padding: EdgeInsets.all(8),
        child: Icon(
          Icons.lightbulb,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
