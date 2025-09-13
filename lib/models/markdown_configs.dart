import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';

MarkdownConfig customMarkdownConfigs(BuildContext context) => MarkdownConfig(
  configs: [
    CustomH1Config(style: Theme.of(context).textTheme.titleLarge!),
    CustomH2Config(style: Theme.of(context).textTheme.titleMedium!),
    CustomH3Config(style: Theme.of(context).textTheme.titleSmall!),
    PConfig(textStyle: Theme.of(context).textTheme.bodyMedium!),
    LinkConfig(
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.underline,
        decorationColor: Colors.black,
      ),
    ),
  ],
);

///config class for h1
class CustomH1Config extends H1Config {
  const CustomH1Config({required super.style});

  @override
  HeadingDivider? get divider =>
      HeadingDivider.h1.copy(color: Colors.transparent, height: 0);
}

class CustomH2Config extends H2Config {
  const CustomH2Config({required super.style});

  @override
  EdgeInsets get padding => EdgeInsets.only(top: 32);
  @override
  HeadingDivider? get divider =>
      HeadingDivider.h2.copy(color: Colors.transparent, height: 0);
}

class CustomH3Config extends H3Config {
  const CustomH3Config({required super.style});

  @override
  EdgeInsets get padding => EdgeInsets.only(top: 32);

  @override
  HeadingDivider? get divider =>
      HeadingDivider.h3.copy(color: Colors.transparent, height: 0);
}
