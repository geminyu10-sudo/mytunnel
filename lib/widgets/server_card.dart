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
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        leading: const Icon(Icons.cloud),

        title: Text(server.nombre),

        subtitle: Text(
          "${server.ip}:${server.puerto}\n${server.usuario}",
        ),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.play_arrow),
              onPressed: onConnect,
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}