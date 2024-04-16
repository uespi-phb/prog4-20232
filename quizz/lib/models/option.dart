class Option {
  final String text;
  final bool correct;

  const Option({
    required this.text,
    this.correct = false,
  });

  @override
  String toString() => text;
}
