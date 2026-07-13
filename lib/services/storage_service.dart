import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/server.dart';

class StorageService {
  static const String keyServers = "servers";

  static Future<void> saveServers(List<Server> servers) async {
    final prefs = await SharedPreferences.getInstance();

    final data = servers.map((server) {
      return jsonEncode({
        "nombre": server.nombre,
        "ip": server.ip,
        "puerto": server.puerto,
        "usuario": server.usuario,
        "password": server.password,
        "tls": server.tls,
        "sni": server.sni,
        "pais": server.pais,
        "favorito": server.favorito,
      });
    }).toList();

    await prefs.setStringList(keyServers, data);
  }

  static Future<List<Server>> loadServers() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getStringList(keyServers);

    if (data == null) {
      return [];
    }

    return data.map((item) {
      final json = jsonDecode(item);

      return Server(
        nombre: json["nombre"] ?? "",
        ip: json["ip"] ?? "",
        puerto: json["puerto"] ?? 22,
        usuario: json["usuario"] ?? "",
        password: json["password"] ?? "",
        tls: json["tls"] ?? false,
        sni: json["sni"] ?? "",
        pais: json["pais"] ?? "",
        favorito: json["favorito"] ?? false,
      );
    }).toList();
  }
}