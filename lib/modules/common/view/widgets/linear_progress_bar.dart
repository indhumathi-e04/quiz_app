library circular_slider;

import 'dart:math' as math;

import 'package:flutter/material.dart';

enum MultiCircularSliderType {
  // to create a linear progress bar
  linear,
  // to create a circular progress bar
  circular,
}

class MultiCircularSlider extends StatefulWidget {
  final double size;
  final MultiCircularSliderType progressBarType;
  final double trackWidth;
  final double progressBarWidth;
  final List<double> values;
  final List<Color> colors;
  final Color trackColor;
  final Duration animationDuration;
  final Curve animationCurve;
  final Widget? innerWidget;
  final Widget? innerIcon;
  final bool showTotalPercentage;
  final String? label;
  final TextStyle? percentageTextStyle;
  final TextStyle? labelTextStyle;

  ///A widget to make multiple progress bar to show
  ///multiple values in a single bar
  ///
  ///For example to show storage space taken up by different types of files in File Manager
  ///
  ///
  ///`values` pass different percentages you want to show which sum up to 1.0 or less
  ///
  ///
  ///
  ///`colors` different colors which you want to give to the progress bars
  ///
  ///NOTE : Length of values should be equal to length of colors
  ///
  ///
  ///
  ///`size` the space widget should take up on screen
  ///
  ///
  ///`progressBarType` the type of progress bar you want to show
  ///
  ///
  ///`trackWidth` stroke width of the progressBar track
  ///
  ///default values is set to 32.0
  ///
  ///
  ///
  ///`progressBarWidth` stroke width of the progressBar
  ///
  ///default values is set to 32.0
  ///
  ///
  ///`trackColor` color of the track of progressBar
  ///
  ///default values is set to Colors.grey
  ///
  ///
  ///
  ///
  ///`animationDuration` the duration you want for the animation
  ///
  ///default values is set to 1000 milliseconds
  ///
  ///
  ///
  ///`animationCurve` the curve you want for animation
  ///
  ///default values is set to Curves.easeInOutCubic
  ///
  ///
  ///
  ///`innerWidget` the widget you want to show inside the circular progress bar
  ///
  ///NOTE : innerWidget will only de displayed if showTotalPercentage is false
  ///
  ///
  ///
  ///`innerIcon` the icon which you can display above the total percentage text
  ///
  ///
  ///
  ///`showTotalPercentage` whether to show total percentage in center or not
  ///
  ///default values is set to true
  ///
  ///
  ///
  ///`label` any label text which you want to show below total percentage
  ///
  ///
  ///
  ///`labelTextStyle` TextStyle which you want to give to label
  ///
  ///
  ///
  ///`percentageTextStyle` TextStyle which you want to give to percentage
  ///
  const MultiCircularSlider({
    Key? key,
    required this.values,
    required this.colors,
    required this.size,
    required this.progressBarType,
    this.trackWidth = 32.0,
    this.progressBarWidth = 32.0,
    this.trackColor = Colors.grey,
    this.animationDuration = const Duration(milliseconds: 1000),
    this.animationCurve = Curves.easeInOutCubic,
    this.innerWidget,
    this.innerIcon,
    this.showTotalPercentage = true,
    this.label,
    this.labelTextStyle,
    this.percentageTextStyle,
  }) : super(key: key);

  @override
  MultiCircularSliderState createState() => MultiCircularSliderState();
}

