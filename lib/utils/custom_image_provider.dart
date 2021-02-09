import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class CustomImageProvider extends ImageProvider<CustomImageProvider> {
  final Uint8List image;
  final double scale;
  CustomImageProvider({this.image, this.scale = 1.0});
  Future<Codec> _fetchImage() {
    return PaintingBinding.instance.instantiateImageCodec(image);
  }

  @override
  ImageStreamCompleter load(CustomImageProvider key, decode) {
    return MultiFrameImageStreamCompleter(
        codec: key._fetchImage(),
        scale: key.scale,
        informationCollector: () sync* {
          yield DiagnosticsProperty<ImageProvider>('Image provider: $this \n Image key: $key', this,
              style: DiagnosticsTreeStyle.errorProperty);
        });
  }

  @override
  Future<CustomImageProvider> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<CustomImageProvider>(this);
  }
}
