import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixin {
  void launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
