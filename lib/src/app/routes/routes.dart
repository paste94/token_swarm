import 'package:go_router/go_router.dart';
import 'package:token_swarm/src/features/S000_token_list/view/token_list_view.dart';
import 'package:token_swarm/src/features/S300_about/about_view.dart';
import 'package:token_swarm/src/features/S200_search_card/search_card.dart';
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
        builder: (context, state) => const TokenListView(),
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
