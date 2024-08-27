// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persistence.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$persistenceHash() => r'6e17728d8d2124ffbb0bdab114395ce0d456060f';

/// dart run build_runner build
///
/// Copied from [Persistence].
@ProviderFor(Persistence)
final persistenceProvider =
    NotifierProvider<Persistence, SqfLiteRepository>.internal(
  Persistence.new,
  name: r'persistenceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$persistenceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Persistence = Notifier<SqfLiteRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
