import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:penseapp/features/splash/packages/splash/splash_page.dart';
import 'package:penseapp/shared/app/app_widget.dart';
import 'package:penseapp/shared/app/cubit/app_cubit.dart';
import 'package:penseapp/shared/consts/app_consts.dart';
import 'package:penseapp/shared/routes/app_routes.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox(deviceStorageKey);
  
  runApp(const PenseApp());
}

class PenseApp extends StatefulHookWidget {
  const PenseApp({Key? key}) : super(key: key);

  @override
  State<PenseApp> createState() => _PenseAppState();
}

class _PenseAppState extends State<PenseApp> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read(appCubitProvider).initApp();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: AppWidget()
    );
  }
}