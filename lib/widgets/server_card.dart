import 'package:flutter/material.dart';
import '../models/server.dart';

class ServerCard extends StatelessWidget {
  final Server server;
  final VoidCallback onConnect;
  final VoidCallback onDelete;

  const ServerCard({
    super.key,
    required this.server,
    required this.onConnect,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer,
                  ),
                  child: const Icon(
                    Icons.cloud,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        server.nombre,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        server.pais.isEmpty
                            ? "Sin país"
                            : server.pais,
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),

                if (server.favorito)
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                const Icon(
                  Icons.dns,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Text(
                  "${server.ip}:${server.puerto}",
                ),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                const Icon(
                  Icons.person,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Text(
                  server.usuario.isEmpty
                      ? "Sin usuario"
                      : server.usuario,
                ),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                Icon(
                  server.tls
                      ? Icons.lock
                      : Icons.lock_open,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Text(
                  server.tls
                      ? "TLS activado"
                      : "TLS desactivado",
                ),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.end,
              children: [

                FilledButton.icon(
                  onPressed: onConnect,
                  icon: const Icon(
                    Icons.play_arrow,
                  ),
                  label: const Text(
                    "Conectar",
                  ),
                ),

                const SizedBox(width: 8),

                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(
                    Icons.delete,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}