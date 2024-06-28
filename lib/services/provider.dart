import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/services/api.service.dart';
import 'package:ticket_raising_management/services/cache.service.dart';
import 'package:ticket_raising_management/services/file.service.dart';
import 'package:ticket_raising_management/services/firebase.service.dart';
// import 'package:ticket_raising_management/services/permission.services.dart';
import 'package:ticket_raising_management/services/route.services.dart';

final routeService = Provider<RouteService>(
  (ref) => RouteServiceImpl(),
);
final fileService = Provider<FileService>(
  (ref) => FileServiceImpl(),
);

final apiService = Provider<Apiservice>(
  (ref) => ApiserviceImpl(),
);

final firebaseService = Provider<FirebaseService>(
  (ref) => FirebaseServiceImpl(),
);

final cacheService = Provider<CacheService>(
  (ref) => CacheServiceImpl(),
);

// final permissionService = Provider<PermissionService>(
//   (ref) => PermissionServiceImpl(),
// );
