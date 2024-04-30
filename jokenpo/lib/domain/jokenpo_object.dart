enum JokenpoObject implements Comparable<JokenpoObject> {
  stone('quebra'),
  paper('envolve'),
  scisors('corta');

  const JokenpoObject(this.reason);

  final String reason;

  @override
  String toString() {
    switch (this) {
      case JokenpoObject.stone:
        return 'pedra';
      case JokenpoObject.paper:
        return 'papel';
      case JokenpoObject.scisors:
        return 'tesoura';
    }
  }

  @override
  int compareTo(JokenpoObject other) {
    int result = 0;

    if (this == other) {
      return 0;
    }

    switch (this) {
      case JokenpoObject.stone:
        result = (other == JokenpoObject.scisors) ? 1 : -1;
        break;
      case JokenpoObject.paper:
        result = (other == JokenpoObject.stone) ? 1 : -1;
        break;
      case JokenpoObject.scisors:
        result = (other == JokenpoObject.paper) ? 1 : -1;
        break;
    }
    return result;
  }

  bool operator >(JokenpoObject other) => compareTo(other) > 0;
  bool operator <(JokenpoObject other) => compareTo(other) < 0;
  bool operator >=(JokenpoObject other) => compareTo(other) >= 0;
  bool operator <=(JokenpoObject other) => compareTo(other) <= 0;
}
