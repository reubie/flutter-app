class Dictionary {
  final String number;
  final String words;

  const Dictionary({
    required this.number,
    required this.words,
  });

  Dictionary copy({
    String? number,
    String? words,
  }) =>
      Dictionary(
        number: number ?? this.number,
        words: words ?? this.words,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Dictionary &&
          runtimeType == other.runtimeType &&
          number == other.number &&
          words == other.words;

  @override
  int get hashCode => number.hashCode ^ words.hashCode;
}
