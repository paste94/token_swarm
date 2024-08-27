import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:token_swarm/src/app/model/mini_token_model.dart';
import 'package:token_swarm/src/app/persistence/repository.dart';

part 'persistence.g.dart';

/// dart run build_runner build

@Riverpod(keepAlive: true)
class Persistence extends _$Persistence {
  @override
  SqfLiteRepository build() {
    final s = SqfLiteRepository();
    s.init();
    return s;
  }

  void insert(MiniTokenModel token) => state.insert(token);
  Future<List<MiniTokenModel>> get() async => await state.get();
}
