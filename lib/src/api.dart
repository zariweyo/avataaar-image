import 'package:avataaar_image/avataaar_image.dart';
import 'package:avataaar_image/src/avataaar.dart';

class AvataaarsApi {
  static String baseUrl = 'https://avataaars.io/';

  String getUrl(Avataaar avatar, AvataaarFormat format) {
    final params = avatar.pieceEntries.map((it) {
      final key = it.key[0].toLowerCase() + it.key.substring(1);
      return '$key=${it.value}';
    }).join('&');
    var url = baseUrl;
    if (format is AvataaarPng) url += 'png/${format.width}/';
    return url += '?$params';
  }
}

abstract class AvataaarFormat {
  AvataaarFormat();

  factory AvataaarFormat.svg() = AvataaarSvg;
  factory AvataaarFormat.png(double width) = AvataaarPng;
}

class AvataaarSvg extends AvataaarFormat {}

class AvataaarPng extends AvataaarFormat {
  final double width;

  AvataaarPng(this.width);
}
