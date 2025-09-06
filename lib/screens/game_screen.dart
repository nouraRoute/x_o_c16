import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:x_o/common/app_colors.dart';
import 'package:x_o/common/app_consts.dart';
import 'package:x_o/common/shred_designs.dart';
import 'package:x_o/widgets/game_button.dart';
import 'package:x_o/widgets/timer_view.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});
  static const String routeName = 'gameScreen';

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String? currantPlayer;
  int xScore = 0, oScore = 0;
  List<String> gameLog = List.filled(9, ''); //[,,,,,,,'','','']
  @override
  Widget build(BuildContext context) {
    String firstPlayer = ModalRoute.of(context)!.settings.arguments.toString();
    currantPlayer = currantPlayer ?? firstPlayer;
    return Container(
        decoration: ShredDesigns.gradientDecoration,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        ScoreView(
                          oScore: oScore,
                          xScore: xScore,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25.0),
                          child: Text(
                            'Player ${currantPlayer}’s Turn',
                            style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: LayoutBuilder(builder: (context, constraints) {
                        double height = constraints.maxHeight;
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(44),
                          child: Container(
                            color: AppColors.blackColor,
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 2,
                                      crossAxisSpacing: 2,
                                      mainAxisExtent: height / 3),
                              itemCount: 9,
                              itemBuilder: (context, index) => GameButton(
                                value: gameLog[index],
                                onTap: () => onButtonClicked(index),
                              ),
                            ),
                          ),
                        );
                      }))
                ],
              ),
            ),
          ),
        ));
  }

  onButtonClicked(int index) {
    if (gameLog[index].isNotEmpty) return;
    gameLog[index] = currantPlayer ?? '';
    bool didWin = checkWinner();
    if (didWin) {
      //TODO:win ui
      if (currantPlayer == 'x') {
        xScore++;
      } else {
        oScore++;
      }
      setState(() {});
      showWinnerDialog(currantPlayer!);
      return;
    }
    if (currantPlayer == 'x') {
      currantPlayer = 'o';
    } else {
      currantPlayer = 'x';
    }
    setState(() {});
    print('==>$currantPlayer');
  }

  bool checkWinner() {
    //loop gameLog
    for (int i = 0; i <= 6; i += 3) {
      if (gameLog[i] == currantPlayer &&
          gameLog[i + 1] == currantPlayer &&
          gameLog[i + 2] == currantPlayer) {
        return true;
      }
    }

    for (int i = 0; i <= 2; i++) {
      if (gameLog[i] == currantPlayer &&
          gameLog[i + 3] == currantPlayer &&
          gameLog[i + 6] == currantPlayer) {
        return true;
      }
    }

    if (gameLog[0] == currantPlayer &&
        gameLog[4] == currantPlayer &&
        gameLog[8] == currantPlayer) {
      return true;
    }
    if (gameLog[2] == currantPlayer &&
        gameLog[4] == currantPlayer &&
        gameLog[6] == currantPlayer) {
      return true;
    }
    return false;
  }

  showWinnerDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => PopScope(
        canPop: false,
        child: AlertDialog(
          title: Lottie.asset(AppConsts.winLottie, height: 100, width: 100),
          actions: [
            TextButton(
                onPressed: () {
                  gameLog = List.filled(9, '');

                  Navigator.of(context).pop();
                },
                child: const Text('OK'))
          ],
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'We have a Winner!!',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 15,
              ),
              Text('the player $winner is the winner!'),
            ],
          ),
        ),
      ),
    );
  }
}
