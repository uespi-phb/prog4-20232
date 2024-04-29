import 'package:jokenpo/models/jokenpo_object.dart';

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

    switch (player1Object) {
      case JokenpoObject.paper:
        if (player2Object == JokenpoObject.stone) {
          result = JokenpoWinner.player1;
        } else if (player2Object == JokenpoObject.scisors) {
          result = JokenpoWinner.player2;
        }
        break;
      case JokenpoObject.stone:
        if (player2Object == JokenpoObject.scisors) {
          result = JokenpoWinner.player1;
        } else if (player2Object == JokenpoObject.paper) {
          result = JokenpoWinner.player2;
        }
        break;
      case JokenpoObject.scisors:
        if (player2Object == JokenpoObject.paper) {
          result = JokenpoWinner.player1;
        } else if (player2Object == JokenpoObject.stone) {
          result = JokenpoWinner.player2;
        }
        break;
      default:
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

  String get winnerReason {
    switch (winner) {
      case JokenpoWinner.player1:
        return 'O computador venceu';

      case JokenpoWinner.player2:
        return 'Você venceu';

      default:
        return 'Empatou';
    }
  }
}
