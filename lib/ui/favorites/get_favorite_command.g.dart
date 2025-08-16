// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favorite_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(GetFavoriteCommand)
const getFavoriteCommandProvider = GetFavoriteCommandProvider._();

final class GetFavoriteCommandProvider
    extends
        $NotifierProvider<GetFavoriteCommand, AsyncValue<List<FavoriteMovie>>> {
  const GetFavoriteCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getFavoriteCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getFavoriteCommandHash();

  @$internal
  @override
  GetFavoriteCommand create() => GetFavoriteCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<FavoriteMovie>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<FavoriteMovie>>>(
        value,
      ),
    );
  }
}

String _$getFavoriteCommandHash() =>
    r'9bdc9ca2f13e027ef065946eab92994aa2459eeb';

abstract class _$GetFavoriteCommand
    extends $Notifier<AsyncValue<List<FavoriteMovie>>> {
  AsyncValue<List<FavoriteMovie>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<FavoriteMovie>>,
              AsyncValue<List<FavoriteMovie>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<FavoriteMovie>>,
                AsyncValue<List<FavoriteMovie>>
              >,
              AsyncValue<List<FavoriteMovie>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
