import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../features/auth/presentation/auth_controller.dart';

class AdminAccessControl {
  static const Set<String> _adminUIDs = {
    // Add your admin UIDs here
    '7vHt7aiUeuaQMpHnDejyKoiFbje2', // Replace with actual admin UID
    'admin2@example.com', // Replace with actual admin UID
    // Add more admin UIDs as needed
  };

  static bool isAdmin(User? user) {
    if (user == null) return false;
    return _adminUIDs.contains(user.uid) || _adminUIDs.contains(user.email);
  }

  static bool hasAdminAccess(String? uid, String? email) {
    if (uid == null && email == null) return false;
    return (uid != null && _adminUIDs.contains(uid)) ||
           (email != null && _adminUIDs.contains(email));
  }
}

final isCurrentUserAdminProvider = Provider<bool>((ref) {
  final user = ref.watch(currentUserProvider);
  return AdminAccessControl.isAdmin(user);
});