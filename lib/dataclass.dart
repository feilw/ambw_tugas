// class data-data yang akan di ambil

class cData {
  String cid;
  String cavatar;
  String cnama;
  String calamat;
  String cemail;
  String cpekerjaan;
  String cquote;

  cData({
    required this.cid,
    required this.cavatar,
    required this.cnama,
    required this.calamat,
    required this.cemail,
    required this.cpekerjaan,
    required this.cquote,
  });

  factory cData.fromJson(Map<String, dynamic> json) {
    return cData(
        cid: json['id'],
        cavatar: json['avatar'],
        cnama: json['nama'],
        calamat: json['alamat'],
        cemail: json['email'],
        cpekerjaan: json['pekerjaan'],
        cquote: json['quote']);
  }
}
