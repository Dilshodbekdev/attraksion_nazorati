/// avatar : "http://att.technocorp.uz/media/leadership/photo_2024-08-22_12-37-58.jpg"
/// first_name : "Abduvaqqos"
/// last_name : "Rafiqov"
/// father_name : "Vohidovich"
/// phone : "+998712442553"
/// position : "Sanoat, radiatsiya va yadro xavfsizligi qo‘mitasi raisi"
/// biography : "<p class=\"leading-8 font-normal\" data-pm-slice=\"1 1 []\">2024 yil iyun oyidan Vazirlar Mahkamasi huzuridagi Sanoat, radiatsiya va yadro xavfsizligi qo&lsquo;mitasi raisi.</p>"
/// functions : "<ul data-pm-slice=\"3 3 []\">\r\n<li>\r\n<p class=\"leading-8 font-normal\">Davlat qo&lsquo;mitasi faoliyatiga yakkaboshchilik asosida umumiy rahbarlikni amalga oshiradi hamda Sanoat xavfsizligi davlat qo&lsquo;mitasiga yuklangan vazifalar va funksiyalarning bajarilishi uchun shaxsan javob beradi;</p>\r\n</li>\r\n<li>\r\n<p class=\"leading-8 font-normal\">Zarurat bo&lsquo;lganda, Sanoat xavfsizligi davlat qo&lsquo;mitasining markaziy apparati tuzilmasiga xodimlarning belgilangan umumiy soni doirasida o&lsquo;zgartirishlar kiritadi, shtatlar jadvalini va xarajatlar smetasini tasdiqlaydi;</p>\r\n</li>\r\n<li>\r\n<p class=\"leading-8 font-normal\">Xalqaro tashkilotlar, Davlat qo&lsquo;mitasi vakolatiga kiruvchi masalalar bo&lsquo;yicha boshqa mamlakatlarning tegishli nazorat organlari bilan muloqot qilish uchun belgilangan tartibda xavfsiz o&lsquo;tkazish sohasida ishlarni, tog&lsquo;-kon nazorati, atom kuch va tadqiqot, nazorat sohasida xalqaro hamkorlikni amalga oshirish;</p>\r\n</li>\r\n<li>\r\n<p class=\"leading-8 font-normal\">Markaziy Osiyo uchun Kimyoviy, biologik, radiologik va yadroviy materiallar bo&lsquo;yicha ilg&lsquo;or tajriba markazlarining mintaqaviy kotibiyatiga rahbarlik qiladi.</p>\r\n</li>\r\n<li>\r\n<p class=\"leading-8 font-normal\">Xavfli ishlab chiqarish obyektlarini ishga va mahalliylashtirish va xavfli ishlab chiqarish obyektlarida avariyalar oqibatlarini bartaraf etish uchun harakatlar tashkilotning tayyor kuzatadi;</p>\r\n</li>\r\n<li>\r\n<p class=\"leading-8 font-normal\">Xavfli ishlab chiqarish obyektlarining sanoat xavfsizligi ekspertizasini tashkil qilish ustidan nazoratni amalga oshiradi;</p>\r\n</li>\r\n<li>\r\n<p class=\"leading-8 font-normal\">Davlat qo&lsquo;mitasining tarkibiy tuzilmalari va idoraviy mansub tashkilotlari to&lsquo;g&lsquo;risidagi nizomlarni (ustavlarni) belgilangan tartibda tasdiqlaydi, Harbiylashtirilgan kon-qutqarish qismi to&lsquo;g&lsquo;risidagi nizom bundan mustasno;</p>\r\n</li>\r\n<li>\r\n<p class=\"leading-8 font-normal\">Davlat qo&lsquo;mitasining tarkibiy bo&lsquo;linmalari xodimlarini hamda idoraviy mansub tashkilotlar rahbarlarini belgilangan tartibda lavozimga tayinlaydi va lavozimdan ozod qiladi;</p>\r\n</li>\r\n<li>\r\n<p class=\"leading-8 font-normal\">Sanoat xavfsizligi bo&lsquo;yicha Idoralararo kengashning xodimlari va vaziyatni boshqaradi va tasdiqlaydi;</p>\r\n</li>\r\n<li>\r\n<p class=\"leading-8 font-normal\">Davlat qo&lsquo;mitasi hay&rsquo;ati faoliyatining asosiy yo&lsquo;nalishlarini muvofiqlashtiradi;</p>\r\n</li>\r\n<li>\r\n<p class=\"leading-8 font-normal\">Davlat qo&lsquo;mitasining nomenklaturasiga kiritilgan lavozimlar uchun kadrlarni tanlash, joylashtirish, tayyorlash va qayta tayyorlash bo&lsquo;yicha ishlarning bajarilishini nazorat qiladi;</p>\r\n</li>\r\n<li>\r\n<p class=\"leading-8 font-normal\">O&lsquo;zbekiston Respublikasi Prezidentining farmonlari, qarorlari va farmoyishlarida, O&lsquo;zbekiston Respublikasi Vazirlar Mahkamasining qarorlari va farmoyishlarida belgilangan vazifalarni bajarish uchun ijro intizomini mustahkamlash bo&lsquo;yicha ishlarning bajarilishini nazorat qiladi, Davlat qo&lsquo;mitasining rahbarlari va xodimlarining o&lsquo;z vaqtida va sifatli bajarilishini ta&rsquo;minlash bo&lsquo;yicha shaxsiy mas&rsquo;uliyatini oshirish;</p>\r\n</li>\r\n<li>\r\n<p class=\"leading-8 font-normal\">Davlat qo&lsquo;mitasi raisi qonun hujjatlariga muvofiq boshqa vakolatlarni ham amalga oshiradi.</p>\r\n</li>\r\n</ul>"
/// reception_time : "Har oyning 30 sanasi 15:00-18:00"

class LeadershipModel {
  LeadershipModel({
    this.avatar,
    this.firstName,
    this.lastName,
    this.fatherName,
    this.phone,
    this.position,
    this.biography,
    this.functions,
    this.receptionTime,
  });

  LeadershipModel.fromJson(dynamic json) {
    avatar = json['avatar'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    phone = json['phone'];
    position = json['position'];
    biography = json['biography'];
    functions = json['functions'];
    receptionTime = json['reception_time'];
  }

  String? avatar;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? phone;
  String? position;
  String? biography;
  String? functions;
  String? receptionTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['avatar'] = avatar;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['father_name'] = fatherName;
    map['phone'] = phone;
    map['position'] = position;
    map['biography'] = biography;
    map['functions'] = functions;
    map['reception_time'] = receptionTime;
    return map;
  }
}
