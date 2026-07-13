import 'package:flutter/material.dart';
import '../models/server.dart';

class AddServerPage extends StatefulWidget {
  final Server? server;

  const AddServerPage({
    super.key,
    this.server,
  });

  @override
  State<AddServerPage> createState() => _AddServerPageState();
}

class _AddServerPageState extends State<AddServerPage> {
  final nombreController = TextEditingController();
  final ipController = TextEditingController();
  final puertoController = TextEditingController();
  final usuarioController = TextEditingController();
  final passwordController = TextEditingController();
  final sniController = TextEditingController();
  final paisController = TextEditingController();

  bool tls = false;

  @override
  void initState() {
    super.initState();

    if (widget.server != null) {
      nombreController.text = widget.server!.nombre;
      ipController.text = widget.server!.ip;
      puertoController.text = widget.server!.puerto.toString();
      usuarioController.text = widget.server!.usuario;
      passwordController.text = widget.server!.password;
      sniController.text = widget.server!.sni;
      paisController.text = widget.server!.pais;
      tls = widget.server!.tls;
    }
  }

  void guardarServidor() {
    final servidor = Server(
      nombre: nombreController.text,
      ip: ipController.text,
      puerto: int.tryParse(puertoController.text) ?? 22,
      usuario: usuarioController.text,
      password: passwordController.text,
      tls: tls,
      sni: sniController.text,
      pais: paisController.text,
      favorito: widget.server?.favorito ?? false,
    );

    Navigator.pop(context, servidor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.server == null
              ? "Agregar servidor"
              : "Editar servidor",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: "Nombre",
              ),
            ),
            TextField(
              controller: ipController,
              decoration: const InputDecoration(
                labelText: "IP",
              ),
            ),
            TextField(
              controller: puertoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Puerto",
              ),
            ),
            TextField(
              controller: usuarioController,
              decoration: const InputDecoration(
                labelText: "Usuario",
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Contraseña",
              ),
            ),
            TextField(
              controller: sniController,
              decoration: const InputDecoration(
                labelText: "SNI",
              ),
            ),
            TextField(
              controller: paisController,
              decoration: const InputDecoration(
                labelText: "País",
              ),
            ),
            SwitchListTile(
              title: const Text("TLS"),
              value: tls,
              onChanged: (valor) {
                setState(() {
                  tls = valor;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: guardarServidor,
              child: Text(
                widget.server == null ? "Guardar" : "Actualizar",
              ),
            ),
          ],
        ),
      ),
    );
  }
}