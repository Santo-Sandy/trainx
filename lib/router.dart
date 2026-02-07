import 'package:StoreLink/bloc/counter_screen.dart';
import 'package:StoreLink/column.dart';
import 'package:StoreLink/counters.dart';
import 'package:StoreLink/httpdio.dart';
import 'package:StoreLink/main.dart';
import 'package:StoreLink/namewelcome.dart';
import 'package:StoreLink/navigation.dart';
import 'package:StoreLink/navigatedscreen.dart';
import 'package:StoreLink/scrollables.dart';
import 'package:StoreLink/stack.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(path: "/home", builder: (context, state) => MainApp()),
    GoRoute(path: "/welcome", builder: (context, state) => name()),
    GoRoute(
      path: "/counter/:id",
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return home(id);
      },
    ),
    GoRoute(
      path: "/counterscreen",
      builder: (context, state) => CounterScreen(),
    ),
    GoRoute(path: "/layout", builder: (context, state) => columnpage()),
    GoRoute(path: "/stack", builder: (context, state) => stacks()),
    GoRoute(path: "/scrolls", builder: (context, state) => srcolls()),
    GoRoute(path: '/navigation', builder: (context, state) => Navigation()),
    GoRoute(
      path: '/navigated_screen/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return navigated_screen(id);
      },
    ),
    GoRoute(path: '/httpdio', builder: (context, state) => http_dio()),
  ],
);
