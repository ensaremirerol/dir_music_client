part of '../playlists_view.dart';

final isPublicProvider = StateProvider<bool>((ref) {
  return false;
});

class _CreatePlaylistDialog extends ConsumerStatefulWidget {
  const _CreatePlaylistDialog();

  @override
  ConsumerState<_CreatePlaylistDialog> createState() =>
      _CreatePlaylistDialogState();
}

class _CreatePlaylistDialogState extends ConsumerState<_CreatePlaylistDialog> {
  final TextEditingController _playlistNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _playlistNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('create_playlist',
                      style: Theme.of(context).textTheme.titleLarge)
                  .tr(),
              const SizedBox(
                height: 8,
              ),
              const Divider(),
              const SizedBox(
                height: 8,
              ),
              DirTextFormField(
                controller: _playlistNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'playlist_name_empty'.tr();
                  }
                  return null;
                },
                label: 'playlist_name'.tr(),
              ),
              const SizedBox(
                height: 8,
              ),
              Text('make_public',
                      style: Theme.of(context).textTheme.titleMedium)
                  .tr(),
              Switch(
                  value: ref.watch(isPublicProvider),
                  onChanged: (value) {
                    ref.read(isPublicProvider.notifier).state = value;
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('cancel').tr(),
                  ),
                  TextButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      Navigator.of(context).pop({
                        'playlistName': _playlistNameController.text,
                        'isPublic': ref.watch(isPublicProvider)
                      });
                    },
                    child: const Text('create').tr(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
