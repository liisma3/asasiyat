import 'package:asasiyat/constants/data_helper.dart';

class Category {
  late final String title;
  late final List<Map<String, dynamic>> souraNameNb;
  late final bool? selected = false;
  Category({required this.title, required this.souraNameNb});
}

void main(List<String> args) {
  List catTitle = DataHelper.CategoryLabel.keys.toList();
  print(catTitle);
}
