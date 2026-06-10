// Public surface of the notifications module. Features import THIS, never
// core/db/app_database directly. The drift row model is re-exported (show-only)
// so screens can type their widgets without importing the database layer.
export 'notifications_repository.dart';
export 'package:ft_intra/core/db/app_database.dart' show IntraNotification;
