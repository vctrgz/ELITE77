import 'package:url_launcher/url_launcher.dart';

class AppConnec{

  // Método para abrir una URL
  void openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir $url';
    }
  }

  // Método para abrir otra aplicación en Android
  void openExternalApp() async {
    const packageName = "com.aimfighter.mainapp"; // Reemplazar con el paquete real
    final Uri uri = Uri.parse("intent://#Intent;package=$packageName;end;");
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      print("No se pudo abrir la aplicación externa");
    }
  }
}