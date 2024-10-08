import 'package:go_router/go_router.dart';
import 'package:token_swarm/src/features/about/about_view.dart';
import 'package:token_swarm/src/features/home_screen/home_screen.dart';
import 'package:token_swarm/src/features/search_card/search_card.dart';
import 'package:token_swarm/src/features/token_screen/view/token_screen_view.dart';

class RoutePath {
  static const home = '/';
  static const searchCard = '/search_card';
  static const token = '/token';
  static const about = '/about';

  static GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
        path: RoutePath.home,
        builder: (context, state) => const HomeScreenView(),
      ),
      GoRoute(
        path: RoutePath.searchCard,
        builder: (context, state) => const SearchCardView(),
      ),
      GoRoute(
        path: RoutePath.about,
        builder: (context, state) => const AboutView(),
      ),
      GoRoute(
        path: RoutePath.token,
        builder: (context, state) => const TokenScreenView(),
      ),
    ],
  );
}
