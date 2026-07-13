import 'package:flutter/material.dart';
import 'servers_page.dart';
import 'add_server_page.dart';

class TunnelHome extends StatelessWidget {
  const TunnelHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyTunnel'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const SizedBox(height: 20),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Icon(
                      Icons.vpn_lock,
                      size: 60,
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      'MyTunnel',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Gestor de configuraciones y servidores',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            FilledButton.icon(
              icon: const Icon(Icons.dns),
              label: const Text('Ver servidores'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ServersPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 15),

            FilledButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Agregar servidor'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddServerPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}