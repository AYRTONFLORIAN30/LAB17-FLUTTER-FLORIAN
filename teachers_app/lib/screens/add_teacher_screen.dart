import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AddTeacherScreen extends StatefulWidget {
  @override
  _AddTeacherScreenState createState() => _AddTeacherScreenState();
}

class _AddTeacherScreenState extends State<AddTeacherScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Profesor"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: "Nombre"),
                  validator: (value) => value!.isEmpty ? "Ingrese el nombre" : null,
                ),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(labelText: "Apellido"),
                  validator: (value) => value!.isEmpty ? "Ingrese el apellido" : null,
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: "Teléfono"),
                  keyboardType: TextInputType.phone,
                  validator: (value) => value!.isEmpty ? "Ingrese el teléfono" : null,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: "Correo Electrónico"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value!.isEmpty ? "Ingrese el correo" : null,
                ),
                TextFormField(
                  controller: _imageUrlController,
                  decoration: InputDecoration(labelText: "URL Imagen"),
                  validator: (value) => value!.isEmpty ? "Ingrese la URL de la imagen" : null,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final response = await addTeacher({
                        'name': _nameController.text,
                        'last_name': _lastNameController.text,
                        'phone': _phoneController.text,
                        'email': _emailController.text,
                        'imageUrl': _imageUrlController.text,
                      });

                      if (response) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Profesor agregado exitosamente")),
                        );
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Error al agregar profesor")),
                        );
                      }
                    }
                  },
                  child: Text("Guardar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
