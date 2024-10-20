import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

abstract class GetItInstanceView<Params> extends StatelessWidget {
  const GetItInstanceView() : super(key: null);
}

extension BuildContextX on BuildContext {
  GetIt get di => GetIt.instance;

  GetItInstanceView<Params> view<Params>() {
    return di();
  }
}
