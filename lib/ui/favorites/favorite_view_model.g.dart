// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(favoriteViewModel)
const favoriteViewModelProvider = FavoriteViewModelProvider._();

final class FavoriteViewModelProvider
    extends
        $FunctionalProvider<
          FavoriteViewModel,
          FavoriteViewModel,
          FavoriteViewModel
        >
    with $Provider<FavoriteViewModel> {
  const FavoriteViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteViewModelHash();

  @$internal
  @override
  $ProviderElement<FavoriteViewModel> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FavoriteViewModel create(Ref ref) {
    return favoriteViewModel(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FavoriteViewModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FavoriteViewModel>(value),
    );
  }
}

String _$favoriteViewModelHash() => r'b092e9dfb34dded4a398e37759428d7e5cf032ba';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
