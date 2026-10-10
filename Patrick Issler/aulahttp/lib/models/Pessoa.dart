class Pessoa {

  final String name;
  final String phone;

  Pessoa(this.name, this.phone);

  factory Pessoa.fromJson(Map json){
    return Pessoa(json['name'].toString(), json['phone'].toString());
  }


}