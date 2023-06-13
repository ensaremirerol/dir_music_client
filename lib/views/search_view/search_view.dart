import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/list_tiles/music_tile.dart';
import '../../widgets/responsive_builder/responsive_builder.dart';
import '../../widgets/text_editing_fields/dir_text_form_field.dart';
import '../add_to_playlist_dialog/add_to_playlist_dialog.dart';
import 'controllers/search_view_controller.dart';
import 'states/search_view_state.dart';

part './widgets/body.dart';

final searchViewControllerProvider =
    AsyncNotifierProvider.autoDispose<SearchViewController, SearchViewState>(
  () => SearchViewController(),
);

class SearchView extends ConsumerWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveBuilder(
        smallScreen: _Body(
      key: key,
    ));
  }
}
