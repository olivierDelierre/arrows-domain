import 'package:arrows_domain/src/definitions/mappers/definition_mapper.dart';
import 'package:arrows_domain/src/definitions/models/definition_model.dart';
import 'package:arrows_domain/src/definitions/repositories/definition_repository.dart';

class AddDefinition {
  final DefinitionRepository _definitionRepository;

  AddDefinition({required DefinitionRepository definitionRepository})
      : _definitionRepository = definitionRepository;

  Future<void> execute({required DefinitionModel definitionModel}) async {
    final definition = DefinitionMapper().toEntity(definitionModel);

    await _definitionRepository
        .addDefinition(DefinitionMapper().toModel(definition));
  }
}
