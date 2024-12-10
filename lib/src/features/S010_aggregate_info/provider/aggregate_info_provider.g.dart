// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aggregate_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sortIndexHash() => r'f6eb31505ba05c92123f1393823b4728ca01ae36';

/// See also [SortIndex].
@ProviderFor(SortIndex)
final sortIndexProvider = AutoDisposeNotifierProvider<SortIndex, int?>.internal(
  SortIndex.new,
  name: r'sortIndexProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sortIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SortIndex = AutoDisposeNotifier<int?>;
String _$ascendingHash() => r'194c67426e3ce09fc04bc7848ffa94406bb8cfd6';

/// See also [Ascending].
@ProviderFor(Ascending)
final ascendingProvider = AutoDisposeNotifierProvider<Ascending, bool>.internal(
  Ascending.new,
  name: r'ascendingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ascendingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Ascending = AutoDisposeNotifier<bool>;
String _$aggregateInfoHash() => r'fdc1c1e034fa95ef3f74453be4b0479fd82a4dff';

/// See also [AggregateInfo].
@ProviderFor(AggregateInfo)
final aggregateInfoProvider =
    AutoDisposeAsyncNotifierProvider<AggregateInfo, List<Info>>.internal(
  AggregateInfo.new,
  name: r'aggregateInfoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aggregateInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AggregateInfo = AutoDisposeAsyncNotifier<List<Info>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
