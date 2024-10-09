import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:token_swarm/src/app/model/token_preview.dart';
import 'package:token_swarm/src/app/persistence/repository.dart';

part 'persistence.g.dart';

/// dart run build_runner build

@riverpod
class HistoryList extends _$HistoryList {
  final repository = SqfLiteRepository();

  @override
  FutureOr<List<TokenPreview>> build() async {
    return _fetchHistory();
  }

  Future<List<TokenPreview>> _fetchHistory() async {
    final data = await repository.get();
    return data;
  }

  Future<void> insert(TokenPreview token) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await repository.insert(token);
      return _fetchHistory();
    });
  }

  Future<void> delete(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await repository.delete(id);
      return _fetchHistory();
    });
  }
}
