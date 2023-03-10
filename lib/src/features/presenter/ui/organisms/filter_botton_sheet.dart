import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/features/domain/entities/manga_filter_entity.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/controllers/manga_controller.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/molecules/select_author_botton_sheet.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/molecules/select_data_botton_sheet.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/molecules/select_gender_botton_sheet.dart';

class FilterBottonSheet extends StatelessWidget {
  final MangaController ct;
  const FilterBottonSheet({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const CoffeeText(
                  text: 'Filtrar', typography: CoffeeTypography.title),
              IconButton(
                  onPressed: () {
                    ct.mangaFilter = MangaFilterEntity(genders: []);
                  },
                  icon: const Icon(Icons.replay_outlined)),
            ],
          ),
          SelectGenderBottonSheet(ct: ct),
          //const SizedBox(height: 15),
          // const CoffeeText(
          //   text: 'Avaliação',
          // ),
          // const SizedBox(height: 10),
          // CoffeeRating(
          //   onRatingUpdate: (_) {},
          // ),
          const SizedBox(height: 15),
          Row(
            children: [
              SelectDataBottonSheet(ct: ct),
              const SizedBox(width: 20),
              SelectAuthorBottonSheet(ct: ct),
            ],
          ),
          const SizedBox(height: 10),
          CoffeeButton(
            label: 'Aplicar filtro',
            onPress: () {
              ct.pagingController.refresh();
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
