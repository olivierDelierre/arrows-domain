import 'package:arrows_domain/src/definitions/mappers/definition_mapper.dart';
import 'package:arrows_domain/src/definitions/models/definition_model.dart';
import 'package:arrows_domain/src/definitions/repositories/definition_repository.dart';

class DeleteWord {
  final DefinitionRepository _definitionRepository;

  const DeleteWord({required DefinitionRepository definitionRepository})
      : _definitionRepository = definitionRepository;

  Future<void> execute({
    required DefinitionModel definitionModel,
    required String word,
  }) async {
    final definition = DefinitionMapper().toEntity(definitionModel);
    definition.deleteWord(word);

    await _definitionRepository.updateDefinition(
      DefinitionMapper().toModel(definition),
    );
  }
}
