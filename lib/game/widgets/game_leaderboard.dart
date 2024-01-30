import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/models/score.dart';
import 'package:recycling_master/providers/leaderboard.dart';
import 'package:recycling_master/ui/widgets/ksvg.dart';
import 'package:recycling_master/utils/colors.dart';
import 'package:recycling_master/utils/theme.dart';

class GameLeaderboard extends HookConsumerWidget {
  final Score score;
  const GameLeaderboard(this.score, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoresNotifier = ref.watch(leaderboardProvider);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultLargePadding),
      decoration: BoxDecoration(
        color: neutralLight,
        borderRadius: BorderRadius.circular(8.0),
      ),
      height: 260.0,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: kDefaultSmallPadding),
      child: Column(
        children: [
          _header(context),
          const SizedBox(height: kDefaultSmallPadding),
          Expanded(
            child: scoresNotifier.when(
              data: (scores) {
                return ListView.builder(
                  itemCount: scores.length,
                  itemBuilder: (context, index) {
                    final isLastGameScore =
                        score.value == scores[index].value &&
                            score.timeInSec == scores[index].timeInSec;
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      color:
                          isLastGameScore ? yellowSecondaryColor : neutralLight,
                      child: Row(
                        children: [
                          Text(
                            '${index + 1}. ${scores[index].value}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: neutralDark,
                                    fontSize: 14.0,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) => Center(
                child: Text('Error: $error'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Your best scores:',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: neutralDark, fontSize: 16.0, fontFamily: 'LilitaOne'),
        ),
        const KSVG(
          'crown',
          noColor: true,
          width: 18.0,
          height: 18.0,
        )
      ],
    );
  }
}
