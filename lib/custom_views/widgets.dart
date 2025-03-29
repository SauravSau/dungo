
import '../dungo.dart';


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