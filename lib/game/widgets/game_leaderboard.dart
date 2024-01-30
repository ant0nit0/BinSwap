import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recycling_master/game/widgets/leaderboard_item.dart';
import 'package:recycling_master/models/score.dart';
import 'package:recycling_master/providers/leaderboard.dart';
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
          const SizedBox(height: kDefaultTinyPadding),
          const Divider(
            color: grayBorderColor,
            height: 1.0,
            thickness: 1.0,
            indent: kDefaultPadding,
            endIndent: kDefaultPadding,
          ),
          const SizedBox(height: kDefaultSmallPadding),
          Expanded(
            child: scoresNotifier.when(
              data: (scores) {
                return ListView.builder(
                  itemCount: scores.length,
                  itemBuilder: (context, index) {
                    // Highlight the last game score in the list
                    final isLastGameScore =
                        score.value == scores[index].value &&
                            score.timeInSec == scores[index].timeInSec;

                    return LeaderboardItem(
                      scores[index],
                      index: index + 1, // For ui, start at 1
                      highlight: isLastGameScore,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            translate('endGame.leaderboard.title'),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: neutralDark,
                  fontSize: 16.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
          ),
          Image.asset(
            'assets/images/icons/other/crown.png',
            width: 30.0,
            height: 30.0,
          )
        ],
      ),
    );
  }
}
