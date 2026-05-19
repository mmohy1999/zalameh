import 'package:url_launcher/url_launcher.dart';

class Socilservies {
  Socilservies._();

  static const String phoneNumber = '+962797395785';
  static const String whatsAppNumber = '962797395785';

  static Future<void> call() async {
    await launchUrl(
      Uri(scheme: 'tel', path: phoneNumber),
      mode: LaunchMode.externalApplication,
    );
  }

  static Future<void> openWhatsApp() async {
    final whatsappUri = Uri.parse('whatsapp://send?phone=$whatsAppNumber');
    final webWhatsappUri = Uri.parse('https://wa.me/$whatsAppNumber');

    final openedWhatsApp = await launchUrl(
      whatsappUri,
      mode: LaunchMode.externalApplication,
    );

    if (!openedWhatsApp) {
      await launchUrl(webWhatsappUri, mode: LaunchMode.externalApplication);
    }
  }
}
