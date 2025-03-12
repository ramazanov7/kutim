/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/application-active.svg
  SvgGenImage get applicationActive =>
      const SvgGenImage('assets/icons/application-active.svg');

  /// File path: assets/icons/application-inactive.svg
  SvgGenImage get applicationInactive =>
      const SvgGenImage('assets/icons/application-inactive.svg');

  /// File path: assets/icons/back-auth.svg
  SvgGenImage get backAuth => const SvgGenImage('assets/icons/back-auth.svg');

  /// File path: assets/icons/back.svg
  SvgGenImage get back => const SvgGenImage('assets/icons/back.svg');

  /// File path: assets/icons/car-active.svg
  SvgGenImage get carActive => const SvgGenImage('assets/icons/car-active.svg');

  /// File path: assets/icons/car-inactive.svg
  SvgGenImage get carInactive =>
      const SvgGenImage('assets/icons/car-inactive.svg');

  /// File path: assets/icons/clear.svg
  SvgGenImage get clear => const SvgGenImage('assets/icons/clear.svg');

  /// File path: assets/icons/eye.svg
  SvgGenImage get eye => const SvgGenImage('assets/icons/eye.svg');

  /// File path: assets/icons/hide-eye.svg
  SvgGenImage get hideEye => const SvgGenImage('assets/icons/hide-eye.svg');

  /// File path: assets/icons/main-active.svg
  SvgGenImage get mainActive =>
      const SvgGenImage('assets/icons/main-active.svg');

  /// File path: assets/icons/main-inactive.svg
  SvgGenImage get mainInactive =>
      const SvgGenImage('assets/icons/main-inactive.svg');

  /// File path: assets/icons/profile-active.svg
  SvgGenImage get profileActive =>
      const SvgGenImage('assets/icons/profile-active.svg');

  /// File path: assets/icons/profile-inactive.svg
  SvgGenImage get profileInactive =>
      const SvgGenImage('assets/icons/profile-inactive.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    applicationActive,
    applicationInactive,
    backAuth,
    back,
    carActive,
    carInactive,
    clear,
    eye,
    hideEye,
    mainActive,
    mainInactive,
    profileActive,
    profileInactive,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/onboarding-first-image.png
  AssetGenImage get onboardingFirstImage =>
      const AssetGenImage('assets/images/onboarding-first-image.png');

  /// File path: assets/images/onboarding-second-image.png
  AssetGenImage get onboardingSecondImage =>
      const AssetGenImage('assets/images/onboarding-second-image.png');

  /// File path: assets/images/onboarding-third-image.png
  AssetGenImage get onboardingThirdImage =>
      const AssetGenImage('assets/images/onboarding-third-image.png');

  /// File path: assets/images/splash-logo.png
  AssetGenImage get splashLogo =>
      const AssetGenImage('assets/images/splash-logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    onboardingFirstImage,
    onboardingSecondImage,
    onboardingThirdImage,
    splashLogo,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
