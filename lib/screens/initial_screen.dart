import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_o/common/app_consts.dart';
import 'package:x_o/common/shred_designs.dart';
import 'package:x_o/screens/game_screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});
  static const String routeName = "initialScreen";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShredDesigns.gradientDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Image.asset(
                      AppConsts.bgImage,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    const Center(
                      child: Text(
                        'Tix-Tac-Toe',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w900),
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const Text(
                      'Pick who goes first?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      GameScreen.routeName,
                                      arguments: 'x');
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(35),
                                  decoration: ShredDesigns.whiteCardDecoration
                                      .copyWith(
                                          borderRadius:
                                              BorderRadius.circular(32)),
                                  child: SvgPicture.asset(AppConsts.xImage),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      GameScreen.routeName,
                                      arguments: 'o');
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(35),
                                  decoration: ShredDesigns.whiteCardDecoration
                                      .copyWith(
                                          borderRadius:
                                              BorderRadius.circular(32)),
                                  child: SvgPicture.asset(AppConsts.oImage),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
///400
///300
///100