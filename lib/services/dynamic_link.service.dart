import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:pss_m/core/constants/dynamic_link.dart';

class DynamicLinkService extends GetxService {
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  Future<Uri> createDynamicLink(String target) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: DynamicLink.link,
      link: Uri.parse(target),
      androidParameters: const AndroidParameters(
        packageName: 'com.example.pss_m',
        minimumVersion: 0,
      ),
    );

    Uri url;
    final ShortDynamicLink shortLink =
        await dynamicLinks.buildShortLink(parameters);
    url = shortLink.shortUrl;
    return url;
  }
}
