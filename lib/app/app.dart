import 'package:hostels/views/forgot_password/forgot_password_view.dart';
import 'package:hostels/views/login/login_view.dart';
import 'package:hostels/views/playground/playground_view.dart';
import 'package:hostels/views/profile/profile_view.dart';
import 'package:hostels/views/register/register_view.dart';
import 'package:hostels/views/reset_password/reset_password_view.dart';
import 'package:hostels/views/rooms/rooms_view.dart';
import 'package:hostels/views/store/store_view.dart';
import 'package:hostels/views/users/users_view.dart';
import 'package:hostels/views/verify_emal/verify_email_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StoreView),
    MaterialRoute(page: RoomsView),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: ResetPasswordView),
    MaterialRoute(page: VerifyEmailView),
    MaterialRoute(page: PlaygroundView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: UsersView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    // LazySingleton(classType: DialogService),
    // LazySingleton(classType: BottomSheetService),
  ],
)
class App {}
