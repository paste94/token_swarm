// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_name_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchCardsHash() => r'5047e557fefbdd3a9f2f942f6ca4de956c774304';

/// See also [fetchCards].
@ProviderFor(fetchCards)
final fetchCardsProvider =
    AutoDisposeFutureProvider<PaginableList<MtgCard>>.internal(
  fetchCards,
  name: r'fetchCardsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchCardsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchCardsRef = AutoDisposeFutureProviderRef<PaginableList<MtgCard>>;
String _$searchCardNameHash() => r'2f820d049be10ad2a54a7ab5f2b2c688b7df18d3';

/// See also [SearchCardName].
@ProviderFor(SearchCardName)
final searchCardNameProvider =
    AutoDisposeNotifierProvider<SearchCardName, String>.internal(
  SearchCardName.new,
  name: r'searchCardNameProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchCardNameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchCardName = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
