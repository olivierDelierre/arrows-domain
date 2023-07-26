import 'package:arrows_domain/src/definitions/models/definition_model.dart';
import 'package:arrows_domain/src/definitions/repositories/definition_repository.dart';
import 'package:arrows_domain/src/definitions/use_cases/add_word.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/scaffolding.dart';

class MockDefinitionRepository extends Mock implements DefinitionRepository {}

void main() {
  late AddWord usecase;

  late DefinitionRepository definitionRepository;

  final kDefinitionModel = DefinitionModel(
    words: ['word1', 'word2'],
    definition: 'description',
  );

  final kWord = 'word3';

  setUpAll(() {
    registerFallbackValue(kDefinitionModel);
    registerFallbackValue(kWord);

    definitionRepository = MockDefinitionRepository();
    when(() => definitionRepository.updateDefinition(any()))
        .thenAnswer((_) async {});

    usecase = AddWord(definitionRepository: definitionRepository);
  });

  test('The usecase should works correctly', () async {
    await usecase.execute(definitionModel: kDefinitionModel, word: kWord);

    verify(() => definitionRepository.updateDefinition(any())).called(1);
  });
}
