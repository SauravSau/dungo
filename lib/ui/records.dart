import '../dungo.dart';

class Records extends StatefulWidget {
  const Records({super.key});

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {

  final List<RecordsStructure> _dataList = [];

  @override
  void initState() {
    _dataList.add(RecordsStructure('CASH', 'EXP', '111111', 'Shopping', 200));
    _dataList.add(RecordsStructure('CASH', 'EXP', '111111', 'Gifts', 230.50));
    _dataList.add(RecordsStructure('CASH', 'EXP', '111111', 'Food', 344.45));
    _dataList.add(RecordsStructure('BANK', 'EXP', '111111', 'Shopping', 498.50));
    _dataList.add(RecordsStructure('CARD', 'EXP', '111111', 'Recharge', 710));
    _dataList.add(RecordsStructure('CASH', 'EXP', '111111', 'Gifts', 230.50));
    _dataList.add(RecordsStructure('CASH', 'EXP', '111111', 'Gifts', 230.50));
    _dataList.add(RecordsStructure('CASH', 'EXP', '111111', 'Gifts', 230.50));
    _dataList.add(RecordsStructure('CASH', 'EXP', '111111', 'Gifts', 230.50));
    _dataList.add(RecordsStructure('CASH', 'EXP', '111111', 'Gifts', 230.50));
    _dataList.add(RecordsStructure('CASH', 'EXP', '111111', 'Gifts', 230.50));
    _dataList.add(RecordsStructure('CASH', 'EXP', '111111', 'Gifts', 230.50));
    _dataList.add(RecordsStructure('CASH', 'EXP', '111111', 'Gifts', 230.50));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: dp8),
        Row(
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
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: _dataList.length,
            padding: EdgeInsets.only(left: dp10, right: dp12, top: dp24),
            separatorBuilder: (context, index)=>SizedBox(height: dp36),
            itemBuilder: (context, index){
              RecordsStructure item = _dataList[index];
              return Row(
                children: [
                  Container(
                    width: dp48,
                    height: dp48,
                    decoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    alignment: Alignment.center,
                    child: TextView(item.category[0], medium, sp16, bgcolor_primary),
                  ),
                  SizedBox(width: dp20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextView(item.category, semibold, sp20, textcolor_primary),
                        TextView(item.accountType.toLowerCase(), regular, sp12, textcolor_primary),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextView('\$${item.amount}', semibold, sp20, textcolor_primary),
                      TextView('32%', regular, sp12, textcolor_primary),
                    ]
                  )
                ]
              );
            }
          ),
        )
      ]
    );
  }
}

class RecordsStructure{
  String accountType; //Cash/Credit
  String paymentType; //Ex/Inc
  String timeStamp;
  String category;  //Shopping/Food
  num amount;
  RecordsStructure(this.accountType, this.paymentType, this.timeStamp, this.category, this.amount);
}
