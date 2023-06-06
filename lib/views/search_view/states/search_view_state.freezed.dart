// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchViewState {
  String get searchQuery => throw _privateConstructorUsedError;
  List<MetadataModel> get searchResults => throw _privateConstructorUsedError;
  bool get emptySearchResults => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchViewStateCopyWith<SearchViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchViewStateCopyWith<$Res> {
  factory $SearchViewStateCopyWith(
          SearchViewState value, $Res Function(SearchViewState) then) =
      _$SearchViewStateCopyWithImpl<$Res, SearchViewState>;
  @useResult
  $Res call(
      {String searchQuery,
      List<MetadataModel> searchResults,
      bool emptySearchResults});
}

/// @nodoc
class _$SearchViewStateCopyWithImpl<$Res, $Val extends SearchViewState>
    implements $SearchViewStateCopyWith<$Res> {
  _$SearchViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? searchResults = null,
    Object? emptySearchResults = null,
  }) {
    return _then(_value.copyWith(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      searchResults: null == searchResults
          ? _value.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<MetadataModel>,
      emptySearchResults: null == emptySearchResults
          ? _value.emptySearchResults
          : emptySearchResults // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchViewStateCopyWith<$Res>
    implements $SearchViewStateCopyWith<$Res> {
  factory _$$_SearchViewStateCopyWith(
          _$_SearchViewState value, $Res Function(_$_SearchViewState) then) =
      __$$_SearchViewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String searchQuery,
      List<MetadataModel> searchResults,
      bool emptySearchResults});
}

/// @nodoc
class __$$_SearchViewStateCopyWithImpl<$Res>
    extends _$SearchViewStateCopyWithImpl<$Res, _$_SearchViewState>
    implements _$$_SearchViewStateCopyWith<$Res> {
  __$$_SearchViewStateCopyWithImpl(
      _$_SearchViewState _value, $Res Function(_$_SearchViewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? searchResults = null,
    Object? emptySearchResults = null,
  }) {
    return _then(_$_SearchViewState(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      searchResults: null == searchResults
          ? _value._searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<MetadataModel>,
      emptySearchResults: null == emptySearchResults
          ? _value.emptySearchResults
          : emptySearchResults // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SearchViewState implements _SearchViewState {
  _$_SearchViewState(
      {required this.searchQuery,
      required final List<MetadataModel> searchResults,
      required this.emptySearchResults})
      : _searchResults = searchResults;

  @override
  final String searchQuery;
  final List<MetadataModel> _searchResults;
  @override
  List<MetadataModel> get searchResults {
    if (_searchResults is EqualUnmodifiableListView) return _searchResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResults);
  }

  @override
  final bool emptySearchResults;

  @override
  String toString() {
    return 'SearchViewState(searchQuery: $searchQuery, searchResults: $searchResults, emptySearchResults: $emptySearchResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchViewState &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            const DeepCollectionEquality()
                .equals(other._searchResults, _searchResults) &&
            (identical(other.emptySearchResults, emptySearchResults) ||
                other.emptySearchResults == emptySearchResults));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchQuery,
      const DeepCollectionEquality().hash(_searchResults), emptySearchResults);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchViewStateCopyWith<_$_SearchViewState> get copyWith =>
      __$$_SearchViewStateCopyWithImpl<_$_SearchViewState>(this, _$identity);
}

abstract class _SearchViewState implements SearchViewState {
  factory _SearchViewState(
      {required final String searchQuery,
      required final List<MetadataModel> searchResults,
      required final bool emptySearchResults}) = _$_SearchViewState;

  @override
  String get searchQuery;
  @override
  List<MetadataModel> get searchResults;
  @override
  bool get emptySearchResults;
  @override
  @JsonKey(ignore: true)
  _$$_SearchViewStateCopyWith<_$_SearchViewState> get copyWith =>
      throw _privateConstructorUsedError;
}
