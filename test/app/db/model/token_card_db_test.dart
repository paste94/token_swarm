import 'package:flutter_test/flutter_test.dart';
import 'package:token_swarm/src/app/db/model/token_card_db.dart';
import 'package:scryfall_api/scryfall_api.dart';

import 'mtg_card_mockup.dart';

void main() {
  group('TokenCardDb Tests', () {
    test('Color identity - Token to String', () {
      final tokenCard = TokenCardDb(
        id: '1',
        name: 'Test Token',
        power: 10,
        toughness: 10,
        imageUri: 'http://example.com/image.png',
        imageUriArtCrop: 'http://example.com/image_art_crop.png',
        text: 'Sample text',
        typeLine: 'Sample type',
        colorIdentity: [Color.red, Color.black],
      );
      expect(tokenCard.toMap()['colorIdentity'], 'red,black');
    });

    test('Color identity - String to List', () {
      const colorIdentityStr = 'red,black';
      expect(TokenCardDb.parseColorIdentity(colorIdentityStr),
          [Color.red, Color.black]);
    });

    test('should create a TokenCardDb instance', () {
      final tokenCard = TokenCardDb(
        id: '1',
        name: 'Test Token',
        power: 10,
        toughness: 10,
        imageUri: 'http://example.com/image.png',
        imageUriArtCrop: 'http://example.com/image_art_crop.png',
        text: 'Sample text',
        typeLine: 'Sample type',
        colorIdentity: [],
      );

      expect(tokenCard.id, '1');
      expect(tokenCard.name, 'Test Token');
      expect(tokenCard.power, 10);
      expect(tokenCard.toughness, 10);
      expect(tokenCard.imageUri, 'http://example.com/image.png');
      expect(
          tokenCard.imageUriArtCrop, 'http://example.com/image_art_crop.png');
      expect(tokenCard.text, 'Sample text');
      expect(tokenCard.typeLine, 'Sample type');
    });

    test('createPT method', () {
      expect(TokenCardDb.parsePT('*'), 0);
      expect(TokenCardDb.parsePT('X'), 0);
      expect(TokenCardDb.parsePT('1'), 1);
      expect(TokenCardDb.parsePT('2'), 2);
      expect(TokenCardDb.parsePT(null), isNull);
    });

    test('fromMap method', () {
      final map = {
        'id': '1',
        'power': 10,
        'toughness': 10,
        'imageUri': 'http%3A//normal/img/sample',
        'imageUriArtCrop': 'http%3A//artCrop/img/sample',
        'name': 'Test Token',
        'text': 'Sample text',
        'typeLine': 'Creature',
        'tokenNumber': 0,
        'tappedNumber': 0,
        'untappedNumber': 0,
        'prevTappedNumber': 0,
        'sickNumber': 0,
        'isCreature': 1,
        'isSicknessActive': 1,
        'colorIdentity': 'red,green',
      };

      final TokenCardDb tokenCardTest = TokenCardDb.fromMap(map);

      final TokenCardDb tokenCard = TokenCardDb(
        id: '1',
        name: 'Test Token',
        power: 10,
        toughness: 10,
        imageUri: 'http%3A//normal/img/sample',
        imageUriArtCrop: 'http%3A//artCrop/img/sample',
        text: 'Sample text',
        typeLine: 'Creature',
        isCreature: true,
        isSicknessActive: true,
        colorIdentity: [Color.red, Color.green],
      );

      expect(tokenCard, tokenCardTest);
    });

    test('fromMtgCard method Creature', () {
      final tokenCardTest = TokenCardDb.fromMtgCard(mtgCardCreatureMockup);

      final TokenCardDb tokenCard = TokenCardDb(
        id: '1',
        name: 'Test Token',
        power: 10,
        toughness: 10,
        imageUri: 'http%3A//normal/img/sample',
        imageUriArtCrop: 'http%3A//artCrop/img/sample',
        text: 'Sample text',
        typeLine: 'Creature',
        isCreature: true,
        isSicknessActive: true,
        colorIdentity: [Color.red, Color.green],
      );

      expect(tokenCardTest, tokenCard);
    });

    test('fromMtgCard method non creature', () {
      final tokenCardTest = TokenCardDb.fromMtgCard(mtgCardNonCreatureMockup);

      final TokenCardDb tokenCard = TokenCardDb(
        id: '1',
        name: 'Test Token',
        power: null,
        toughness: null,
        imageUri: 'http%3A//normal/img/sample',
        imageUriArtCrop: 'http%3A//artCrop/img/sample',
        text: 'Sample text',
        typeLine: 'Artifact',
        isCreature: false,
        isSicknessActive: false,
        colorIdentity: [],
      );

      expect(tokenCardTest, tokenCard);
    });
  });
}
