import 'package:arrows_domain/src/definitions/repositories/definition_repository.dart';
import 'package:arrows_domain/src/definitions/use_cases/delete_word.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockDefinitionRepository extends Mock implements DefinitionRepository {}

void main() {
  late DeleteWord usecase;

  late DefinitionRepository definitionRepository;

  final kDefinitionRecord = const (
    words: ['word1', 'word2'],
    definition: 'description',
  );

  final kWord = 'word1';

  setUpAll(() {
    registerFallbackValue(kDefinitionRecord);
    registerFallbackValue(kWord);

    definitionRepository = MockDefinitionRepository();
    when(() => definitionRepository.updateDefinition(any()))
        .thenAnswer((_) async {});

    usecase = DeleteWord(
      definitionRepository: definitionRepository,
    );
  });

  test('The usecase should works correctly', () async {
    await usecase.execute(
      definitionRecord: kDefinitionRecord,
      word: kWord,
    );

    verify(() => definitionRepository.updateDefinition(any())).called(1);
  });
}
