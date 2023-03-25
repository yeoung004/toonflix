import 'dart:async';
import 'package:flutter/material.dart';
import 'package:toonflix/screens/widgets/mode_button.dart';
import 'package:toonflix/screens/widgets/time_button.dart';

const resetSeconds = 1500;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = resetSeconds;
  int totalPomodors = 0;
  bool isPlusMode = true;
  bool isRunning = false;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        isRunning = false;
        totalPomodors++;
        totalSeconds = resetSeconds;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds--;
      });
    }
  }

  String formatSecToMin() {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return "$minutes:${seconds.toString().padLeft(2, '0')}";
  }

  void onControl() {
    if (isRunning) {
      timer.cancel();
    } else {
      timer = Timer.periodic(const Duration(seconds: 1), onTick);
    }

    setState(() {
      isRunning = !isRunning;
    });
  }

  void switchMode(bool isPlusMode) {
    setState(() {
      this.isPlusMode = isPlusMode;
    });
  }

  void addTime(int seconds) {
    if (isPlusMode && (totalSeconds + seconds) <= 3600) {
      setState(() {
        totalSeconds += seconds;
      });
    }
    if (!isPlusMode && (totalSeconds - seconds) >= 0) {
      setState(() {
        totalSeconds -= seconds;
      });
    }
  }

  void onReset() {
    timer.cancel();
    setState(() {
      totalSeconds = resetSeconds;
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                formatSecToMin(),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ModeButton(
                    isMode: isPlusMode,
                    label: "+",
                    switchMode: () => switchMode(true)),
                const SizedBox(width: 20),
                TimeButton(
                  label: "1m",
                  onPressed: () => addTime(60),
                ),
                TimeButton(
                  label: "5m",
                  onPressed: () => addTime(300),
                ),
                TimeButton(
                  label: "10m",
                  onPressed: () => addTime(600),
                ),
                ModeButton(
                    isMode: !isPlusMode,
                    label: "-",
                    switchMode: () => switchMode(false)),
              ],
            ),
          ),
          Flexible(
            flex: 5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: const Offset(20, 0),
                  child: IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    icon: isRunning
                        ? const Icon(Icons.pause_circle_outline)
                        : const Icon(Icons.play_circle_outline),
                    onPressed: onControl,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(20, 0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).cardColor,
                    ),
                    child: IconButton(
                      iconSize: 20,
                      color: Colors.black,
                      icon: const Icon(Icons.restart_alt_outlined),
                      onPressed: onReset,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color: Theme.of(context).cardColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodors",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .color,
                          ),
                        ),
                        Text(
                          "$totalPomodors",
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .color,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
