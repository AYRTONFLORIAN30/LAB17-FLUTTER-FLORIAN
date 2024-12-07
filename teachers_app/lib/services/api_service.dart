
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

// Función para obtener la lista de profesores desde la API
Future<List<User>> fetchTeachers() async {
  final url = Uri.parse('http://127.0.0.1:3000/teachers');
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((teacherJson) => User.fromJson(teacherJson)).toList();
    } else {
      throw Exception('Error al obtener profesores: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error en la solicitud: $e');
  }
}

Future<bool> addTeacher(Map<String, String> teacherData) async {
  final url = Uri.parse('http://127.0.0.1:3000/teachers');
  try {
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(teacherData),
    );

    print('Código de estado al enviar datos: ${response.statusCode}');

    if (response.statusCode == 201) {
      return true;
    } else {
      print('Error con la solicitud: ${response.body}');
      return false;
    }
  } catch (e) {
    print('Error al enviar datos: $e');
    return false;
  }
}
