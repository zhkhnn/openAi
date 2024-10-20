import 'package:get_it/get_it.dart';

import '../bloc/open_ai_bloc.dart';
import '../repository/open_ai_repository.dart';

void setupDependencies() {
  GetIt getIt = GetIt.instance;
  getIt.registerLazySingleton<OpenAiRepository>(() => OpenAiRepository());
  getIt.registerLazySingleton<OpenAiBloc>(
    () => OpenAiBloc(GetIt.I<OpenAiRepository>()),
  );
}
