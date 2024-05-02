import 'package:jokenpo/domain/jokenpo_object.dart';

enum JokenpoPlayer {
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

  JokenpoPlayer? get winner {
    JokenpoPlayer? result;

    if (player1Object > player2Object) {
      result = JokenpoPlayer.player1;
    } else if (player2Object > player1Object) {
      result = JokenpoPlayer.player2;
    } else {
      result = null;
    }

    return result;
  }

  String get winnerText {
    switch (winner) {
      case JokenpoPlayer.player1:
        return 'O computador venceu';

      case JokenpoPlayer.player2:
        return 'Você venceu';

      default:
        return 'Empatou';
    }
  }

  String get reasonText {
    if (player1Object > player2Object) {
      return '$player1Object ${player1Object.power} $player2Object';
    } else if (player2Object > player1Object) {
      return '$player2Object ${player2Object.power} $player1Object';
    } else {
      return '';
    }
  }
}
