// import 'dart:async';
// import 'dart:developer';

// import 'package:bloc/bloc.dart';
// import 'package:kutim/src/core/rest_client/rest_client.dart';
// import 'package:kutim/src/feature/auth/data/auth_repository.dart';
// import 'package:kutim/src/feature/auth/models/user_dto.dart';
// import 'package:kutim/src/feature/profile/data/profile_repository.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'profile_bloc.freezed.dart';

// // ignore: unused_element
// const _tag = 'ProfileBloc';

// class ProfileBLoC extends Bloc<ProfileEvent, ProfileState> {
//   ProfileBLoC({
//     required IAuthRepository authRepository,
//     required IProfileRepository profileRepository,
//   })  : _authRepository = authRepository,
//         _profileRepository = profileRepository,
//         super(const ProfileState.loading()) {
//     on<ProfileEvent>(
//       (event, emit) async => event.map(
//         getProfile: (event) async => _getProfile(emit),
//         logOut: (event) async => _logOut(emit),
//         deleteAccount: (event) async => _deleteAccount(emit),
//         // updateAvatar: (event) async => _updateAvatar(event, emit),
//         // deleteAvatar: (event) async => _deleteAvatar(emit),
//         // updateProfile: (event) async => _updateProfile(event, emit),
//       ),
//     );
//   }
//   final IAuthRepository _authRepository;
//   final IProfileRepository _profileRepository;

//   bool get isAuthenticated => _authRepository.isAuthenticated;

//   Future<void> _getProfile(
//     Emitter<ProfileState> emit, {
//     bool hasLoading = false,
//     bool hasDelay = false,
//   }) async {
//     try {
//       if (hasLoading) {
//         emit(const ProfileState.loading());
//       }
//       if (hasDelay) {
//         await Future.delayed(const Duration(milliseconds: 500));
//       }

//       final user = await _profileRepository.profileData();

//       emit(ProfileState.loaded(user: user));
//     } on RestClientException catch (e) {
//       emit(ProfileState.error(message: e.message));
//     } catch (e) {
//       emit(ProfileState.error(message: e.toString()));
//     }
//   }

//   Future<void> _logOut(
//     Emitter<ProfileState> emit,
//   ) async {
//     try {
//       emit(const ProfileState.loading());

//       final result = await _profileRepository.logout();

//       emit(ProfileState.exited(message: result.message ?? ''));
//     } on RestClientException catch (e) {
//       emit(ProfileState.error(message: e.message));
//     } catch (e) {
//       emit(ProfileState.error(message: e.toString()));
//     }
//   }

//   Future<void> _deleteAccount(
//     Emitter<ProfileState> emit,
//   ) async {
//     try {
//       emit(const ProfileState.loading());

//       final result = await _profileRepository.deleteAccount();

//       emit(ProfileState.exited(message: result.message ?? ''));
//     } on RestClientException catch (e) {
//       emit(ProfileState.error(message: e.message));
//     } catch (e) {
//       emit(ProfileState.error(message: e.toString()));
//     }
//   }
// }

// @freezed
// class ProfileEvent with _$ProfileEvent {
//   const factory ProfileEvent.getProfile() = _GetProfile;

//   const factory ProfileEvent.logOut() = _LogOut;

//   const factory ProfileEvent.deleteAccount() = _DeleteAccount;
// }

// @freezed
// class ProfileState with _$ProfileState {
//   const factory ProfileState.loading() = _LoadingState;

//   const factory ProfileState.loaded({
//     required UserDTO user,
//   }) = _LoadedState;

//   const factory ProfileState.exited({
//     required String message,
//   }) = _ExitedState;

//   const factory ProfileState.error({
//     required String message,
//   }) = _ErrorState;
// }
