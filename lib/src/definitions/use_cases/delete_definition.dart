import 'package:arrows_domain/src/definitions/models/definition_model.dart';
import 'package:arrows_domain/src/definitions/repositories/definition_repository.dart';

class DeleteDefinition {
  final DefinitionRepository _definitionRepository;

  const DeleteDefinition({required DefinitionRepository definitionRepository})
      : _definitionRepository = definitionRepository;

  Future<void> execute({required DefinitionModel definitionModel}) async {
    await _definitionRepository.deleteDefinition(definitionModel);
  }
}
