part of '../../styled_widget.dart';

typedef GestureOnTapChangeCallback = void Function(bool tapState);

extension StyledWidget on Widget {
  /// animated all properties before this method
  Widget animate(
    Duration duration,
    Curve curve, {
    Key? key,
  }) =>
      _StyledInheritedAnimation(
        key: key,
        animation: _StyledAnimatedModel(duration: duration, curve: curve),
        child: this,
      );

  /// Applies a parent to a child
  /// ```dart
  /// final parentWidget = ({required Widget child}) => Styled.widget(child: child)
  ///   .alignment(Alignment.center)
  ///
  /// final childWidget = Text('some text')
  ///   .padding(all: 10)
  ///
  /// Widget build(BuildContext) => childWidget
  ///   .parent(parentWidget);
  /// ```
  Widget parent(Widget Function({required Widget child}) parent) =>
      parent(child: this);

  Widget padding({
    Key? key,
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
    EdgeInsetsGeometry? padding,
    bool animate = false,
  }) {
    padding ??= EdgeInsets.only(
      top: top ?? vertical ?? all ?? 0.0,
      bottom: bottom ?? vertical ?? all ?? 0.0,
      left: left ?? horizontal ?? all ?? 0.0,
      right: right ?? horizontal ?? all ?? 0.0,
    );

    return animate
        ? _StyledAnimatedBuilder(
            key: key,
            builder: (animation) {
              return AnimatedPadding(
                padding: padding!,
                duration: animation.duration,
                curve: animation.curve,
                child: this,
              );
            },
          )
        : Padding(key: key, padding: padding, child: this);
  }

  // alias for padding for widgets with "padding" property
  Widget pad({
    Key? key,
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
    EdgeInsetsGeometry? padding,
    bool animate = false,
  }) =>
      this.padding(
        key: key,
        all: all,
        horizontal: horizontal,
        vertical: vertical,
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        padding: padding,
        animate: animate,
      );

  Widget paddingDirectional({
    Key? key,
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? start,
    double? end,
    EdgeInsetsGeometry? padding,
    bool animate = false,
  }) {
    padding ??= EdgeInsetsDirectional.only(
      top: top ?? vertical ?? all ?? 0.0,
      bottom: bottom ?? vertical ?? all ?? 0.0,
      start: start ?? horizontal ?? all ?? 0.0,
      end: end ?? horizontal ?? all ?? 0.0,
    );
    return animate
        ? _StyledAnimatedBuilder(
            key: key,
            builder: (animation) {
              return AnimatedPadding(
                padding: padding!,
                duration: animation.duration,
                curve: animation.curve,
                child: this,
              );
            },
          )
        : Padding(key: key, padding: padding, child: this);
  }

