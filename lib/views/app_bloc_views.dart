import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc_provider/bloc/app_bloc.dart';
import 'package:multi_bloc_provider/bloc/app_state.dart';
import 'package:multi_bloc_provider/bloc/bloc_events.dart';
import 'package:multi_bloc_provider/extensions/stream/start_with.dart';

class AppBlocView<T extends AppBloc> extends StatelessWidget {
  const AppBlocView({Key? key}) : super(key: key);

  void startUpdatingBloc(BuildContext context) {
    Stream.periodic(
      const Duration(seconds: 10),
      (_) => const LoadNextUrlEvent(),
    ).startWith(const LoadNextUrlEvent()).forEach((event) {
      context.read<T>().add(
            event,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    startUpdatingBloc(context);
    return Expanded(
      child: BlocBuilder<T, AppState>(
        builder: ((context, appState) {
          if (appState.error != null) {
            return Text('An Error Occurred. Try Again');
          } else if (appState.data != null) {
            return Image.memory(
              appState.data!,
              fit: BoxFit.fitHeight,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
