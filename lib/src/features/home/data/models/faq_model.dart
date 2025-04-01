/// question : "Neftebazalar qanday turlarga bo‘linadi?"
/// answer : "<p>Barcha neft bazalar quyidagi turlarga bo&lsquo;linadi: tushirib-ortuvchi, tushirib-ortish-taqsimlovchi, taqsimlovchi; Transportirovka qilish bo&lsquo;yicha - quvur uzatgichlar, temir yo&lsquo;llar, suv yo&lsquo;li orqali, suv yo&lsquo;li &ndash; temir yo&lsquo;l orqali, neft mahsulotlarini qabul qilish avtomobil transporti yoki daryo transporti orqali.</p>"

class FaqModel {
  FaqModel({
      this.question, 
      this.answer,});

  FaqModel.fromJson(dynamic json) {
    question = json['question'];
    answer = json['answer'];
  }
  String? question;
  String? answer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['question'] = question;
    map['answer'] = answer;
    return map;
  }

}