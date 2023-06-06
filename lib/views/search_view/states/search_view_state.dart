import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/metadata/metadata_model.dart';

part 'search_view_state.freezed.dart';

@freezed
class SearchViewState with _$SearchViewState {
  factory SearchViewState({
    required String searchQuery,
    required List<MetadataModel> searchResults,
    required bool emptySearchResults,
  }) = _SearchViewState;
}
