import 'package:swiss_knife/swiss_knife.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

class ConfigOther {
  T? deepCopy<T>(T? o, {Copier? copier}) {
    if (o == null) return null;
    if (o is String) return o;
    if (o is num) return o;
    if (o is bool) return o;

    if (o is List) return deepCopyList(o, copier: copier) as T?;
    if (o is Map) return deepCopyMap(o, copier: copier) as T?;

    if (copier != null) {
      return copier(o);
    } else {
      return o;
    }
  }

  void delay({required Function() action, int milliseconds = 1200}) {
    Future.delayed(Duration(milliseconds: milliseconds), () => action());
  }

  String generateKey() {
    return const Uuid().v1();
  }

  Future openLink({required String url}) async {
    await launchUrl(Uri.parse(url));
  }
}
