import 'package:arrows_domain/src/definitions/models/definition_model.dart';
import 'package:arrows_domain/src/definitions/repositories/definition_repository.dart';
import 'package:arrows_domain/src/definitions/use_cases/add_definition.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/scaffolding.dart';

class MockDefinitionRepository extends Mock implements DefinitionRepository {}

void main() {
  late AddDefinition usecase;
  late DefinitionRepository definitionRepository;

  final kDefinitionModel = DefinitionModel(
    words: ['word1', 'word2'],
    definition: 'description',
  );

  setUpAll(() {
    registerFallbackValue(kDefinitionModel);

    definitionRepository = MockDefinitionRepository();
    when(() => definitionRepository.addDefinition(any()))
        .thenAnswer((_) async {});

    usecase = AddDefinition(definitionRepository: definitionRepository);
  });

  test('The usecase should works correctly', () async {
    await usecase.execute(definitionModel: kDefinitionModel);

    verify(() => definitionRepository.addDefinition(any())).called(1);
  });
}
