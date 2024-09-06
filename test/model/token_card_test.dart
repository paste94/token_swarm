// Import the test package and Counter class
import 'package:mockito/mockito.dart';
import 'package:scryfall_api/scryfall_api.dart';
import 'package:test/test.dart';
import 'package:token_swarm/src/app/model/token_card2.dart';

void main() {
  group('Constructors testing', () {
    test('Creating TokenCard from MtgCard 1/2 creature', () {
      final token = TokenCard.fromMtgCard(MockMtgCard(
        power: '1',
        toughness: '2',
      ));

      expect(token.power, 1);
      expect(token.toughness, 2);
    });

    test('Creating TokenCard from MtgCard with no creature', () {
      final token = TokenCard.fromMtgCard(MockMtgCard());

      expect(token.power, null);
      expect(token.toughness, null);
    });

    test('Creating TokenCard from MtgCard with 0/0 creature', () {
      final token = TokenCard.fromMtgCard(MockMtgCard(
        power: '0',
        toughness: '0',
      ));

      expect(token.power, 0);
      expect(token.toughness, 0);
    });

    test('Creating TokenCard from MtgCard with X/X creature', () {
      final token = TokenCard.fromMtgCard(
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
