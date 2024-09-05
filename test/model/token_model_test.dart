// Import the test package and Counter class
import 'package:mockito/mockito.dart';
import 'package:scryfall_api/scryfall_api.dart';
import 'package:test/test.dart';
import 'package:token_swarm/src/app/model/token_model.dart';

void main() {
  group('Constructors testing', () {
    test('Creating TokenModel from MtgCard 1/2 creature', () {
      final token = TokenModel.fromMtgCard(MockMtgCard(
        power: '1',
        toughness: '2',
      ));

      expect(token.power, 1);
      expect(token.toughness, 2);
    });

    test('Creating TokenModel from MtgCard with no creature', () {
      final token = TokenModel.fromMtgCard(MockMtgCard());

      expect(token.power, null);
      expect(token.toughness, null);
    });

    test('Creating TokenModel from MtgCard with 0/0 creature', () {
      final token = TokenModel.fromMtgCard(MockMtgCard(
        power: '0',
        toughness: '0',
      ));

      expect(token.power, 0);
      expect(token.toughness, 0);
    });

    test('Creating TokenModel from MtgCard with X/X creature', () {
      final token = TokenModel.fromMtgCard(
        MockMtgCard(
          power: 'X',
          toughness: 'X',
        ),
      );

      expect(token.power, 0);
      expect(token.toughness, 0);
    });
  });
}

class MockMtgCard extends Mock implements MtgCard {
  @override
  final String? power;
  @override
  final String? toughness;

  MockMtgCard({
    this.power,
    this.toughness,
  });
}
