import 'package:e_foodies/src/features/account/presentation/account.dart';
import 'package:e_foodies/src/features/account/presentation/edit-profile/edit_account.dart';
import 'package:e_foodies/src/features/auth/presentation/login/login_screen.dart';
import 'package:e_foodies/src/features/auth/presentation/register/register_screen.dart';
import 'package:e_foodies/src/features/auth/presentation/splash_screen.dart';
import 'package:e_foodies/src/features/auth/presentation/welcome/welcome_screen.dart';
import 'package:e_foodies/src/features/menu/presentation/menu_list.dart';
import 'package:e_foodies/src/features/search/presentation/search_screen.dart';
import 'package:e_foodies/src/features/store/presentation/edit-user-store/edit_user_store.dart';
import 'package:e_foodies/src/features/store/presentation/register-store/register_store.dart';
import 'package:e_foodies/src/features/store/presentation/store.dart';
import 'package:e_foodies/src/features/store/presentation/store_list.dart';
import 'package:e_foodies/src/features/store/presentation/user-store/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core/bloc/app/app_bloc.dart';

import '../features/dashboard/presentation/dashboard_screen.dart';
import '../features/menu/presentation/add-menu/add_menu.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: SplashScreen(),
      ),
      redirect: (context, state) {
        dynamic appState = context.watch<AppBloc>().state;
        if (appState != const AppState.initial()) {
          if (appState == const AppState.unauthenticated()) {
            return '/welcome';
          } else {
            return '/dashboard';
          }
        }
        return null;
      },
    ),
    GoRoute(
      path: '/welcome',
      pageBuilder: (context, state) => slideTransitionRL(
        const WelcomeScreen(),
      ),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => slideTransitionRL(
        LoginScreen(prevRoute: state.extra as String),
      ),
    ),
    GoRoute(
      path: '/register',
      pageBuilder: (context, state) => slideTransitionRL(
        RegisterScreen(prevRoute: state.extra as String),
      ),
    ),
    GoRoute(
      path: '/dashboard',
      pageBuilder: (context, state) => slideTransitionRL(
        const DashboardScreen(),
      ),
    ),
    GoRoute(
      path: '/store-list',
      pageBuilder: (context, state) => slideTransitionRL(
        const StoreList(),
      ),
    ),
    GoRoute(
      path: '/create-store',
      pageBuilder: (context, state) => slideTransitionRL(
        const CreateStore(),
      ),
    ),
    GoRoute(
      path: '/menu-list',
      pageBuilder: (context, state) => slideTransitionRL(
        const MenuList(),
      ),
    ),
    GoRoute(
      path: '/search',
      pageBuilder: (context, state) => fadeTransition(const SearchScreen()),
    ),
    GoRoute(
      path: '/account',
      pageBuilder: (context, state) => slideTransitionRL(const Account()),
      routes: [
        GoRoute(
          path: 'edit-account',
          name: 'edit-account',
          pageBuilder: (context, state) => slideTransitionRL(
            EditAccount(),
          ),
        ),
      ],
    ),
    GoRoute(
        path: '/store/:storeId',
        pageBuilder: (context, state) {
          return slideTransitionRL(
            StoreScreen(
              storeId: state.pathParameters['storeId']!,
              menuId: state.extra as String?,
            ),
          );
        }),
    GoRoute(
      path: '/user-store',
      pageBuilder: (context, state) => slideTransitionRL(UserStore()),
    ),
    GoRoute(
      path: '/edit-user-store',
      pageBuilder: (context, state) => slideTransitionRL(
        EditUserStore(),
      ),
    ),
    GoRoute(
      path: '/add-menu',
      pageBuilder: (context, state) => slideTransitionRL(const AddMenu()),
    ),
  ],
);

CustomTransitionPage<dynamic> slideTransitionRL(page) {
  return CustomTransitionPage(
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

CustomTransitionPage<dynamic> slideTransitionBT(page) {
  return CustomTransitionPage(
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(
        begin: begin,
        end: end,
      ).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

CustomTransitionPage<dynamic> fadeTransition(page) {
  return CustomTransitionPage(
    child: page,
    transitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
        child: child,
      );
    },
  );
}
