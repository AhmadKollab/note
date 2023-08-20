abstract class DataBaseOperations<T>{
  // ignore: non_constant_identifier_names
  Future<int> Create(T object);
  Future<List<T>> Read();
  Future<T> show(int id);
  // ignore: non_constant_identifier_names
  Future<bool> Update(T object);
  // ignore: non_constant_identifier_names
  Future<bool> Delete(int id);

}