class MultiCircularSliderState extends State<MultiCircularSlider>
    with SingleTickerProviderStateMixin {
  //for animation
  late AnimationController _controller;
  late Animation<double> _animation;

  //for calculation
  double percentage = 0.0;

  @override
  void initState() {
    super.initState();

    //calculating total percentage
    for (final value in widget.values) {
      percentage += value;
    }

    //initializing controller
    _controller =
        AnimationController(vsync: this, duration: widget.animationDuration);

    //initializing animation
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _controller, curve: widget.animationCurve),
    );

    //starting animation
    _controller.forward();
  }

  @override
  void dispose() {
    //dispose controller to avoid memory leaks
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //actual widget starts here
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        //custom painter to draw multiple progress bar
        return widget.progressBarType == MultiCircularSliderType.circular
            ? _buildCircularProgressBar()
            : _buildLinearProgressBar();
      },
      child: widget.innerWidget ?? const SizedBox.shrink(),
    );
  }

  /// Builder Functions
  ///
  ///
  Widget _buildCircularProgressBar() => CustomPaint(
        painter: _buildProgressBarPainter(),
        //inner widget with shadow
        child: Container(
          height: widget.size,
          width: widget.size,
          padding: const EdgeInsets.all(42.0),
          child: widget.innerWidget ??
              Container(
                padding: const EdgeInsets.all(32.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      blurRadius: 10.0,
                      offset: const Offset(0.0, -18.0),
                    ),
                  ],
                ),
                child: widget.showTotalPercentage
                    ? Column(
                        children: [
                          //inner icon
                          _buildInnerIcon(),
                          //total percentage
                          _buildTotalPercentage(),
                          //spacing
                          const SizedBox(height: 8.0),
                          //text
                          _buildTextWidget(),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
        ),
      );

  Widget _buildLinearProgressBar() => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // inner widget
          widget.innerWidget ?? const SizedBox.shrink(),
          // total percentage
          widget.showTotalPercentage
              ? Column(
                  children: [
                    //inner icon
                    _buildInnerIcon(),
                    //total percentage
                    _buildTotalPercentage(),
                    //spacing
                    const SizedBox(height: 8.0),
                    //text
                    _buildTextWidget(),
                  ],
                )
              : const SizedBox.shrink(),
          // linear progress bar
          CustomPaint(
            painter: _buildProgressBarPainter(),
            size: Size(widget.size, 0),
          ),
        ],
      );

  CustomPainter _buildProgressBarPainter() =>
      widget.progressBarType == MultiCircularSliderType.circular
          ? CircularProgressBarPainter(
              size: widget.size,
              values: List.generate(
                widget.values.length,
                (index) => widget.values[index] * _animation.value,
              ),
              colors: widget.colors,
              progressBarWidth: widget.progressBarWidth,
              trackColor: widget.trackColor,
              trackWidth: widget.trackWidth,
            )
          : LinearProgressBarPainter(
              size: widget.size,
              values: List.generate(
                widget.values.length,
                (index) => widget.values[index] * _animation.value,
              ),
              colors: widget.colors,
              progressBarWidth: widget.progressBarWidth,
              trackColor: widget.trackColor,
              trackWidth: widget.trackWidth,
            );

  Widget _buildInnerIcon() => widget.innerIcon ?? const SizedBox.shrink();

  Widget _buildTotalPercentage() => Text(
        '${(percentage * _animation.value * 100).ceil()}%',
        textAlign: TextAlign.center,
        style: widget.percentageTextStyle ??
            const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 28.0,
              color: Color(0xFF012C61),
            ),
      );

  Widget _buildTextWidget() => widget.label != null
      ? FittedBox(
          child: Text(
            widget.label!,
            style: widget.labelTextStyle ??
                const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22.0,
                  color: Color(0xFF939AA4),
                ),
          ),
        )
      : const SizedBox.shrink();
}

/// CustomPainter class to draw progress bar curves
class CircularProgressBarPainter extends CustomPainter {
  //size of the widget
  final double size;

  //width of the track
  final double trackWidth;

  //width of the progressbar
  final double progressBarWidth;

  //list of total values
  final List<double> values;

  //list of colors
  final List<Color> colors;

  //color of track
  final Color trackColor;

  //constructor
  CircularProgressBarPainter({
    required this.size,
    this.trackWidth = 32.0,
    this.progressBarWidth = 32.0,
    required this.values,
    required this.colors,
    this.trackColor = Colors.grey,
  });

  @override
  void paint(Canvas canvas, Size size) {
    //base angle of curve
    const double baseAngle = 180.0;
    //actual starting angle of arc
    final double startAngle = degreeToRadians(baseAngle);
    //total length of the track of progressbar
    final double trackSweepAngle = degreeToRadians(baseAngle);

    //shadow paint
    final shadowPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..color = Colors.black.withOpacity(0.1)
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        10.0,
      )
      ..strokeWidth = trackWidth;
    //draw shadow
    drawCurve(
      canvas,
      size,
      startAngle,
      trackSweepAngle,
      shadowPaint,
    );

