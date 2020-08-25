import 'package:avataaar_image/src/api.dart';
import 'package:avataaar_image/src/avataaar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef AvataaarBuilder = Widget Function(BuildContext context, String url);

class AvataaarImage extends StatelessWidget with AvataaarsApi {
  AvataaarImage({
    Key key,
    @required this.avatar,
    this.format,
    this.placeholder,
  })  : this.builder = null,
        super(key: key);

  AvataaarImage.builder({
    Key key,
    @required this.builder,
    @required this.avatar,
    this.format,
  })  : this.placeholder = null,
        super(key: key);

  final Avataaar avatar;
  final AvataaarFormat format;
  final AvataaarBuilder builder;
  final Widget placeholder;

  @override
  Widget build(BuildContext context) {
    final imageFormat = format ?? AvataaarFormat.svg();
    final imageUrl = getUrl(avatar, imageFormat);
    if (builder != null) {
      return builder(context, imageUrl);
    } else if (imageFormat is AvataaarSvg) {
      return SvgPicture.network(
        imageUrl,
        placeholderBuilder: placeholder != null ? (_) => placeholder : null,
      );
    } else {
      return Image.network(
        imageUrl,
        loadingBuilder:
            placeholder != null ? (_, __, ___) => placeholder : null,
      );
    }
  }
}
