import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:token_swarm/src/app/model/token_preview.dart';
import 'package:token_swarm/src/app/persistence/repository.dart';

part 'persistence.g.dart';

/// dart run build_runner build

@Riverpod(keepAlive: true)
class Persistence extends _$Persistence {
  final repository = SqfLiteRepository();

  @override
  List<TokenPreview> build() {
    return [];
  }

  void get() async {
    final data = await repository.get();
    state = data;
  }

  void insert(TokenPreview token) async {
    await repository.insert(token);
  }

  Future<List<TokenPreview>> getData() async {
    final data = await repository.get();
    return data;
  }

  Future<void> delete(String id) async {
    await repository.delete(id);
    get();
  }
}
