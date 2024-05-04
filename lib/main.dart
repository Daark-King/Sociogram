import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:sociogram/state/auth/backend/authenticator.dart';
import 'package:sociogram/state/auth/models/auth_result.dart';
import 'package:sociogram/state/auth/providers/auth_state_provider.dart';
import 'package:sociogram/views/components/loading/loading_screen.dart';
// import 'package:sociogram/state/auth/providers/is_logged_in_provider.dart';
import 'firebase_options.dart';
// import 'dart:developer' as devtools show log;

// import 'package:firebase_app_check/firebase_app_check.dart';
// extension Log on Object {
//   void log() => devtools.log(toString());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blueGrey,
          indicatorColor: Colors.blueGrey,
        ),
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: Consumer(
          builder: (context, ref, child) {
            final isLoggedIn =
                ref.watch(authStateProvider).result == AuthResult.success;
            if (isLoggedIn) {
              return const MainView();
            } else {
              return const LoginView();
            }
          },
        ));
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Main View')),
      ),
      body: Consumer(
        builder: (_, ref, child) {
          return TextButton(
            onPressed: () async {
              LoadingScreen.instance().show(
                context: context,
                text: 'Signing out...',
              );
              // await ref.read(authStateProvider.notifier).logOut();
            },
            child: const Text('Sign out'),
          );
        },
      ),
    );
  }
}

class LoginView extends ConsumerWidget {
  const LoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Login View'))),
      body: Column(
        children: [
          TextButton(
            onPressed: ref.read(authStateProvider.notifier).loginWithGoogle,
            child: const Text('Sign in with google'),
          ),
          TextButton(
            onPressed: ref.read(authStateProvider.notifier).loginWithFacebook,
            child: const Text('Sign in with facebook'),
          ),
        ],
      ),
    );
  }
}
