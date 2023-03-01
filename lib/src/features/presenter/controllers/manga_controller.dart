import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/features/domain/entities/manga_filter_entity.dart';
import 'package:manga_easy_advanced_search/src/features/domain/repositories/manga_repository.dart';
import 'package:manga_easy_advanced_search/src/features/domain/usecases/get_popular_genres_use_case.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/state/search_state.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class MangaController {
  final MangaRepository _mangaRepository;
  final GetPopularGenresUseCase getPopularGenderCase;

  MangaController(this._mangaRepository, this.getPopularGenderCase);

  MangaFilterEntity mangaFilter = MangaFilterEntity(genders: []);

  final ValueNotifier<SearchState> state = ValueNotifier(SearchInitialState());
  List<GenerosModel> popularGender = [];

  void init() {
    loadingPopularGenders();
  }

  void dispose() {
    state.dispose();
    popularGender.clear();
  }

  void loadingPopularGenders() {
    popularGender = getPopularGenderCase();
  }

  void fetch() async {
    try {
      state.value = SearchLoadingState();
      var result = await _mangaRepository.getManga(filter: mangaFilter);
      if (result.isEmpty) {
        state.value = SearchNotfoundState(
          'Não encontramos mangá para sua pesquisa ou filtro, tente limpar os filtros.',
        );
        return;
      }
      state.value = SearchDoneState(result);
    } catch (e) {
      state.value = SearchErrorState(e.toString());
    }
  }
}
