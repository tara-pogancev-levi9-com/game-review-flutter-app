import 'package:flutter/material.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sprintf/sprintf.dart';

class ShareService {
  static Future<void> shareGame(
    GameModel game, {
    GlobalKey? popupMenuKey,
  }) async {
    final message = _createShareMessage(game);

    try {
      await SharePlus.instance.share(
        ShareParams(
          text: message,
          subject: t.shareSubject,
          sharePositionOrigin: popupMenuKey != null
              ? _getSharePositionOrigin(popupMenuKey)
              : null,
        ),
      );
    } catch (e) {
      throw Exception('${t.gameDetails.failedToShare} $e');
    }
  }

  static String _createShareMessage(GameModel game) {
    return sprintf(t.shareMessage, [game.title]);
  }

  static Rect _getSharePositionOrigin(GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      size.width,
      size.height,
    );
  }
}
