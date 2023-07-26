import 'package:arrows_domain/src/definitions/definition_presenter.dart';
import 'package:arrows_domain/src/definitions/repositories/definition_repository.dart';
import 'package:arrows_domain/src/definitions/use_cases/load_definitions.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockDefinitionRepository extends Mock implements DefinitionRepository {}

class MockDefinitionPresenter extends Mock implements DefinitionPresenter {}

void main() {
  late DefinitionRepository definitionRepository;
  late DefinitionPresenter definitionPresenter;

  late LoadDefinitions usecase;

  setUpAll(() {
    definitionRepository = MockDefinitionRepository();
    when(() => definitionRepository.fetchDefinitions()).thenAnswer(
      (_) async => [],
    );

    definitionPresenter = MockDefinitionPresenter();
    when(() => definitionPresenter.presentDefinitions(any())).thenAnswer(
      (_) {},
    );

    usecase = LoadDefinitions(
      definitionRepository: definitionRepository,
      definitionPresenter: definitionPresenter,
    );
  });

  test('The usecase should works correctly', () async {
    await usecase.execute();

    verify(() => definitionRepository.fetchDefinitions()).called(1);
    verify(() => definitionPresenter.presentDefinitions(any())).called(1);
  });
}
