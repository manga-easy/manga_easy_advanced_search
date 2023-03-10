import 'package:coffee_cup/features/text/coffee_text.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class GenreManga extends StatelessWidget {
  final GenerosModel gender;
  const GenreManga({super.key, required this.gender});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(image: NetworkImage(gender.imagem))),
        ),
        const SizedBox(width: 5),
        CoffeeText(text: gender.titulo, typography: CoffeeTypography.body),
        const SizedBox(width: 5),
      ],
    );
  }
}
