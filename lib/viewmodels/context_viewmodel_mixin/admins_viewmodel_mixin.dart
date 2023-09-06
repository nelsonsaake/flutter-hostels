import 'package:hostels/firestore/collections/admins.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

mixin AdminsViewModelMixin on ContextViewModel {
  // toogle add access

  // Map<email, isAdmin>
  static final Map<String, bool> _adminStatus = {};

  bool? isAdmin(email) => _adminStatus[email];

  Future _getIsAdmin(String email) async {
    _adminStatus[email] = await Admins.exists(email);
  }

  Future getIsAdmin(String email) async {
    return runBusyFuture(_getIsAdmin(email));
  }

  Future _toggleAdminAccess(String email) async {
    _adminStatus[email] = await Admins.toggleExists(email);
  }

  Future toggleAdminAccess(String email) async {
    return runBusyFuture(_toggleAdminAccess(email));
  }
}
