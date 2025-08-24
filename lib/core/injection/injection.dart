import 'package:get_it/get_it.dart';
import 'package:limpio_ya/core/theme/theme_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<ThemeCubit>(() => ThemeCubit(sl()));

  sl.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
}
