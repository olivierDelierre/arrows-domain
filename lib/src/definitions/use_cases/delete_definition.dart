import 'package:arrows_domain/src/definitions/records/definition_record.dart';
import 'package:arrows_domain/src/definitions/repositories/definition_repository.dart';

class DeleteDefinition {
  final DefinitionRepository _definitionRepository;

  const DeleteDefinition({required DefinitionRepository definitionRepository})
      : _definitionRepository = definitionRepository;

  Future<void> execute({required DefinitionRecord definitionRecord}) async {
    await _definitionRepository.deleteDefinition(definitionRecord);
  }
}
