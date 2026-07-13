import 'package:flutter/material.dart';
import 'dart:async';
import 'servers_page.dart';

class TunnelHome extends StatefulWidget {
  const TunnelHome({super.key});

  @override
  State<TunnelHome> createState() => _TunnelHomeState();
}

class _TunnelHomeState extends State<TunnelHome> {
  bool conectado = false;
  Timer? timer;

int segundos = 0;

  String servidor = "Perú 🇵🇪";

  void cambiarConexion() {
void iniciarCronometro() {
  timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    setState(() {
      segundos++;
    });
  });
}

void detenerCronometro() {
  timer?.cancel();

  setState(() {
    segundos = 0;
  });
}
    setState(() {
  conectado = !conectado;
});

if (conectado) {
  iniciarCronometro();
} else {
  detenerCronometro();
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MyTunnel",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              conectado ? Icons.shield : Icons.shield_outlined,
              size: 100,
            ),

            const SizedBox(height: 20),

            Text(
              conectado ? "Conectado" : "Desconectado",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Servidor: $servidor",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: cambiarConexion,
                child: Text(
                  conectado ? "DESCONECTAR" : "CONECTAR",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 25),

            Card(
              child: ListTile(
                leading: const Icon(Icons.speed),
                title: const Text("Velocidad"),
                subtitle: Text(
                  conectado ? "25 Mbps" : "Sin conexión",
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.timer),
                title: const Text("Tiempo conectado"),
                subtitle: Text(
                  conectado ? "00:05:32" : "00:00:00",
                ),
              ),
            ),

            const SizedBox(height: 20),

            OutlinedButton.icon(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ServersPage(),
      ),
    );
  },
              icon: const Icon(Icons.settings),
              label: const Text("Configuración"),
            ),
          ],
        ),
      ),
    );
  }
}