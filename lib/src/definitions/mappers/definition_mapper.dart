import 'package:arrows_domain/src/definitions/entities/definition.dart';
import 'package:arrows_domain/src/definitions/models/definition_model.dart';
import 'package:arrows_domain/src/mapper.dart';

class DefinitionMapper extends Mapper<DefinitionModel, Definition> {
  @override
  DefinitionModel toModel(Definition entity) {
    return DefinitionModel(
      words: entity.words,
      definition: entity.definition,
    );
  }

  @override
  Definition toEntity(DefinitionModel model) {
    return Definition(
      words: List.of(model.words, growable: true),
      definition: model.definition,
    );
  }
}
