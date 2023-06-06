import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/instance_controller.dart';
import '../../../services/metadata_service/metadata_service.dart';
import '../../../utils/bounce_back/bounce_back.dart';
import '../states/search_view_state.dart';

class SearchViewController extends AutoDisposeAsyncNotifier<SearchViewState> {
  SearchViewController() : super();

  final BounceBack _bounceBack = BounceBack();

  final MetadataService _metadataService =
      InstanceController().getByType<MetadataService>();

  @override
  FutureOr<SearchViewState> build() {
    return SearchViewState(
        searchQuery: '', searchResults: [], emptySearchResults: false);
  }

  void setSearchQuery(String searchQuery) {
    state = AsyncData(state.requireValue.copyWith(searchQuery: searchQuery));
    if (searchQuery.isEmpty) {
      _bounceBack.dispose();
      state = AsyncValue.data(state.requireValue.copyWith(
        searchResults: [],
        emptySearchResults: false,
      ));
    } else
      _bounceBack.start(onComplete: _onComplete);
  }

  void _onComplete() async {
    state = const AsyncValue.loading();
    try {
      final response =
          await _metadataService.searchMetadata(state.requireValue.searchQuery);
      state = AsyncValue.data(state.requireValue.copyWith(
          searchResults: response, emptySearchResults: response.isEmpty));
    } catch (e) {
      state = AsyncValue.error(
          state.requireValue.copyWith(searchResults: []), StackTrace.current);
    }
  }
}
