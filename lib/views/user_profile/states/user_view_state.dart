import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_view_state.freezed.dart';

@freezed
class UserViewState with _$UserViewState {
  factory UserViewState({
    required String userName,
    required String? followerCount,
    required String? phoneNumber,
    required DateTime? dateOfBirth,
    required bool includePrivateInformation,
  }) = _UserViewState;
}
