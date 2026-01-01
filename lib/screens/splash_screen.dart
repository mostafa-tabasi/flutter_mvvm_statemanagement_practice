import 'package:flutter/material.dart';
import 'package:flutter_mvvm_statemanagement_practice/repositories/movies_repository.dart';
import 'package:flutter_mvvm_statemanagement_practice/screens/movies_screen.dart';
import 'package:flutter_mvvm_statemanagement_practice/services/navigation_service.dart';
import 'package:flutter_mvvm_statemanagement_practice/utils/init_getit.dart';
import 'package:flutter_mvvm_statemanagement_practice/widgets/error_message.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;
  String _errorMessage = "";
  final MoviesRepository _moviesRepository = getIt<MoviesRepository>();

  Future<void> _loadGenres() async {
    setState(() {
      _isLoading = true;
      _errorMessage = "";
    });

    try {
      await _moviesRepository.fetchGenres();
      getIt<NavigationService>().navigateReplace(MoviesScreen());
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Loading..."),
                  SizedBox(height: 20),
                  CircularProgressIndicator.adaptive(),
                ],
              ),
            )
          : _errorMessage.isNotEmpty
          ? ErrorMessage(errorText: _errorMessage, retryFunction: _loadGenres)
          : Container(),
    );
  }
}
