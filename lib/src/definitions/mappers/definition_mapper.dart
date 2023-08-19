import 'package:arrows_domain/src/definitions/entities/definition.dart';
import 'package:arrows_domain/src/definitions/records/definition_record.dart';
import 'package:arrows_domain/src/mapper.dart';

class DefinitionMapper extends Mapper<DefinitionRecord, Definition> {
  @override
  DefinitionRecord toRecord(Definition entity) {
    return (
      words: entity.words,
      definition: entity.definition,
    );
  }

  @override
  Definition toEntity(DefinitionRecord record) {
    return Definition(
      words: List.of(record.words, growable: true),
      definition: record.definition,
    );
  }
}
