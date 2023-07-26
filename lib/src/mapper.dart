abstract class Mapper<M, E> {
  M toModel(E entity);
  E toEntity(M model);

  List<M> toModels(List<E> entities) {
    return entities.map((entity) => toModel(entity)).toList();
  }

  List<E> toEntities(List<M> models) {
    return models.map((model) => toEntity(model)).toList();
  }
}
