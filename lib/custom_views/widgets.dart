
import '../dungo.dart';

//Fonts
const bold = 'bold';
const semibold = 'semibold';
const medium = 'medium';
const regular = 'regular';

class AppTheme extends StatelessWidget {
  final Widget child;
  bool? safeArea;
  final EdgeInsetsGeometry? padding;

  AppTheme({super.key, required this.child,this.safeArea,this.padding});

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
            color: Colors.white,
            height: double.infinity,
            width: double.infinity,
            padding: padding??EdgeInsets.only(top: Platform.isAndroid?dp24:dp30),
            child: child
        )
    );
  }
}

class TextView extends StatelessWidget {
  dynamic text;
  String font;
  double fontSize;
  Color color;
  final Color? backgroundColor;
  final Color? decorationColor;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  TextOverflow? overflow;
  int? maxLines;
  bool fittedLine;
  TextView(this.text,this.font,this.fontSize,this.color,{
    super.key,
    this.textDecoration,
    this.overflow,
    this.maxLines,
    this.backgroundColor,
    this.decorationColor,
    this.textAlign = TextAlign.left,
    this.fittedLine = false
  });
  @override
  Widget build(BuildContext context) {
    // double unitHeightValue = MediaQuery.of(context).size.height * 0.0011;
    return fittedLine?
    FittedBox(
        fit: BoxFit.contain,
        child: child()
    ):child();
  }

  Widget child(){
    return Text('$text',
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        style: TextStyle(
            decoration: textDecoration,
            fontFamily: font,
            //fontWeight: FontWeight.w600,
            fontSize: fontSize/**unitHeightValue*/,
            color: color,
            decorationColor: decorationColor,
            backgroundColor: backgroundColor
        )
    );
  }
}

class Layout extends StatelessWidget {
  final Widget child;
  double? height;
  double? width;
  double blurRadius;
  double yOffset;
  Color? background;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final BorderRadiusGeometry? borderRadius;
  Layout({super.key,
    required this.child,
    this.borderRadius,
    this.height,
    this.width,
    this.blurRadius=16.0,
    this.yOffset=1,
    this.background,
    this.padding,
    this.margin,
    this.alignment
  }) :  assert(margin == null || margin.isNonNegative),
        assert(padding == null || padding.isNonNegative);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        alignment: alignment,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
            color: background??bgcolor_secondary,
            borderRadius: borderRadius,
            boxShadow: [
              BoxShadow(
                  color: shadow_color,
                  blurRadius: blurRadius,
                  offset: Offset(1,yOffset)
              )
            ]
        ),
        child: child
    );
  }
}