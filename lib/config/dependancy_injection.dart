import 'package:flutter/cupertino.dart';

import '../core/storage/local/database/provider/database_provider.dart';

initModule() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseProvider().initDatabase();
}