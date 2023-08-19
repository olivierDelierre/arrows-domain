import 'package:arrows_domain/src/definitions/entities/definition.dart';
import 'package:arrows_domain/src/definitions/mappers/definition_mapper.dart';
import 'package:test/test.dart';

void main() {
  final kDefinitionRecord = (
    words: ['word1', 'word2'],
    definition: 'description',
  );

  final kDefinition = Definition(
    words: ['word1', 'word2'],
    definition: 'description',
  );

  test('toEntity() works properly', () {
    final result = DefinitionMapper().toEntity(kDefinitionRecord);

    expect(kDefinitionRecord.definition, result.definition);
    expect(kDefinitionRecord.words.length, result.words.length);
    for (final word in kDefinitionRecord.words) {
      expect(result.words.contains(word), isTrue);
    }
  });

  test('toModel() works properly', () {
    final result = DefinitionMapper().toRecord(kDefinition);

    expect(kDefinition.definition, result.definition);
    expect(kDefinition.words.length, result.words.length);
    for (final word in kDefinition.words) {
      expect(result.words.contains(word), isTrue);
    }
  });
}
