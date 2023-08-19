import 'package:arrows_domain/src/definitions/repositories/definition_repository.dart';
import 'package:arrows_domain/src/definitions/use_cases/delete_definition.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/scaffolding.dart';

class MockDefinitionRepository extends Mock implements DefinitionRepository {}

void main() {
  late DeleteDefinition usecase;

  late DefinitionRepository definitionRepository;

  final kDefinitionRecord = const (
    words: ['word1', 'word2'],
    definition: 'description',
  );

  setUpAll(() {
    registerFallbackValue(kDefinitionRecord);

    definitionRepository = MockDefinitionRepository();
    when(() => definitionRepository.deleteDefinition(any()))
        .thenAnswer((_) async {});

    usecase = DeleteDefinition(definitionRepository: definitionRepository);
  });

  test('The usecase should works correctly', () async {
    await usecase.execute(definitionRecord: kDefinitionRecord);

    verify(() => definitionRepository.deleteDefinition(any())).called(1);
  });
}
