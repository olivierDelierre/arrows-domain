import 'package:arrows_domain/src/definitions/mappers/definition_mapper.dart';
import 'package:arrows_domain/src/definitions/records/definition_record.dart';
import 'package:arrows_domain/src/definitions/repositories/definition_repository.dart';

class AddDefinition {
  final DefinitionRepository _definitionRepository;

  AddDefinition({required DefinitionRepository definitionRepository})
      : _definitionRepository = definitionRepository;

  Future<void> execute({required DefinitionRecord definitionRecord}) async {
    final definition = DefinitionMapper().toEntity(definitionRecord);

    await _definitionRepository
        .addDefinition(DefinitionMapper().toRecord(definition));
  }
}
