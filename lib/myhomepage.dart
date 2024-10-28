// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pruebaproject/Clases/contactdata.dart';
import 'package:intl/intl.dart';

class ContactDetailsPage extends StatefulWidget {
  final ContactData contact;
  ContactDetailsPage(this.contact, {super.key});

  @override
  State<ContactDetailsPage> createState() => MyContactDetailsPageState();
}

class MyContactDetailsPageState extends State<ContactDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(widget.contact),
      appBar: appBar(),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.black,
      leading: const Icon(Icons.arrow_back, color: Colors.white),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              if (widget.contact.isFavorite) {
                print("No es favorito");
                widget.contact.isFavorite = false;
              } else {
                print("Es favorito");
                widget.contact.isFavorite = true;
              }
            });
          },
          icon: widget.contact.isFavorite
              ? Icon(Icons.star)
              : Icon(Icons.star_border_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.edit),
        ),
      ],
    );
  }

  Widget body(ContactData contact) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 100,
            backgroundColor: Colors.white,
            child: putimg(),
          ),
        ),
        SizedBox(height: 40),
        Container(
          child: Text("${widget.contact.name}", style: TextStyle(fontSize: 30)),
        ),
        SizedBox(height: 30),
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.white24,
        ),
        Expanded(
          child: TextButton(
              style: TextButton.styleFrom(shape: RoundedRectangleBorder()),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content:
                          Text("Enviando email a ${widget.contact.email}...")),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Correo electrónico",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text("${widget.contact.email}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal))
                    ],
                  ),
                  Icon(Icons.email)
                ],
              )),
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.white24,
        ),
        Expanded(
          child: TextButton(
              style: TextButton.styleFrom(shape: RoundedRectangleBorder()),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text("Llamando a ${widget.contact.phone}...")),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Teléfono",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                      Text("${widget.contact.phone}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal))
                    ],
                  ),
                  Icon(Icons.phone)
                ],
              )),
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.white24,
        ),
        Expanded(
          child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(shape: RoundedRectangleBorder()),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nacimiento",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                            "${DateFormat("MMMM dd, yyyy").format(contact.birthdate!)}",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 100, top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Edad",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text("${calcEdad(contact.birthdate!)}",
                            style: TextStyle(fontSize: 18))
                      ],
                    ),
                  )
                ],
              )),
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.white24,
        ),
        Expanded(
          child: TextButton(
              style: TextButton.styleFrom(shape: RoundedRectangleBorder()),
              onPressed: editLabels,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Etiquetas",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text("${widget.contact.labels}",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.normal))
                    ],
                  ),
                ],
              )),
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.white24,
        ),
        Container(
          child: Text(
              "Added on ${DateFormat('yyyy-mm-dd HH:mm').format(widget.contact.creation!)}"),
        ),
        Container(
          child: Text(
              "Modified on ${DateFormat('yyyy-mm-dd HH:mm').format(widget.contact.modification!)}"),
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );
  }

  //Hago un metodo para la edición de las etiquetas ya que no se ve al abrir el teclado
  void editLabels() {
    String etiquetasIniciales = widget.contact.labels.map((e) => e).join(", ");
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        TextEditingController etiquetasController =
            TextEditingController(text: etiquetasIniciales);

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Editar Etiquetas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: etiquetasController,
                decoration: InputDecoration(
                    labelText: 'Etiquetas (separadas por comas)'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  List<String> etiquetasNuevas = etiquetasController.text
                      .split(',')
                      .map((etiqueta) => etiqueta.trim().toLowerCase())
                      .where((etiqueta) => etiqueta.isNotEmpty)
                      .toList();
                  setState(() {
                    widget.contact.labels = etiquetasNuevas;
                  });
                  print(
                      'Nuevas etiquetas del contacto: ${widget.contact.labels}');
                  Navigator.pop(context);
                },
                child: Text('Aplicar'),
              ),
            ],
          ),
        );
      },
    );
  }

  Image putimg() {
    String img = "assets/default.png";
    if (widget.contact.labels.isNotEmpty) {
      switch (widget.contact.labels[0]) {
        case "futbol":
          img = "assets/futbol.png";
          break;
        case "familia":
          img = "assets/familia.png";
          break;
        case "musica":
          img = "assets/musica.png";
          break;
        case "gimnasio":
          img = "assets/gimnasio.png";
          break;
        case "default":
          img = "assets/default.png";
          break;
      }
    }

    return Image(image: AssetImage(img));
  }

  //Hago un metodo para calcular la edad de la persona...
  int calcEdad(DateTime fecha) {
    return DateTime.now().year - fecha.year;
  }
}
