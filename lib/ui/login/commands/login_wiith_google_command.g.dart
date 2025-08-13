// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_wiith_google_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(LoginWiithGoogleCommand)
const loginWiithGoogleCommandProvider = LoginWiithGoogleCommandProvider._();

final class LoginWiithGoogleCommandProvider
    extends $NotifierProvider<LoginWiithGoogleCommand, AsyncValue<void>> {
  const LoginWiithGoogleCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginWiithGoogleCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginWiithGoogleCommandHash();

  @$internal
  @override
  LoginWiithGoogleCommand create() => LoginWiithGoogleCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$loginWiithGoogleCommandHash() =>
    r'c6ef0728652830f2b48c908287cb8856e796a328';

abstract class _$LoginWiithGoogleCommand extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
