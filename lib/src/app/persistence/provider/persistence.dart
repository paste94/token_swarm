import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:token_swarm/src/app/model/mini_token_model.dart';
import 'package:token_swarm/src/app/persistence/repository.dart';

part 'persistence.g.dart';

/// dart run build_runner build

@Riverpod(keepAlive: true)
class Persistence extends _$Persistence {
  final repository = SqfLiteRepository();

  @override
  List<MiniTokenModel> build() {
    return [];
  }

  void get() async {
    final data = await repository.get();
    state = data;
  }

  void insert(MiniTokenModel token) async {
    await repository.insert(token);
  }

  Future<List<MiniTokenModel>> getData() async {
    final data = await repository.get();
    return data;
  }

  Future<void> delete(String id) async {
    await repository.delete(id);
    get();
  }
}
