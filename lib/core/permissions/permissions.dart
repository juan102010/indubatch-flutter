import 'package:permission_handler/permission_handler.dart';

class Permissions {
  static Future<PermissionStatus> camera() async {
    PermissionStatus status = await Permission.camera.status;
    if (status.isDenied || status.isRestricted) {
      final Map<Permission, PermissionStatus> statusses =
          await [Permission.camera].request();
      status = statusses[Permission.camera] ?? PermissionStatus.denied;
    }
    return status;
  }

  static Future<PermissionStatus> storage() async {
    PermissionStatus status = await Permission.storage.status;
    if (status.isDenied || status.isRestricted) {
      final Map<Permission, PermissionStatus> statusses =
          await [Permission.storage].request();
      status = statusses[Permission.storage] ?? PermissionStatus.denied;
    }
    return status;
  }

  static Future<PermissionStatus> location() async {
    PermissionStatus status = await Permission.location.status;
    if (status.isDenied || status.isRestricted || status.isPermanentlyDenied) {
      final Map<Permission, PermissionStatus> statusses =
          await [Permission.location].request();
      status = statusses[Permission.location] ?? PermissionStatus.denied;
    }
    return status;
  }
}
