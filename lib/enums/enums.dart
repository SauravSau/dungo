import '../dungo.dart';

enum BottomMenus{
  RECORDS('Records','Watchlist',icon_rcords),
  ANALYSIS('Analysis','Order Book',icon_analysis),
  BUDGETS('Budgets','Scanners',icon_budgets),
  ACCOUNTS('Accounts','Portfolio',icon_account),
  CATEGORIES('Categories','Dashboard',icon_category);
  const BottomMenus(this.tag,this.name, this.icon);
  final String tag;
  final String name;
  final String icon;
}

enum Schiduling{
  DAY('Day',52),
  WEEK('Week',403),
  MONTH('Month',1612);
  const Schiduling(this.name, this.value);
  final String name;
  final num value;
}