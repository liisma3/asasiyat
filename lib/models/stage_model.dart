import 'package:get/get.dart';

class Ayah {
  late final int order;
  late final String text;
  late final int juz;
  late final String? slice;
  Ayah(
      {required this.juz, required this.order, this.slice, required this.text});
  Map<String, dynamic>? toMap() {
    return <String, dynamic>{
      "juz": juz,
      "order": order,
      "text": text,
    };
  }
}



class Stage {
  late final String souraName;
  late final int souraNb;
  late final int grid;
  late final List<Ayah> ayahs;

  Stage({required this.souraName, required this.souraNb, required this.grid});
  Stage.initStage(){
    this.souraName="".obs as String;
    this.souraNb=0.obs as int;
    this.grid= 0.obs as int;
  }
  Map<String, dynamic>? toMap() {
    return <String, dynamic>{
      "souraName": souraName,
      "souraNb": souraNb,
      "grid": grid,
      "ayas": ayahs
    };
  }

/*   String toJson() => json.encode(toMap);
   
  factory Stage.fromJson(String source) {
    return Stage.fromMap(json.decode(source) as Map<String, dynamic>);
  } */
}
