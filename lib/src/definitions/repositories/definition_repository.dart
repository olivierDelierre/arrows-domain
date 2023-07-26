import 'package:arrows_domain/src/definitions/models/definition_model.dart';

abstract class DefinitionRepository {
  Future<List<DefinitionModel>> fetchDefinitions();
  Future<void> addDefinition(DefinitionModel definition);
  Future<void> updateDefinition(DefinitionModel definition);
  Future<void> deleteDefinition(DefinitionModel definition);
}
