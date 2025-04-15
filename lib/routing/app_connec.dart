import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:url_launcher/url_launcher.dart';

class AppConnec {

  // Método para abrir una URL
  Future<void> openUrlInChrome(String url) async {
    final intent = AndroidIntent(
      action: 'action_view',  // Acción para abrir una URL
      package: 'com.android.chrome',  // Paquete de Chrome
      data: Uri.encodeFull(url),  // Codificación de la URL
      flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],  // Abrir en una nueva tarea
    );
    await intent.launch();  // Lanza el intento
  }


  // Método para abrir otra aplicación en Android
  Future<void> openExternalApp() async {
    const String packageName = "com.aimfighter.mainapp"; // Paquete de la aplicación
    final Uri uri = Uri.parse("android-app://$packageName");

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print("No se pudo abrir la aplicación externa");
    }
  }

}
