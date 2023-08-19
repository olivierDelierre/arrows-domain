import 'package:arrows_domain/src/definitions/repositories/definition_repository.dart';
import 'package:arrows_domain/src/definitions/use_cases/add_definition.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/scaffolding.dart';

class MockDefinitionRepository extends Mock implements DefinitionRepository {}

void main() {
  late AddDefinition usecase;
  late DefinitionRepository definitionRepository;

  final kDefinitionRecord = (
    words: ['word1', 'word2'],
    definition: 'description',
  );

  setUpAll(() {
    registerFallbackValue(kDefinitionRecord);

    definitionRepository = MockDefinitionRepository();
    when(() => definitionRepository.addDefinition(any()))
        .thenAnswer((_) async {});

    usecase = AddDefinition(definitionRepository: definitionRepository);
  });

  test('The usecase should works correctly', () async {
    await usecase.execute(definitionRecord: kDefinitionRecord);

    verify(() => definitionRepository.addDefinition(any())).called(1);
  });
}
