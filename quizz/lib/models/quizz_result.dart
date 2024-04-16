enum QuizzRanking {
  bronze,
  silver,
  gold,
  platinum,
}

class QuizzResult {
  final int totalScore;
  final int playerScore;

  QuizzResult({
    required this.playerScore,
    required this.totalScore,
  });

  double get playerPercentScore =>
      (totalScore != 0) ? playerScore / totalScore : 0.0;

  String get playerPercentScoreAsText {
    final result = playerPercentScore * 100.0;
    return '${result.toStringAsFixed(1)}%'.replaceFirst('.', ',');
  }

  QuizzRanking get raking {
    final score = playerPercentScore;

    if (score <= 0.50) {
      return QuizzRanking.bronze;
    } else if (score <= 0.75) {
      return QuizzRanking.silver;
    } else if (score < 1.00) {
      return QuizzRanking.gold;
    }
    return QuizzRanking.platinum;
  }

  String get rakingAsText {
    switch (raking) {
      case QuizzRanking.bronze:
        return 'bronze';
      case QuizzRanking.silver:
        return 'prata';
      case QuizzRanking.gold:
        return 'ouro';
      case QuizzRanking.platinum:
        return 'platina';
    }
  }
}
