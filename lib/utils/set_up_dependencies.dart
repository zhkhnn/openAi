import 'package:get_it/get_it.dart';

import '../bloc/open_ai_bloc.dart';
import '../repository/open_ai_repository.dart';

void setupDependencies() {
  GetIt.I.registerLazySingleton<OpenAiRepository>(() => OpenAiRepository());
  GetIt.I.registerLazySingleton<OpenAiBloc>(
    () => OpenAiBloc(GetIt.I<OpenAiRepository>()),
  );
}
