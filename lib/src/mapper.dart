abstract class Mapper<R, E> {
  R toRecord(E entity);
  E toEntity(R record);

  List<R> toRecords(List<E> entities) {
    return entities.map((entity) => toRecord(entity)).toList();
  }

  List<E> toEntities(List<R> records) {
    return records.map((record) => toEntity(record)).toList();
  }
}
