import 'package:arrows_domain/src/definitions/mappers/definition_mapper.dart';
import 'package:arrows_domain/src/definitions/records/definition_record.dart';
import 'package:arrows_domain/src/definitions/repositories/definition_repository.dart';

class AddWord {
  final DefinitionRepository _definitionRepository;

  AddWord({required DefinitionRepository definitionRepository})
      : _definitionRepository = definitionRepository;

  Future<void> execute({
    required DefinitionRecord definitionRecord,
    required String word,
  }) async {
    final definition = DefinitionMapper().toEntity(definitionRecord);
    definition.addWord(word);

    await _definitionRepository.updateDefinition(
      DefinitionMapper().toRecord(definition),
    );
  }
}
