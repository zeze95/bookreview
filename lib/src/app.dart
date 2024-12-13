import 'package:bookreviw/home.dart';
import 'package:bookreviw/src/detail.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late GoRouter router; // null이 올수 있기에 옵셔널을 주느니 차라리 라우터
  @override
  void initState() {
    super.initState();
    //route;
    router = GoRouter(routes: [
      GoRoute(path: '/', builder: (context, state) => const Home()),
      GoRoute(path: '/detail', builder: (context, state) => const Detail()),
    ], initialLocation: '/' // 인입 페이지
        );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: const Color(0xff1c1c1c),
            titleTextStyle: TextStyle(color: Colors.white)),
        scaffoldBackgroundColor: const Color(0xff1c1c1c),
      ),
    );
  }
}
