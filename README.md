# avataaar_image

[![pub package](https://img.shields.io/pub/v/avataaar_image.svg)](https://pub.dartlang.org/packages/avataaar_image)

Flutter wrapper widget for [Avataaars](https://getavataaars.com/) API - *a free online avatar generator for anyone to make their beautiful personal avatar easily*.

![AvataaarImage example](https://thumbs.gfycat.com/PettyBeautifulHydra-small.gif)

## Avataaars

Credits to [Pablo Stanley](https://twitter.com/pablostanley) and [Fang-Pen Lin](https://twitter.com/fangpenlin) for creating and making [Avataaars](https://avataaars.com/) available to use. 👏

## Getting Started

1. Create Avataaar object:
```Dart
// Create avatar with default constructor
Avataaar(
  skin: Skin.pale,
  style: Style.circle,
  top: Top.longHairCurly(
    accessoriesType: AccessoriesType.Round,
    facialHair: FacialHair.beardMagestic(
      facialHairColor: FacialHairColor.BlondeGolden,
    ),
  ),
);

// Randomize all properties
Avataaar.random();

// Or mix both
Avataaar.random(
  skin: Skin.pale,
  style: Style.circle,
  top: Top.longHairCurly(
    accessoriesType: AccessoriesType.Round,
    facialHair: FacialHair.random,
  ),
);
```

2. Create AvataaarImage widget and pass it the avatar:

```Dart
AvataaarImage(
  avatar: avatar,
  placeholder: CircularProgressIndicator(),
);

// By default Image/SvgPicture widget will be used to render the image. If it doesn't fit your 
// needs it's possible to use [builder] constructor and create widget for given image url:
AvataaarImage.builder(
  avatar: avatar,
  builder: (context, url) {
    // ...
  },
)

// It is also possible to choose between SVG (default) and PNG format of the image.
// To do that, pass additional [AvataaarFormat] object as [format] parameter: 
AvataaarImage(
  avatar: avatar,
  format: AvataaarFormat.svg(),
  // or
  format: AvataaarFormat.png(128.0),
);
```

**Note:** avataaars.io PNG support [has been disabled](https://github.com/gkoberger/avataaars/issues/16) due to excesive usage of the API.
If PNG format has to be used, you need to host the service on your own and override `AvataaarsApi.baseUrl` value.

### Persisting avatars

Use `Avataaar.toJson()` and `Avataaar.fromJson(String)` methods to serialize/deserialize avatars.
