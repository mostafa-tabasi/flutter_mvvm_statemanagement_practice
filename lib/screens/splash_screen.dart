import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mvvm_statemanagement_practice/screens/movies_screen.dart';
import 'package:flutter_mvvm_statemanagement_practice/services/navigation_service.dart';
import 'package:flutter_mvvm_statemanagement_practice/utils/init_getit.dart';
import 'package:flutter_mvvm_statemanagement_practice/viewmodels/movies/movies_bloc.dart';

import '../widgets/error_message.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesBloc = getIt<MoviesBloc>();
    final navigationService = getIt<NavigationService>();

    return Scaffold(
      body: BlocListener<MoviesBloc, MoviesState>(
        bloc: moviesBloc,
        listener: (context, state) {
          if (state is MoviesLoaded) {
            navigationService.navigateReplace(MoviesScreen());
          } else if (state is MoviesError) {
            navigationService.showSnackbar(state.message);
          }
        },
        child: BlocBuilder<MoviesBloc, MoviesState>(
          bloc: moviesBloc..add(FetchMovies()),
          builder: (context, state) {
            if (state is MoviesLoading) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Loading..."),
                    SizedBox(height: 20),
                    CircularProgressIndicator.adaptive(),
                  ],
                ),
              );
            } else if (state is MoviesError) {
              return ErrorMessage(
                errorText: state.message,
                retryFunction: () {
                  moviesBloc.add(FetchMovies());
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
