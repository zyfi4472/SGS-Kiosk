import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_mode/kiosk_mode.dart';
import 'views/screens/command_selection_screen.dart'; // Import the command selection screen

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in, unit in dp)
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use the library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Plugin example app'),
            ),
            body: const Center(child: _Home()),
          ),
        );
      },
    );
  }
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  late final Stream<KioskMode> _currentMode = watchKioskMode();

  void _showSnackBar(String message) => ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(message)));

  void _handleStop(bool? didStop) {
    if (didStop == false) {
      _showSnackBar(
        'Kiosk mode could not be stopped or was not active to begin with.',
      );
    }
  }

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: _currentMode,
        builder: (context, snapshot) {
          final mode = snapshot.data;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialButton(
                onPressed: mode == null || mode == KioskMode.enabled
                    ? null
                    : () => startKioskMode(),
                child: const Text('Start Kiosk Mode'),
              ),
              MaterialButton(
                onPressed: mode == null || mode == KioskMode.disabled
                    ? null
                    : () => stopKioskMode().then(_handleStop),
                child: const Text('Stop Kiosk Mode'),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CommandSelectionScreen()),
                  );
                },
                child: const Text('Command Selection'),
              ),
            ],
          );
        },
      );
}
