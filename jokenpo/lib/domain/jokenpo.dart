import 'package:jokenpo/domain/jokenpo_object.dart';

enum JokenpoWinner {
  draw,
  player1,
  player2,
}

class Jokenpo {
  final JokenpoObject player1Object;
  final JokenpoObject player2Object;

  Jokenpo({
    required this.player1Object,
    required this.player2Object,
  });

  JokenpoWinner get winner {
    JokenpoWinner result = JokenpoWinner.draw;

    if (player1Object > player2Object) {
      result = JokenpoWinner.player1;
    } else if (player2Object > player1Object) {
      result = JokenpoWinner.player2;
    } else {
      result = JokenpoWinner.draw;
    }

    return result;
  }

  String get winnerText {
    switch (winner) {
      case JokenpoWinner.player1:
        return 'O computador venceu';

      case JokenpoWinner.player2:
        return 'Você venceu';

      default:
        return 'Empatou';
    }
  }

  String get reasonText {
    if (player1Object > player2Object) {
      return '$player1Object ${player1Object.reason} $player2Object';
    } else if (player2Object > player1Object) {
      return '$player2Object ${player2Object.reason} $player1Object';
    } else {
      return '';
    }
  }
}
