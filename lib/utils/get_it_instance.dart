import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

abstract class GetItInstanceView<Params> extends StatelessWidget {
  final Params params;

  const GetItInstanceView({
    required this.params,
  }) : super(key: null);
}

extension BuildContextX on BuildContext {
  GetIt get di => GetIt.instance;

  GetItInstanceView<Params> view<Params>({
    required String name,
    required Params params,
  }) {
    return di(instanceName: name, param1: params);
  }
}
