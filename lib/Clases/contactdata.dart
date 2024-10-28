class ContactData {
  int id; //Valor numérico único, no puede repetirse dentro de la agenda.
  String? name; //Nombre.
  String? surname; //Apellidos
  String? email; //Dirección de email.
  String? phone; //Teléfono.
  DateTime? birthdate; //Fecha de nacimiento.
  DateTime?
      creation; //Fecha y hora en que se dió de alta el contacto en la agenda.
  DateTime? modification; //Fecha y hora de la última modificación del contacto.
  bool isFavorite; //Indica si el contacto está o no en la lista de favoritos.
  List<String>
      labels; //Lista de palabras. Ejemplo: 'trabajo' y 'amistad'. Permiten categorizar al contacto.

  ContactData({
    required this.id,
    this.name,
    this.surname,
    this.email,
    this.phone,
    this.birthdate,
    this.creation,
    this.modification,
    this.isFavorite = false,
    List<String>? labels,
  }) : labels = labels ?? [];
  factory ContactData.fromJson(Map<String, dynamic> data) {
    return ContactData(
        id: data["id"] ?? 0,
        name: data["name"],
        surname: data["surname"],
        email: data["email"],
        phone: data["phone"],
        birthdate: DateTime.tryParse(data["birthdate"]),
        creation: DateTime.tryParse(data["creation"]),
        modification: DateTime.tryParse(data["modification"]),
        isFavorite: data["isFavorite"] ?? false,
        labels: data["labels"] != null ? List.from(data["labels"]) : []);
  }
  @override
  String toString() {
    return [
      "ID: $id",
      if (name != null) "Nombre: $name",
      if (surname != null) "Nombre: $surname",
      if (email != null) "Nombre: $email",
      if (phone != null) "Nombre: $phone",
      if (birthdate != null) "Nombre: $birthdate",
      if (creation != null) "Nombre: $creation",
      if (modification != null) "Nombre: $modification",
      if (isFavorite) "Esfavorito",
      if (labels.isNotEmpty) "Etiquetas ${labels.join(", ")}",
    ].join(",\n");
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'email': email,
      'phone': phone,
      'birthdate': birthdate,
      'creation': creation,
      'modification': modification,
      'isFavorite': isFavorite,
      'labels': labels
    };
  }

  ContactData copyWith(
      {int? id,
      String? name1,
      String? surname1,
      String? email1,
      String? phone1,
      DateTime? birthdate1,
      DateTime? modification1,
      List<String>? labels1}) {
    return ContactData(
        id: id ?? this.id,
        name: name1 ?? name,
        surname: surname1 ?? surname,
        email: email1 ?? email,
        phone: phone1 ?? phone,
        birthdate: birthdate1 ?? birthdate,
        modification: modification1 ?? modification,
        labels: labels1 ?? labels);
  }
}
