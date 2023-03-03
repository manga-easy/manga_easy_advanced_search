import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';

class SearchInitialStatePage extends StatelessWidget {
  const SearchInitialStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CoffeeImage.unicorn(
          AssetsUnicorn.lendo,
          width: 100,
          height: 100,
        ),
        const CoffeeText(text: 'Tente pesquisar algo')
      ],
    );
  }
}
