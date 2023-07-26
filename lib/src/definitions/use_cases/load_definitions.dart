import 'package:arrows_domain/src/definitions/definition_presenter.dart';
import 'package:arrows_domain/src/definitions/mappers/definition_mapper.dart';
import 'package:arrows_domain/src/definitions/repositories/definition_repository.dart';

class LoadDefinitions {
  final DefinitionRepository _definitionRepository;
  final DefinitionPresenter _definitionPresenter;

  LoadDefinitions({
    required DefinitionRepository definitionRepository,
    required DefinitionPresenter definitionPresenter,
  })  : _definitionRepository = definitionRepository,
        _definitionPresenter = definitionPresenter;

  Future<void> execute() async {
    final definitionModels = await _definitionRepository.fetchDefinitions();
    final definitions = DefinitionMapper().toEntities(definitionModels);

    _definitionPresenter
        .presentDefinitions(DefinitionMapper().toModels(definitions));
  }
}
