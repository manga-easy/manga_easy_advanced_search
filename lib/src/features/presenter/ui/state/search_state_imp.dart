import 'package:manga_easy_advanced_search/src/features/presenter/ui/state/search_state.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchErrorState extends SearchState {
  final String message;

  SearchErrorState(this.message);
}

class SearchNotfoundState extends SearchState {}

class SearchDoneState extends SearchState {
  final List<InfoComicModel> mangas;

  SearchDoneState(this.mangas);
}
