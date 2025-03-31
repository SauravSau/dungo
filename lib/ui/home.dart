import 'dart:developer';
import 'package:dungo/ui/records.dart';
import '../dungo.dart';
import 'analysis.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _childScreen = BottomMenus.RECORDS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AppTheme(
            child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: dp10, right: dp10, top: dp24, bottom: dp10),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                              image: getImage(icon_menu),
                              height: dp20,
                              width: dp20,
                              color: textcolor_primary
                          ),
                          Column(
                              children: [
                                TextView('\$32,500.00', bold, sp18, textcolor_primary),
                                TextView('Total Balance', regular, sp12, textcolor_primary)
                              ]
                          ),
                          Image(
                              image: getImage(icon_bell),
                              height: dp22,
                              width: dp22,
                              color: textcolor_primary
                          )
                        ]
                    )
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: dp10, vertical: dp8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: Schiduling.values.map((element){
                        return Container(
                            height: dp85,
                            padding: EdgeInsets.symmetric(horizontal: dp36, vertical: dp10),
                            decoration: BoxDecoration(
                                color: bgcolor_secondary1,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: dp6),
                                  TextView(element.name, regular, sp14, textcolor_primary),
                                  TextView('\$${element.value}', semibold, sp18, textcolor_primary),
                                ]
                            )
                        );
                      }).toList(),
                    ),
                  ),
                  _childScreen == BottomMenus.RECORDS? Expanded(child: Records()) :
                  _childScreen == BottomMenus.ANALYSIS? Analysis() :
                  Container()
                ]
            )
        ),
        bottomNavigationBar: Layout(
          height: dp60+2,
          yOffset: blurOffSetBottom,
          blurRadius: 8.0,
          background: bgcolor_primary,
          alignment: Alignment.bottomCenter,
          child: Row(
            children: BottomMenus.values.map((element){
              return Expanded(
                  child: InkWell(
                      onTap: (){
                        if(_childScreen!=element){
                          _childScreen = element;
                          setState((){});
                        }
                        log('XX--> $element');
                      },
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(vertical: dp8),
                                margin: EdgeInsets.symmetric(horizontal: dp16),
                                width: double.infinity,
                                child: Image(
                                    image: getImage(element.icon),
                                    height: _childScreen==element?dp24:dp20,
                                    width: _childScreen==element?dp24:dp20,
                                    color: _childScreen==element?Colors.black:textcolor_primary
                                )
                            ),
                            SizedBox(height: dp2),
                            TextView(
                                element.tag,
                                _childScreen==element?
                                bold:
                                regular,
                                sp10,
                                _childScreen==element?textcolor_primary:textcolor_primary,
                                overflow: TextOverflow.ellipsis
                            ),
                            SizedBox(height: dp4),
                          ]
                      )
                  )
              );
            }).toList(),
          )
      )
    );
  }
}
