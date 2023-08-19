import 'package:arrows_domain/src/definitions/records/definition_record.dart';

abstract class DefinitionRepository {
  Future<List<DefinitionRecord>> fetchDefinitions();
  Future<void> addDefinition(DefinitionRecord definition);
  Future<void> updateDefinition(DefinitionRecord definition);
  Future<void> deleteDefinition(DefinitionRecord definition);
}
