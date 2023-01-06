import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/presenter/controllers/search_controller.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/organisms/see_more_text_button.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/molecules/apply_botton.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/molecules/category_select_sheet_botton.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/molecules/alert_dialog_select_year.dart';

class IconBottomSheetScreen extends StatelessWidget {
  final SearchController ct;
  const IconBottomSheetScreen({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.menu_rounded),
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              builder: (BuildContext context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: CoffeeText(
                              text: 'Filtrar',
                              typography: CoffeeTypography.title),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            CoffeeText(
                              text: 'Gêneros',
                            ),
                            SeeMoreTextButton(),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: ct
                                .getPopularGenderCase()
                                .map(
                                  (e) => CategorySelectSheetBotton(
                                      nameCategory: e),
                                )
                                .toList(),
                          ),
                        ),
                        const SizedBox(height: 15),
                        const CoffeeText(
                          text: 'Avaliação',
                        ),
                        const SizedBox(height: 10),
                        CoffeeRating(
                          onRatingUpdate: (_) {},
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CoffeeText(
                                      text: 'Data',
                                      typography: CoffeeTypography.body),
                                  const SizedBox(height: 10),
                                  CoffeeButton(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 13.5),
                                      label: 'Selecionar',
                                      elevation: 6,
                                      onPress: () => showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialogSelectYear();
                                            },
                                          ))
                                ],
                              ),
                            ),
                            const SizedBox(width: 40),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  CoffeeText(
                                    text: 'Artista',
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CoffeeField(
                                    hintText: 'Nome do artista',
                                    height: 44,
                                    contentPadding: EdgeInsets.only(
                                        left: 14, top: 18, bottom: 8),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const ApplyBottonn(
                          nameBotton: 'Aplicar filtro',
                        ),
                      ],
                    ),
                  ),
                );
              });
        });
  }
}