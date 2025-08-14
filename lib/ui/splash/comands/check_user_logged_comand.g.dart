// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_user_logged_comand.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(CheckUserLoggedComand)
const checkUserLoggedComandProvider = CheckUserLoggedComandProvider._();

final class CheckUserLoggedComandProvider
    extends $AsyncNotifierProvider<CheckUserLoggedComand, bool?> {
  const CheckUserLoggedComandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkUserLoggedComandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkUserLoggedComandHash();

  @$internal
  @override
  CheckUserLoggedComand create() => CheckUserLoggedComand();
}

String _$checkUserLoggedComandHash() =>
    r'7e872acacd05ac10fa23d468e3c5c4a44074000e';

abstract class _$CheckUserLoggedComand extends $AsyncNotifier<bool?> {
  FutureOr<bool?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool?>, bool?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool?>, bool?>,
              AsyncValue<bool?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
