class Definition {
  final String definition;
  final List<String> words;

  void addWord(String word) => words.add(word);
  void deleteWord(String word) => words.remove(word);

  Definition({
    required this.words,
    required this.definition,
  });
}
