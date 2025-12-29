import 'package:flutter/material.dart';
import 'package:flutter_mvvm_statemanagement_practice/constants/constants.dart';

class GenresChips extends StatelessWidget {
  const GenresChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(AppConstants.genres.length, (index) {
        return chipWidget(
          genreName: AppConstants.genres[index],
          context: context,
        );
      }),
    );
  }

  Widget chipWidget({
    required String genreName,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.2),
          border: Border.all(color: Theme.of(context).colorScheme.surface),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Text(
            genreName,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
