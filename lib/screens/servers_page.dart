import 'package:flutter/material.dart';
import '../models/server.dart';
import '../services/storage_service.dart';
import '../widgets/server_card.dart';
import 'add_server_page.dart';

class ServersPage extends StatefulWidget {
  const ServersPage({super.key});

  @override
  State<ServersPage> createState() => _ServersPageState();
}

class _ServersPageState extends State<ServersPage> {
  List<Server> servidores = [];

  @override
  void initState() {
    super.initState();
    cargarServidores();
  }

  Future<void> cargarServidores() async {
    final lista = await StorageService.loadServers();

    setState(() {
      servidores = lista;
    });
  }

  Future<void> agregarServidor() async {
    final nuevoServidor = await Navigator.push<Server>(
      context,
      MaterialPageRoute(
        builder: (_) => const AddServerPage(),
      ),
    );

    if (nuevoServidor != null) {
      setState(() {
        servidores.add(nuevoServidor);
      });

      await StorageService.saveServers(servidores);
    }
  }

  Future<void> editarServidor(int index) async {
    final servidorEditado = await Navigator.push<Server>(
      context,
      MaterialPageRoute(
        builder: (_) => AddServerPage(
          server: servidores[index],
        ),
      ),
    );

    if (servidorEditado != null) {
      setState(() {
        servidores[index] = servidorEditado;
      });

      await StorageService.saveServers(servidores);
    }
  }

  Future<void> eliminarServidor(int index) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Eliminar servidor"),
        content: Text(
          "¿Eliminar '${servidores[index].nombre}'?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Eliminar"),
          ),
        ],
      ),
    );

    if (confirmar == true) {
      setState(() {
        servidores.removeAt(index);
      });

      await StorageService.saveServers(servidores);
    }
  }

  void conectarServidor(Server server) {
  setState(() {
    server.conectado = !server.conectado;
  });

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        server.conectado
            ? "Conectado a ${server.nombre}"
            : "Desconectado de ${server.nombre}",
      ),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Servidores"),
      ),
      body: ListView.builder(
        itemCount: servidores.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(servidores[index].nombre),
            background: Container(
              color: Colors.blue,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: const Icon(Icons.edit, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                await editarServidor(index);
                return false;
              }

              await eliminarServidor(index);
              return false;
            },
            child: ServerCard(
              server: servidores[index],
              onConnect: () => conectarServidor(servidores[index]),
              onDelete: () => eliminarServidor(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: agregarServidor,
        child: const Icon(Icons.add),
      ),
    );
  }
}