  Widget opacity(
    double opacity, {
    Key? key,
    bool animate = false,
    bool alwaysIncludeSemantics = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              key: key,
              builder: (animation) {
                return AnimatedOpacity(
                  opacity: opacity,
                  alwaysIncludeSemantics: alwaysIncludeSemantics,
                  duration: animation.duration,
                  curve: animation.curve,
                  child: this,
                );
              },
            )
          : Opacity(
              key: key,
              opacity: opacity,
              alwaysIncludeSemantics: alwaysIncludeSemantics,
              child: this,
            );

  Widget offstage({
    Key? key,
    bool offstage = true,
  }) =>
      Offstage(
        key: key,
        offstage: offstage,
        child: this,
      );

  Widget alignment(
    AlignmentGeometry alignment, {
    Key? key,
    double? widthFactor,
    double? heightFactor,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              key: key,
              builder: (animation) {
                return AnimatedAlign(
                  alignment: alignment,
                  widthFactor: widthFactor,
                  heightFactor: heightFactor,
                  duration: animation.duration,
                  curve: animation.curve,
                  child: this,
                );
              },
            )
          : Align(
              key: key,
              alignment: alignment,
              widthFactor: widthFactor,
              heightFactor: heightFactor,
              child: this,
            );

  Widget backgroundColor(
    Color color, {
    Key? key,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              key: key,
              builder: (animation) {
                return _AnimatedDecorationBox(
                  decoration: BoxDecoration(color: color),
                  duration: animation.duration,
                  curve: animation.curve,
                  child: this,
                );
              },
            )
          : DecoratedBox(
              key: key,
              decoration: BoxDecoration(color: color),
              child: this,
            );

  Widget backgroundImage(
    DecorationImage image, {
    Key? key,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              key: key,
              builder: (animation) {
                return _AnimatedDecorationBox(
                  decoration: BoxDecoration(image: image),
                  duration: animation.duration,
                  curve: animation.curve,
                  child: this,
                );
              },
            )
          : DecoratedBox(
              key: key,
              decoration: BoxDecoration(image: image),
              child: this,
            );

  Widget backgroundGradient(
    Gradient gradient, {
    Key? key,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              key: key,
              builder: (animation) {
                return _AnimatedDecorationBox(
                  decoration: BoxDecoration(gradient: gradient),
                  duration: animation.duration,
                  curve: animation.curve,
                  child: this,
                );
              },
            )
          : DecoratedBox(
              key: key,
              decoration: BoxDecoration(gradient: gradient),
              child: this,
            );

  Widget backgroundLinearGradient({
    Key? key,
    AlignmentGeometry begin = Alignment.centerLeft,
    AlignmentGeometry end = Alignment.centerRight,
    List<Color>? colors,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
    GradientTransform? transform,
    bool animate = false,
  }) {
    final BoxDecoration decoration = BoxDecoration(
      gradient: LinearGradient(
        begin: begin,
        end: end,
        colors: colors ?? [],
        stops: stops,
        tileMode: tileMode,
        transform: transform,
      ),
    );
    return animate
        ? _StyledAnimatedBuilder(
            key: key,
            builder: (animation) {
              return _AnimatedDecorationBox(
                decoration: decoration,
                duration: animation.duration,
                curve: animation.curve,
                child: this,
              );
            },
          )
        : DecoratedBox(
            key: key,
            decoration: decoration,
            child: this,
          );
  }

  Widget backgroundRadialGradient({
    Key? key,
    AlignmentGeometry center = Alignment.center,
    double radius = 0.5,
    List<Color>? colors,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
    AlignmentGeometry? focal,
    double focalRadius = 0.0,
    GradientTransform? transform,
    bool animate = false,
  }) {
    final BoxDecoration decoration = BoxDecoration(
      gradient: RadialGradient(
        center: center,
        radius: radius,
        colors: colors ?? [],
        stops: stops,
        tileMode: tileMode,
        focal: focal,
        focalRadius: focalRadius,
        transform: transform,
      ),
    );
    return animate
        ? _StyledAnimatedBuilder(
            key: key,
            builder: (animation) {
              return _AnimatedDecorationBox(
                decoration: decoration,
                duration: animation.duration,
                curve: animation.curve,
                child: this,
              );
            },
          )
        : DecoratedBox(
            key: key,
            decoration: decoration,
            child: this,
          );
  }

  Widget backgroundSweepGradient({
    Key? key,
    AlignmentGeometry center = Alignment.center,
    double startAngle = 0.0,
    double endAngle = pi * 2,
    List<Color>? colors,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
    GradientTransform? transform,
    bool animate = false,
  }) {
    final BoxDecoration decoration = BoxDecoration(
      gradient: SweepGradient(
        center: center,
        startAngle: startAngle,
        endAngle: endAngle,
        colors: colors ?? [],
        stops: stops,
        tileMode: tileMode,
        transform: transform,
      ),
    );
    return animate
        ? _StyledAnimatedBuilder(
            key: key,
            builder: (animation) {
              return _AnimatedDecorationBox(
                decoration: decoration,
                duration: animation.duration,
                curve: animation.curve,
                child: this,
              );
            },
          )
        : DecoratedBox(
            key: key,
            decoration: decoration,
            child: this,
          );
  }

  Widget backgroundBlendMode(
    BlendMode blendMode, {
    Key? key,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              key: key,
              builder: (animation) {
                return _AnimatedDecorationBox(
                  decoration: BoxDecoration(backgroundBlendMode: blendMode),
                  duration: animation.duration,
                  curve: animation.curve,
                  child: this,
                );
              },
            )
          : DecoratedBox(
              key: key,
              decoration: BoxDecoration(backgroundBlendMode: blendMode),
              child: this,
            );

  Widget backgroundBlur(
    double sigma, {
    Key? key,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              key: key,
              builder: (animation) {
                return _AnimatedBackgroundBlur(
                  sigma: sigma,
                  duration: animation.duration,
                  curve: animation.curve,
                  child: this,
                );
              },
            )
          : BackdropFilter(
              key: key,
              filter: ImageFilter.blur(
                sigmaX: sigma,
                sigmaY: sigma,
              ),
              child: this,
            );

  Widget blurry(
    double sigma, {
    Key? key,
    bool animate = false,
  }) =>
      ImageFiltered(
        key: key,
        imageFilter: ImageFilter.blur(
          sigmaX: sigma,
          sigmaY: sigma,
        ),
        child: this,
      );

  Widget backdropFilter({
    Key? key,
    required ImageFilter filter,
    BlendMode blendMode = BlendMode.srcOver,
    bool enabled = true,
    BackdropKey? backdropGroupKey,
  }) =>
      BackdropFilter(
        key: key,
        filter: filter,
        blendMode: blendMode,
        enabled: enabled,
        backdropGroupKey: backdropGroupKey,
        child: this,
      );

  Widget borderRadius({
    Key? key,
    double? all,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
    bool animate = false,
  }) {
    final BoxDecoration decoration = BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft ?? all ?? 0.0),
        topRight: Radius.circular(topRight ?? all ?? 0.0),
        bottomLeft: Radius.circular(bottomLeft ?? all ?? 0.0),
        bottomRight: Radius.circular(bottomRight ?? all ?? 0.0),
      ),
    );
    return animate
        ? _StyledAnimatedBuilder(
            key: key,
            builder: (animation) {
              return _AnimatedDecorationBox(
                decoration: decoration,
                duration: animation.duration,
                curve: animation.curve,
                child: this,
              );
            },
          )
        : DecoratedBox(
            key: key,
            decoration: decoration,
            child: this,
          );
  }

  Widget borderRadiusDirectional({
    Key? key,
    double? all,
    double? topStart,
    double? topEnd,
    double? bottomStart,
    double? bottomEnd,
    bool animate = false,
  }) {
    final BoxDecoration decoration = BoxDecoration(
      borderRadius: BorderRadiusDirectional.only(
        topStart: Radius.circular(topStart ?? all ?? 0.0),
        topEnd: Radius.circular(topEnd ?? all ?? 0.0),
        bottomStart: Radius.circular(bottomStart ?? all ?? 0.0),
        bottomEnd: Radius.circular(bottomEnd ?? all ?? 0.0),
      ),
    );
    return animate
        ? _StyledAnimatedBuilder(
            key: key,
            builder: (animation) {
              return _AnimatedDecorationBox(
                decoration: decoration,
                duration: animation.duration,
                curve: animation.curve,
                child: this,
              );
            },
          )
        : DecoratedBox(
            key: key,
            decoration: decoration,
            child: this,
          );
  }

  Widget clipRRect({
    Key? key,
    double? all,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
    CustomClipper<RRect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              key: key,
              builder: (animation) {
                return _AnimatedClipRRect(
                  clipper: clipper,
                  clipBehavior: clipBehavior,
                  topLeft: topLeft ?? all ?? 0.0,
                  topRight: topRight ?? all ?? 0.0,
                  bottomLeft: bottomLeft ?? all ?? 0.0,
                  bottomRight: bottomRight ?? all ?? 0.0,
                  duration: animation.duration,
                  curve: animation.curve,
                  child: this,
                );
              },
            )
          : ClipRRect(
              key: key,
              clipper: clipper,
              clipBehavior: clipBehavior,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topLeft ?? all ?? 0.0),
                topRight: Radius.circular(topRight ?? all ?? 0.0),
                bottomLeft: Radius.circular(bottomLeft ?? all ?? 0.0),
                bottomRight: Radius.circular(bottomRight ?? all ?? 0.0),
              ),
              child: this,
            );

  Widget clipRect({
    Key? key,
    CustomClipper<Rect>? clipper,
    Clip clipBehavior = Clip.hardEdge,
  }) =>
      ClipRect(
        key: key,
        clipper: clipper,
        clipBehavior: clipBehavior,
        child: this,
      );

  Widget clipOval({
    Key? key,
    CustomClipper<Rect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) =>
      ClipOval(
        key: key,
        clipper: clipper,
        clipBehavior: clipBehavior,
        child: this,
      );

  Widget clipRSuperellipse({
    Key? key,
    BorderRadiusGeometry borderRadius = BorderRadius.zero,
    CustomClipper<RSuperellipse>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) =>
      ClipRSuperellipse(
        key: key,
        borderRadius: borderRadius,
        clipper: clipper,
        clipBehavior: clipBehavior,
        child: this,
      );

  Widget border({
    Key? key,
    double? all,
    double? left,
    double? right,
    double? top,
    double? bottom,
    Color color = const Color(0xFF000000),
    BorderStyle style = BorderStyle.solid,
    bool animate = false,
  }) {
    final BoxDecoration decoration = BoxDecoration(
      border: Border(
        left: (left ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: left ?? all ?? 0, style: style),
        right: (right ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: right ?? all ?? 0, style: style),
        top: (top ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: top ?? all ?? 0, style: style),
        bottom: (bottom ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: bottom ?? all ?? 0, style: style),
      ),
    );
    return animate
        ? _StyledAnimatedBuilder(
            key: key,
            builder: (animation) {
              return _AnimatedDecorationBox(
                decoration: decoration,
                duration: animation.duration,
                curve: animation.curve,
                child: this,
              );
            },
          )
        : DecoratedBox(
            key: key,
            decoration: decoration,
            child: this,
          );
  }

  Widget decorated({
    Key? key,
    Color? color,
    DecorationImage? image,
    BoxBorder? border,
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    BoxShape shape = BoxShape.rectangle,
    DecorationPosition position = DecorationPosition.background,
    BoxDecoration? decoration,
    bool animate = false,
  }) {
    decoration ??= BoxDecoration(
      color: color,
      image: image,
      border: border,
      borderRadius: borderRadius,
      boxShadow: boxShadow,
      gradient: gradient,
      backgroundBlendMode: backgroundBlendMode,
      shape: shape,
    );
    return animate
        ? _StyledAnimatedBuilder(
            key: key,
            builder: (animation) {
              return _AnimatedDecorationBox(
                decoration: decoration,
                position: position,
                duration: animation.duration,
                curve: animation.curve,
                child: this,
              );
            },
          )
        : DecoratedBox(
            key: key,
            decoration: decoration,
            position: position,
            child: this,
          );
  }

  double _elevationOpacityCurve(double x) =>
      pow(x, 1 / 16) / sqrt(pow(x, 2) + 2) + 0.2;

  // TODO: Animate elevation
  Widget elevation(
    double elevation, {
    Key? key,
    BorderRadiusGeometry borderRadius = BorderRadius.zero,
    Color shadowColor = const Color(0xFF000000),
  }) =>
      Material(
        key: key,
        color: Colors.transparent,
        elevation: elevation,
        borderRadius: borderRadius,
        shadowColor: shadowColor,
        child: this,
      );

  Widget neumorphism({
    Key? key,
    required double elevation,
    BorderRadius borderRadius = BorderRadius.zero,
    Color backgroundColor = const Color(0xffEDF1F5),
    double curve = 0.0,
    bool animate = false,
  }) {
    final double offset = elevation / 2;
    final int colorOffset = (40 * curve).toInt();

    final BoxDecoration decoration = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.from(
            red: backgroundColor.r * colorOffset,
            green: backgroundColor.g * colorOffset,
            blue: backgroundColor.b * colorOffset,
            alpha: 1.0,
          ),
          Color.from(
            red: backgroundColor.r * -colorOffset,
            green: backgroundColor.g * -colorOffset,
            blue: backgroundColor.b * -colorOffset,
            alpha: 1.0,
          ),
        ],
        // stops: [0.90, 0.95],
      ),
      borderRadius: borderRadius,
      boxShadow: [
        BoxShadow(
          color: Colors.white,
          blurRadius: elevation.abs(),
          offset: Offset(-offset, -offset),
        ),
        BoxShadow(
          color: const Color(0xAAA3B1C6),
          blurRadius: elevation.abs(),
          offset: Offset(offset, offset),
        ),
      ],
    );

    return animate
        ? _StyledAnimatedBuilder(
            key: key,
            builder: (animation) {
              return _AnimatedDecorationBox(
                decoration: decoration,
                duration: animation.duration,
                curve: animation.curve,
                child: this,
              );
            },
          )
        : DecoratedBox(
            key: key,
            decoration: decoration,
            child: this,
          );
  }

  Widget boxShadow({
    Key? key,
    Color color = const Color(0xFF000000),
    Offset offset = Offset.zero,
    double blurRadius = 0.0,
    double spreadRadius = 0.0,
    bool animate = false,
  }) {
    final BoxDecoration decoration = BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: color,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
          offset: offset,
        ),
      ],
    );
    return animate
        ? _StyledAnimatedBuilder(
            key: key,
            builder: (animation) {
              return _AnimatedDecorationBox(
                decoration: decoration,
                duration: animation.duration,
                curve: animation.curve,
                child: this,
              );
            },
          )
        : DecoratedBox(
            key: key,
            decoration: decoration,
            child: this,
          );
  }

  Widget constrained({
    Key? key,
    double? width,
    double? height,
    double? square,
    double minWidth = 0.0,
    double maxWidth = double.infinity,
    double minHeight = 0.0,
    double maxHeight = double.infinity,
    bool animate = false,
  }) {
    BoxConstraints constraints = BoxConstraints(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    );
    constraints = (width != null || height != null || square != null)
        ? constraints.tighten(width: width ?? square, height: height ?? square)
        : constraints;
    return animate
        ? _StyledAnimatedBuilder(
            key: key,
            builder: (animation) {
              return _AnimatedConstrainedBox(
                constraints: constraints,
                duration: animation.duration,
                curve: animation.curve,
                child: this,
              );
            },
          )
        : ConstrainedBox(
            key: key,
            constraints: constraints,
            child: this,
          );
  }

  Widget width(
    double width, {
    Key? key,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              key: key,
              builder: (animation) {
                return _AnimatedConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: width),
                  duration: animation.duration,
                  curve: animation.curve,
                  child: this,
                );
              },
            )
          : ConstrainedBox(
              key: key,
              constraints: BoxConstraints.tightFor(width: width),
              child: this,
            );

  Widget height(
    double height, {
    Key? key,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              key: key,
              builder: (animation) {
                return _AnimatedConstrainedBox(
                  constraints: BoxConstraints.tightFor(height: height),
                  duration: animation.duration,
                  curve: animation.curve,
                  child: this,
                );
              },
            )
          : ConstrainedBox(
              key: key,
              constraints: BoxConstraints.tightFor(height: height),
              child: this,
            );

  Widget square(
    double dimension, {
    Key? key,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              key: key,
              builder: (animation) {
                return _AnimatedConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    width: dimension,
                    height: dimension,
                  ),
                  duration: animation.duration,
                  curve: animation.curve,
                  child: this,
                );
              },
            )
          : ConstrainedBox(
              key: key,
              constraints: BoxConstraints.tightFor(
                width: dimension,
                height: dimension,
              ),
              child: this,
            );

  // TODO: FEATURE: ripple animation
  Widget ripple({
    Key? key,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    InteractiveInkFeatureFactory? splashFactory,
    double? radius,
    ShapeBorder? customBorder,
    bool enableFeedback = true,
    bool excludeFromSemantics = false,
    FocusNode? focusNode,
    bool canRequestFocus = true,
    bool autoFocus = false,
    bool enable = true,
  }) =>
      enable
          ? Builder(
              key: key,
              builder: (BuildContext context) {
                // TODO: PERFORMANCE: findAncestorWidgetOfExactType vs InheritedWidget performance
                final GestureDetector? gestures =
                    context.findAncestorWidgetOfExactType<GestureDetector>();
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: focusColor,
                    hoverColor: hoverColor,
                    highlightColor: highlightColor,
                    splashColor: splashColor,
                    splashFactory: splashFactory,
                    radius: radius,
                    customBorder: customBorder,
                    enableFeedback: enableFeedback,
                    excludeFromSemantics: excludeFromSemantics,
                    focusNode: focusNode,
                    canRequestFocus: canRequestFocus,
                    autofocus: autoFocus,
                    onTap: gestures?.onTap,
                    child: this,
                  ),
                );
              },
            )
          : Builder(
              key: key,
              builder: (context) => this,
            );

  // TODO: RotatedBox
  Widget rotate({
    Key? key,
    required double angle,
    Offset? origin,
    AlignmentGeometry alignment = Alignment.center,
    bool transformHitTests = true,
    FilterQuality? filterQuality,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              key: key,
              builder: (animation) {
                return _AnimatedTransform(
                  transform: Matrix4.rotationZ(angle),
                  alignment: alignment,
                  origin: origin,
                  transformHitTests: transformHitTests,
                  filterQuality: filterQuality,
                  duration: animation.duration,
                  curve: animation.curve,
                  child: this,
                );
              },
            )
          : Transform.rotate(
              key: key,
              angle: angle,
              alignment: alignment,
              origin: origin,
              transformHitTests: transformHitTests,
              filterQuality: filterQuality,
              child: this,
            );

  Widget scale({
    Key? key,
    double? all,
    double? x,
    double? y,
    Offset? origin,
    AlignmentGeometry alignment = Alignment.center,
    bool transformHitTests = true,
    FilterQuality? filterQuality,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              key: key,
              builder: (animation) {
                return _AnimatedTransform(
                  transform: Matrix4.diagonal3Values(
                    x ?? all ?? 0,
                    y ?? all ?? 0,
                    1.0,
                  ),
                  alignment: alignment,
                  transformHitTests: transformHitTests,
                  filterQuality: filterQuality,
                  duration: animation.duration,
                  curve: animation.curve,
                  child: this,
                );
              },
            )
          : Transform(
              key: key,
              transform:
                  Matrix4.diagonal3Values(x ?? all ?? 0, y ?? all ?? 0, 1.0),
              alignment: alignment,
              origin: origin,
              transformHitTests: transformHitTests,
              filterQuality: filterQuality,
              child: this,
            );

  Widget translate({
    Key? key,
    required Offset offset,
    bool transformHitTests = true,
    FilterQuality? filterQuality,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              key: key,
              builder: (animation) {
                return _AnimatedTransform(
                  transform:
                      Matrix4.translationValues(offset.dx, offset.dy, 0.0),
                  transformHitTests: transformHitTests,
                  filterQuality: filterQuality,
                  duration: animation.duration,
                  curve: animation.curve,
                  child: this,
                );
              },
            )
          : Transform.translate(
              key: key,
              offset: offset,
              transformHitTests: transformHitTests,
              filterQuality: filterQuality,
              child: this,
            );

  Widget transform({
    Key? key,
    required Matrix4 transform,
    Offset? origin,
    AlignmentGeometry? alignment,
    bool transformHitTests = true,
    FilterQuality? filterQuality,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              key: key,
              builder: (animation) {
                return _AnimatedTransform(
                  transform: transform,
                  origin: origin,
                  alignment: alignment,
                  transformHitTests: transformHitTests,
                  filterQuality: filterQuality,
                  duration: animation.duration,
                  curve: animation.curve,
                  child: this,
                );
              },
            )
          : Transform(
              key: key,
              transform: transform,
              alignment: alignment,
              origin: origin,
              transformHitTests: transformHitTests,
              filterQuality: filterQuality,
              child: this,
            );

  Widget overflow({
    Key? key,
    AlignmentGeometry alignment = Alignment.center,
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
    OverflowBoxFit fit = OverflowBoxFit.max,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              key: key,
              builder: (animation) {
                return _AnimatedOverflowBox(
                  alignment: alignment,
                  minWidth: minWidth,
                  maxWidth: minWidth,
                  minHeight: minHeight,
                  maxHeight: maxHeight,
                  fit: fit,
                  duration: animation.duration,
                  curve: animation.curve,
                  child: this,
                );
              },
            )
          : OverflowBox(
              key: key,
              alignment: alignment,
              minWidth: minWidth,
              maxWidth: minWidth,
              minHeight: minHeight,
              maxHeight: maxHeight,
              fit: fit,
              child: this,
            );

  Widget overflowFixedChild({
    Key? key,
    AlignmentGeometry alignment = Alignment.center,
    double? width,
    double? height,
    bool animate = false,
  }) =>
      overflow(
        key: key,
        alignment: alignment,
        minWidth: width,
        maxWidth: width,
        minHeight: height,
        maxHeight: height,
        fit: OverflowBoxFit.deferToChild,
        animate: animate,
      );

  Widget scrollable({
    Key? key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    bool? primary,
    ScrollPhysics? physics,
    ScrollController? controller,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    EdgeInsetsGeometry? padding,
    Clip clipBehavior = Clip.hardEdge,
    HitTestBehavior hitTestBehavior = HitTestBehavior.opaque,
    String? restorationId,
    ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior,
  }) =>
      SingleChildScrollView(
        key: key,
        scrollDirection: scrollDirection,
        reverse: reverse,
        primary: primary,
        physics: physics,
        controller: controller,
        dragStartBehavior: dragStartBehavior,
        padding: padding,
        clipBehavior: clipBehavior,
        hitTestBehavior: hitTestBehavior,
        restorationId: restorationId,
        keyboardDismissBehavior: keyboardDismissBehavior,
        child: this,
      );

  Widget expanded({
    Key? key,
    int flex = 1,
  }) =>
      Expanded(
        key: key,
        flex: flex,
        child: this,
      );

  Widget flexible({
    Key? key,
    int flex = 1,
    FlexFit fit = FlexFit.loose,
  }) =>
      Flexible(
        key: key,
        flex: flex,
        fit: fit,
        child: this,
      );

  Widget positioned({
    Key? key,
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              key: key,
              builder: (animation) {
                return AnimatedPositioned(
                  duration: animation.duration,
                  curve: animation.curve,
                  left: left,
                  top: top,
                  right: right,
                  bottom: bottom,
                  width: width,
                  height: height,
                  child: this,
                );
              },
            )
          : Positioned(
              key: key,
              left: left,
              top: top,
              right: right,
              bottom: bottom,
              width: width,
              height: height,
              child: this,
            );

  Widget positionedDirectional({
    Key? key,
    double? start,
    double? end,
    double? top,
    double? bottom,
    double? width,
    double? height,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              key: key,
              builder: (animation) {
                return AnimatedPositionedDirectional(
                  duration: animation.duration,
                  curve: animation.curve,
                  start: start,
                  end: end,
                  top: top,
                  bottom: bottom,
                  width: width,
                  height: height,
                  child: this,
                );
              },
            )
          : PositionedDirectional(
              key: key,
              start: start,
              end: end,
              top: top,
              bottom: bottom,
              width: width,
              height: height,
              child: this,
            );

  Widget positionedFill({
    Key? key,
    double? left = 0,
    double? top = 0,
    double? right = 0,
    double? bottom = 0,
    bool animate = false,
  }) =>
      positioned(
        key: key,
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        animate: animate,
      );

  Widget safeArea({
    Key? key,
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
    EdgeInsets minimum = EdgeInsets.zero,
    bool maintainBottomViewPadding = false,
  }) =>
      SafeArea(
        key: key,
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        minimum: minimum,
        maintainBottomViewPadding: maintainBottomViewPadding,
        child: this,
      );

  Widget semanticsLabel(
    String label, {
    Key? key,
  }) =>
      Semantics.fromProperties(
        key: key,
        properties: SemanticsProperties(label: label),
        child: this,
      );

  Widget gestures({
    Key? key,
    GestureOnTapChangeCallback? onTapChange,
    GestureTapDownCallback? onTapDown,
    GestureTapUpCallback? onTapUp,
    GestureTapCallback? onTap,
    GestureTapCancelCallback? onTapCancel,
    GestureTapDownCallback? onSecondaryTapDown,
    GestureTapUpCallback? onSecondaryTapUp,
    GestureTapCancelCallback? onSecondaryTapCancel,
    GestureTapCallback? onDoubleTap,
    GestureLongPressCallback? onLongPress,
    GestureLongPressStartCallback? onLongPressStart,
    GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate,
    GestureLongPressUpCallback? onLongPressUp,
    GestureLongPressEndCallback? onLongPressEnd,
    GestureDragDownCallback? onVerticalDragDown,
    GestureDragStartCallback? onVerticalDragStart,
    GestureDragUpdateCallback? onVerticalDragUpdate,
    GestureDragEndCallback? onVerticalDragEnd,
    GestureDragCancelCallback? onVerticalDragCancel,
    GestureDragDownCallback? onHorizontalDragDown,
    GestureDragStartCallback? onHorizontalDragStart,
    GestureDragUpdateCallback? onHorizontalDragUpdate,
    GestureDragEndCallback? onHorizontalDragEnd,
    GestureDragCancelCallback? onHorizontalDragCancel,
    GestureDragDownCallback? onPanDown,
    GestureDragStartCallback? onPanStart,
    GestureDragUpdateCallback? onPanUpdate,
    GestureDragEndCallback? onPanEnd,
    GestureDragCancelCallback? onPanCancel,
    GestureScaleStartCallback? onScaleStart,
    GestureScaleUpdateCallback? onScaleUpdate,
    GestureScaleEndCallback? onScaleEnd,
    GestureForcePressStartCallback? onForcePressStart,
    GestureForcePressPeakCallback? onForcePressPeak,
    GestureForcePressUpdateCallback? onForcePressUpdate,
    GestureForcePressEndCallback? onForcePressEnd,
    HitTestBehavior? behavior,
    bool excludeFromSemantics = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) =>
      GestureDetector(
        key: key,
        onTapDown: (TapDownDetails tapDownDetails) {
          if (onTapDown != null) onTapDown(tapDownDetails);
          if (onTapChange != null) onTapChange(true);
        },
        onTapCancel: () {
          if (onTapCancel != null) onTapCancel();
          if (onTapChange != null) onTapChange(false);
        },
        onTap: () {
          if (onTap != null) onTap();
          if (onTapChange != null) onTapChange(false);
        },
        onTapUp: onTapUp,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        onLongPressStart: onLongPressStart,
        onLongPressEnd: onLongPressEnd,
        onLongPressMoveUpdate: onLongPressMoveUpdate,
        onLongPressUp: onLongPressUp,
        onVerticalDragStart: onVerticalDragStart,
        onVerticalDragEnd: onVerticalDragEnd,
        onVerticalDragDown: onVerticalDragDown,
        onVerticalDragCancel: onVerticalDragCancel,
        onVerticalDragUpdate: onVerticalDragUpdate,
        onHorizontalDragStart: onHorizontalDragStart,
        onHorizontalDragEnd: onHorizontalDragEnd,
        onHorizontalDragCancel: onHorizontalDragCancel,
        onHorizontalDragUpdate: onHorizontalDragUpdate,
        onHorizontalDragDown: onHorizontalDragDown,
        onForcePressStart: onForcePressStart,
        onForcePressEnd: onForcePressEnd,
        onForcePressPeak: onForcePressPeak,
        onForcePressUpdate: onForcePressUpdate,
        onPanStart: onPanStart,
        onPanEnd: onPanEnd,
        onPanCancel: onPanCancel,
        onPanDown: onPanDown,
        onPanUpdate: onPanUpdate,
        onScaleStart: onScaleStart,
        onScaleEnd: onScaleEnd,
        onScaleUpdate: onScaleUpdate,
        behavior: behavior,
        excludeFromSemantics: excludeFromSemantics,
        dragStartBehavior: dragStartBehavior,
        child: this,
      );

  // TODO: FEATURE: animate aspectRatio widget
  Widget aspectRatio(
    double aspectRatio, {
    Key? key,
  }) =>
      AspectRatio(
        key: key,
        aspectRatio: aspectRatio,
        child: this,
      );

  // TODO: FEATURE: animate center widget
  Widget center({
    Key? key,
    double? widthFactor,
    double? heightFactor,
  }) =>
      Center(
        key: key,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        child: this,
      );

  // TODO: FEATURE: animate fittedBox
  Widget fittedBox({
    Key? key,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    Clip clipBehavior = Clip.none,
  }) =>
      FittedBox(
        key: key,
        fit: fit,
        alignment: alignment,
        clipBehavior: clipBehavior,
        child: this,
      );

  // TODO: FEATURE: animate FractionallySizedBox
  Widget fractionallySizedBox({
    Key? key,
    AlignmentGeometry alignment = Alignment.center,
    double? widthFactor,
    double? heightFactor,
  }) =>
      FractionallySizedBox(
        key: key,
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        child: this,
      );

  // TODO: FEATURE: animate card
  Widget card({
    Key? key,
    Color? color,
    Color? shadowColor,
    Color? surfaceTintColor,
    double? elevation,
    ShapeBorder? shape,
    bool borderOnForeground = true,
    EdgeInsetsGeometry? margin,
    Clip? clipBehavior,
    bool semanticContainer = true,
  }) =>
      Card(
        key: key,
        color: color,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        elevation: elevation,
        shape: shape,
        borderOnForeground: borderOnForeground,
        margin: margin,
        clipBehavior: clipBehavior,
        semanticContainer: semanticContainer,
        child: this,
      );

  Widget limitedBox({
    Key? key,
    double maxWidth = double.infinity,
    double maxHeight = double.infinity,
  }) =>
      LimitedBox(
        key: key,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        child: this,
      );

  Widget material({
    Key? key,
    MaterialType type = MaterialType.canvas,
    double elevation = 0.0,
    Color? color,
    Color? shadowColor,
    Color? surfaceTintColor,
    TextStyle? textStyle,
    BorderRadiusGeometry? borderRadius,
    ShapeBorder? shape,
    bool borderOnForeground = true,
    Clip clipBehavior = Clip.none,
    Duration animationDuration = kThemeChangeDuration,
    bool animateColor = false,
  }) =>
      Material(
        key: key,
        type: type,
        elevation: elevation,
        color: color,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        textStyle: textStyle,
        borderRadius: borderRadius,
        shape: shape,
        borderOnForeground: borderOnForeground,
        clipBehavior: clipBehavior,
        animationDuration: animationDuration,
        animateColor: animateColor,
        child: this,
      );

  Widget mouseRegion({
    Key? key,
    void Function(PointerEnterEvent)? onEnter,
    void Function(PointerExitEvent)? onExit,
    void Function(PointerHoverEvent)? onHover,
    MouseCursor cursor = MouseCursor.defer,
    bool opaque = true,
    HitTestBehavior? hitTestBehavior,
  }) =>
      MouseRegion(
        key: key,
        onEnter: onEnter,
        onExit: onExit,
        onHover: onHover,
        cursor: cursor,
        opaque: opaque,
        hitTestBehavior: hitTestBehavior,
        child: this,
      );

  // DefaultTextStyle wrapper
  Widget textStyle({
    bool merge = true,
    TextStyle? style,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? overflow,
    int? maxLines,
    TextWidthBasis? textWidthBasis,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    style ??= TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
    return merge
        ? DefaultTextStyle.merge(
            style: style,
            textAlign: textAlign,
            softWrap: softWrap,
            overflow: overflow,
            maxLines: maxLines,
            textWidthBasis: textWidthBasis,
            child: this,
          )
        : DefaultTextStyle(
            style: style,
            textAlign: textAlign,
            softWrap: softWrap ?? true,
            overflow: overflow ?? TextOverflow.clip,
            maxLines: maxLines,
            textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
            child: this,
          );
  }

  Widget theme(
    ThemeData data, {
    Key? key,
  }) =>
      Theme(
        key: key,
        data: data,
        child: this,
      );

  Widget iconTheme({
    Key? key,
    IconThemeData? data,
    Color? color,
    double? size,
  }) =>
      IconTheme(
        key: key,
        data: data ?? IconThemeData(color: color, size: size),
        child: this,
      );

  Widget scrollbar({
    ScrollController? controller,
    bool? thumbVisibility,
    bool? trackVisibility,
    double? thickness,
    Radius? radius,
    ScrollNotificationPredicate? notificationPredicate,
    bool? interactive,
    ScrollbarOrientation? scrollbarOrientation,
    bool resetPadding = false,
  }) {
    final scrollbar = Scrollbar(
      controller: controller,
      thumbVisibility: thumbVisibility,
      trackVisibility: trackVisibility,
      thickness: thickness,
      radius: radius,
      notificationPredicate: notificationPredicate,
      interactive: interactive,
      scrollbarOrientation: scrollbarOrientation,
      child: this,
    );
    if (resetPadding) {
      return Builder(
        builder: (context) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(padding: EdgeInsets.zero),
            child: scrollbar,
          );
        },
      );
    } else {
      return scrollbar;
    }
  }

  Widget rotated({
    Key? key,
    required int quarterTurns,
  }) =>
      RotatedBox(
        key: key,
        quarterTurns: quarterTurns,
        child: this,
      );

  // shorthand for .decorated with max radius
  Widget rounded({
    Key? key,
    Color? color,
    DecorationImage? image,
    BoxBorder? border,
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    BoxShape shape = BoxShape.rectangle,
    DecorationPosition position = DecorationPosition.background,
    bool animate = false,
    double? radius,
  }) =>
      decorated(
        key: key,
        color: color,
        image: image,
        border: border,
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 9999),
        boxShadow: boxShadow,
        gradient: gradient,
        backgroundBlendMode: backgroundBlendMode,
        shape: shape,
        position: position,
        animate: animate,
      );

  Widget removePadding({
    Key? key,
    required BuildContext context,
    bool removeLeft = false,
    bool removeTop = false,
    bool removeRight = false,
    bool removeBottom = false,
  }) =>
      MediaQuery.removePadding(
        key: key,
        context: context,
        removeLeft: removeLeft,
        removeTop: removeTop,
        removeRight: removeRight,
        removeBottom: removeBottom,
        child: this,
      );

  Widget removePaddingVertical({
    Key? key,
    required BuildContext context,
  }) =>
      removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
      );

  Widget tappable({
    Key? key,
    GestureTapCallback? onTap,
    GestureTapCallback? onDoubleTap,
    GestureLongPressCallback? onLongPress,
    HitTestBehavior? behavior = HitTestBehavior.translucent,
  }) =>
      gestures(
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        behavior: behavior,
      );

  Widget onTap(
    GestureTapCallback? onTap, {
    Key? key,
    HitTestBehavior? behavior = HitTestBehavior.translucent,
  }) =>
      tappable(onTap: onTap, behavior: behavior);

  Widget tooltip({
    Key? key,
    String? message,
    InlineSpan? richMessage,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? verticalOffset,
    bool? preferBelow,
    bool? excludeFromSemantics,
    Decoration? decoration,
    TextStyle? textStyle,
    TextAlign? textAlign,
    Duration? waitDuration,
    Duration? showDuration,
    Duration? exitDuration,
    bool enableTapToDismiss = true,
    TooltipTriggerMode? triggerMode,
    bool? enableFeedback,
    void Function()? onTriggered,
    MouseCursor? mouseCursor,
    bool? ignorePointer,
  }) =>
      Tooltip(
        key: key,
        message: message,
        richMessage: richMessage,
        constraints: constraints,
        padding: padding,
        margin: margin,
        verticalOffset: verticalOffset,
        preferBelow: preferBelow,
        excludeFromSemantics: excludeFromSemantics,
        decoration: decoration,
        textStyle: textStyle,
        textAlign: textAlign,
        waitDuration: waitDuration,
        showDuration: showDuration,
        exitDuration: exitDuration,
        enableTapToDismiss: enableTapToDismiss,
        triggerMode: triggerMode,
        enableFeedback: enableFeedback,
        onTriggered: onTriggered,
        mouseCursor: mouseCursor,
        ignorePointer: ignorePointer,
        child: this,
      );

  Widget simpleTooltip(
    String? message, {
    Key? key,
    InlineSpan? richMessage,
    EdgeInsetsGeometry? padding =
        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    EdgeInsetsGeometry? margin = EdgeInsets.zero,
    bool preferBelow = false,
  }) =>
      Tooltip(
        key: key,
        message: message,
        richMessage: richMessage,
        preferBelow: preferBelow,
        padding: padding,
        margin: margin,
        child: this,
      );

  PreferredSize preferredSize({
    Key? key,
    Size? size,
    double? height,
    double? width,
  }) =>
      PreferredSize(
        key: key,
        preferredSize: size ??
            (height != null ? Size.fromHeight(height) : null) ??
            (width != null ? Size.fromWidth(width) : null) ??
            Size.zero,
        child: this,
      );

  Widget ignorePointer({
    Key? key,
    bool ignoring = true,
  }) =>
      IgnorePointer(
        key: key,
        ignoring: ignoring,
        child: this,
      );

  Widget absorbPointer({
    Key? key,
    bool absorbing = true,
  }) =>
      AbsorbPointer(
        key: key,
        absorbing: absorbing,
        child: this,
      );

  Widget repaintBoundary({Key? key}) => RepaintBoundary(
        key: key,
        child: this,
      );

  Widget intrinsicHeight({Key? key}) => IntrinsicHeight(
        key: key,
        child: this,
      );

  Widget intrinsicWidth({
    Key? key,
    double? stepWidth,
    double? stepHeight,
  }) =>
      IntrinsicWidth(
        key: key,
        stepWidth: stepWidth,
        stepHeight: stepHeight,
        child: this,
      );
}

extension SliverExt on Widget {
  Widget toSliver({Key? key}) => SliverToBoxAdapter(key: key, child: this);

  Widget toSliverFillRemaining({
    Key? key,
    bool hasScrollBody = true,
    bool fillOverscroll = false,
  }) =>
      SliverFillRemaining(
        key: key,
        hasScrollBody: hasScrollBody,
        fillOverscroll: fillOverscroll,
        child: this,
      );

  Widget sliverPadding({
    Key? key,
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
    EdgeInsetsGeometry? padding,
  }) {
    padding ??= EdgeInsets.only(
      top: top ?? vertical ?? all ?? 0.0,
      bottom: bottom ?? vertical ?? all ?? 0.0,
      left: left ?? horizontal ?? all ?? 0.0,
      right: right ?? horizontal ?? all ?? 0.0,
    );

    return SliverPadding(key: key, padding: padding, sliver: this);
  }

  Widget sliverIgnorePointer({
    Key? key,
    bool ignoring = true,
  }) =>
      SliverIgnorePointer(
        key: key,
        ignoring: ignoring,
        sliver: this,
      );
}