    //progress bar track paint
    final trackPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..color = trackColor
      ..strokeWidth = trackWidth;
    //progress bar track curve
    drawCurve(
      canvas,
      size,
      startAngle,
      trackSweepAngle,
      trackPaint,
    );

    //length of list
    int length = values.length;
    double totalPercentage = 0.0;

    //to store values in reverse order
    List<CircularShader> progressBars = [];

    //iterating through list for calculating values
    for (int i = 0; i < length; i++) {
      double percentage = baseAngle * values[i];
      totalPercentage += percentage;
      double sweepAngle = degreeToRadians(totalPercentage);

      //progress bar paint
      final progressBarPaint = Paint()
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..color = colors[i]
        ..strokeWidth = trackWidth;

      //adding values to list
      progressBars.insert(
        0,
        CircularShader(
          startAngle: startAngle,
          sweepAngle: sweepAngle,
          paint: progressBarPaint,
        ),
      );
    }

    //drawing actual progress bars
    for (final progressBar in progressBars) {
      drawCurve(
        canvas,
        size,
        progressBar.startAngle,
        progressBar.sweepAngle,
        progressBar.paint,
      );
    }
  }

  ///[Logic for drawing curve]
  drawCurve(
    Canvas canvas,
    Size size,
    double startAngle,
    double sweepAngle,
    Paint paint,
  ) {
    double radius = size.width / 2;
    Offset center = Offset(
      size.width / 2,
      size.height / 2,
    );

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  ///[Logic for converting degree to radians]
  degreeToRadians(double degree) {
    return degree * (math.pi / 180);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

/// class for storing values of the ProgressBar
class CircularShader {
  final double startAngle;
  final double sweepAngle;
  final Paint paint;

  CircularShader({
    required this.startAngle,
    required this.sweepAngle,
    required this.paint,
  });
}

/// CustomPainter class to draw linear progress bar
class LinearProgressBarPainter extends CustomPainter {
  //size of the widget
  final double size;

  //width of the track
  final double trackWidth;

  //width of the progressbar
  final double progressBarWidth;

  //list of total values
  final List<double> values;

  //list of colors
  final List<Color> colors;

  //color of track
  final Color trackColor;

  //constructor
  LinearProgressBarPainter({
    required this.size,
    this.trackWidth = 32.0,
    this.progressBarWidth = 32.0,
    required this.values,
    required this.colors,
    this.trackColor = Colors.grey,
  });

  @override
  void paint(Canvas canvas, Size size) {
    //shadow paint
    final shadowPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..color = Colors.black.withOpacity(0.1)
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        10.0,
      )
      ..strokeWidth = trackWidth;

    //draw shadow
    canvas.drawLine(
      const Offset(0, 0),
      Offset(size.width, 0),
      shadowPaint,
    );

    //progress bar track paint
    final trackPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..color = trackColor
      ..strokeWidth = trackWidth;

    //draw progrwss bar track
    canvas.drawLine(
      const Offset(0, 0),
      Offset(size.width, 0),
      trackPaint,
    );

    //length of list
    int length = values.length;
    double totalPercentage = 0.0;

    //to store values in reverse order
    List<LinearShader> progressBarsPainters = [];

    //iterating through list for calculating values
    for (int i = 0; i < length; i++) {
      totalPercentage += values[i];

      //progress bar paint
      final progressBarPaint = Paint()
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..color = colors[i]
        ..strokeWidth = trackWidth;

      //adding values to list
      progressBarsPainters.insert(
        0,
        LinearShader(
          width: size.width * totalPercentage,
          paint: progressBarPaint,
        ),
      );
    }

    //drawing actual progress bars
    for (final progressBarPaint in progressBarsPainters) {
      canvas.drawLine(
        const Offset(0, 0),
        Offset(progressBarPaint.width, 0),
        progressBarPaint.paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

/// class for storing values of the ProgressBar
class LinearShader {
  final double width;
  final Paint paint;

  LinearShader({
    required this.width,
    required this.paint,
  });
}
