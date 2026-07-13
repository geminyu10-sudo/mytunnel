class TunnelService {
  bool conectado = false;

  Future<bool> conectar({
    required String ip,
    required int puerto,
    required String usuario,
    required String password,
  }) async {

    // Aquí irá la conexión real con tu servidor

    await Future.delayed(
      const Duration(seconds: 2),
    );

    conectado = true;

    return conectado;
  }

  Future<void> desconectar() async {
    conectado = false;
  }
}