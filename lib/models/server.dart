class Server {
  final String nombre;
  final String ip;
  final int puerto;
  final String usuario;
  final String password;
  final bool tls;
  final String sni;
  final String pais;
  final bool favorito;

  bool conectado;

  Server({
    required this.nombre,
    required this.ip,
    required this.puerto,
    required this.usuario,
    required this.password,
    required this.tls,
    required this.sni,
    required this.pais,
    this.favorito = false,
    this.conectado = false,
  });
}