import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simplemoneymanager/db_functions/category/category_db.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';
import 'package:simplemoneymanager/screens/transactions/zoom_Drawa.dart';

Future<void >main()async {
final obj1=CategoryDb();
final obj2=CategoryDb();


  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();


 if(!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId))
  {
  Hive.registerAdapter(CategoryTypeAdapter());
  }


  if(!Hive.isAdapterRegistered(CategoryModelsAdapter().typeId))
  {
  Hive.registerAdapter(CategoryModelsAdapter());
  }

  if(!Hive.isAdapterRegistered(TransactionModelAdapter().typeId))
  {
  Hive.registerAdapter(TransactionModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: ThemeData(
  ),
      home:   const Hompage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

