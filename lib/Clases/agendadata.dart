import 'package:pruebaproject/Clases/contactdata.dart';

class Agendadata {
  final List<ContactData> contacts;
  Agendadata({List<ContactData>? contactos})
      : this.contacts = contactos != null ? contactos : [];

  factory Agendadata.fromJson(Map<String, dynamic> json) {
    return Agendadata(
        contactos:
            json['contact'].map((contact) => contact.fromJson()).toList());
  }

  @override
  String toString() {
    return "AgendaData(contacts: $contacts)";
  }

  Agendadata copyWith(List<ContactData>? contactos) {
    return Agendadata(contactos: contactos != null ? contactos : this.contacts);
  }

  Map<String, dynamic> toJson() {
    return {"Contacto": contacts.map((contact) => contact.toJson()).toList()};
  }
}
