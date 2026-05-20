import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'pages.dart';

void main() {
  runApp(const ArslanCamAynaApp());
}

// --- PREMIUM DESIGN SYSTEM (DARK MODE DEFAULT) ---
class AppColors {
  static const Color background = Color(0xFF121415); // Warm Dark
  static const Color surface = Color(0xFF1C1E20);
  static const Color surfaceLight = Color(0xFF26282A);
  static const Color textPrimary = Color(0xFFEFEFEF);
  static const Color textSecondary = Color(0xFF8E9397);
  static const Color outline = Color(0xFF2A2C2E);
  static const Color accent = Color(0xFFD4AF37); // Luxury Gold
}

class AppTextStyles {
  static TextStyle get displayXl => GoogleFonts.inter(
        fontSize: 72,
        fontWeight: FontWeight.w200,
        letterSpacing: -2.0,
        height: 1.1,
        color: AppColors.textPrimary,
      );
  static TextStyle get headlineLg => GoogleFonts.inter(
        fontSize: 48,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.0,
        height: 1.2,
        color: AppColors.textPrimary,
      );
  static TextStyle get headlineMd => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 1.4,
        color: AppColors.textPrimary,
      );
  static TextStyle get bodyLg => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        height: 1.7,
        color: AppColors.textSecondary,
      );
  static TextStyle get bodyMd => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        height: 1.6,
        color: AppColors.textSecondary,
      );
  static TextStyle get labelCaps => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 3.0,
        height: 1.0,
        color: AppColors.textPrimary,
      );
}

// --- ROUTER CONFIGURATION ---
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return MainShell(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const HomeContent(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
          ),
        ),
        GoRoute(
          path: '/katalog/:kategori',
          pageBuilder: (context, state) {
            final category = state.pathParameters['kategori']!;
            return CustomTransitionPage(
              child: CatalogContent(category: category),
              transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
            );
          },
        ),
        GoRoute(
          path: '/urun/:id',
          pageBuilder: (context, state) {
            final id = state.pathParameters['id']!;
            return CustomTransitionPage(
              child: ProductDetailContent(productId: id),
              transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
            );
          },
        ),
        GoRoute(
          path: '/hakkimizda',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const AboutContent(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
          ),
        ),
        GoRoute(
          path: '/iletisim',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const ContactContent(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
          ),
        ),
      ],
    ),
  ],
);

class ArslanCamAynaApp extends StatelessWidget {
  const ArslanCamAynaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Arslan Cam Ayna',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.accent,
          surface: AppColors.background,
          onSurface: AppColors.textPrimary,
        ),
        textTheme: GoogleFonts.interTextTheme(),
      ),
      routerConfig: _router,
    );
  }
}

// --- MAIN SHELL ---
class MainShell extends StatefulWidget {
  final Widget child;
  const MainShell({super.key, required this.child});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  bool _isScrolled = false;

  bool _handleScroll(ScrollNotification notification) {
    if (notification.metrics.axis != Axis.vertical) return false;
    final isScrolled = notification.metrics.pixels > 50;
    if (isScrolled != _isScrolled) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if(mounted) setState(() => _isScrolled = isScrolled);
      });
    }
    return false;
  }

  void _openMobileMenu() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (sheetContext) {
        final currentPath = GoRouterState.of(context).uri.path;
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 44,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.outline,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                const SizedBox(height: 10),
                _MobileMenuItem(
                  title: 'ANA SAYFA',
                  isActive: currentPath == '/',
                  onTap: () {
                    Navigator.of(sheetContext).pop();
                    context.go('/');
                  },
                ),
                _MobileMenuItem(
                  title: 'DRESUARLAR',
                  isActive: currentPath == '/katalog/dresuarlar',
                  onTap: () {
                    Navigator.of(sheetContext).pop();
                    context.go('/katalog/dresuarlar');
                  },
                ),
                _MobileMenuItem(
                  title: 'AYNALAR',
                  isActive: currentPath == '/katalog/aynalar',
                  onTap: () {
                    Navigator.of(sheetContext).pop();
                    context.go('/katalog/aynalar');
                  },
                ),
                _MobileMenuItem(
                  title: 'SEHPALAR',
                  isActive: currentPath == '/katalog/sehpalar',
                  onTap: () {
                    Navigator.of(sheetContext).pop();
                    context.go('/katalog/sehpalar');
                  },
                ),
                _MobileMenuItem(
                  title: 'SAATLER',
                  isActive: currentPath == '/katalog/saatler',
                  onTap: () {
                    Navigator.of(sheetContext).pop();
                    context.go('/katalog/saatler');
                  },
                ),
                _MobileMenuItem(
                  title: 'TABLOLAR',
                  isActive: currentPath == '/katalog/tablolar',
                  onTap: () {
                    Navigator.of(sheetContext).pop();
                    context.go('/katalog/tablolar');
                  },
                ),
                _MobileMenuItem(
                  title: 'HAKKIMIZDA',
                  isActive: currentPath == '/hakkimizda',
                  onTap: () {
                    Navigator.of(sheetContext).pop();
                    context.go('/hakkimizda');
                  },
                ),
                _MobileMenuItem(
                  title: 'ILETISIM',
                  isActive: currentPath == '/iletisim',
                  onTap: () {
                    Navigator.of(sheetContext).pop();
                    context.go('/iletisim');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: _handleScroll,
            child: widget.child,
          ),
          TopNavBar(
            isScrolled: _isScrolled,
            onMenuTap: _openMobileMenu,
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          HeroSection(),
          CollectionsSection(),
          TechnicalSpecsSection(),
          BrandStripSection(),
          SiteFooter(),
        ],
      ),
    );
  }
}

// --- COMPONENTS ---

class TopNavBar extends StatelessWidget {
  final bool isScrolled;
  final VoidCallback? onMenuTap;

  const TopNavBar({
    super.key,
    required this.isScrolled,
    this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mobile = width < 1150;
    // Get current path to highlight active nav link
    final currentPath = GoRouterState.of(context).uri.path;
    
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Container(
          height: mobile ? 80 : 96,
          padding: EdgeInsets.symmetric(
            horizontal: mobile ? 16.0 : (width < 1300 ? 24.0 : 64.0),
          ),
          decoration: BoxDecoration(
            color: isScrolled ? AppColors.surface.withValues(alpha: 0.85) : Colors.transparent,
            border: Border(
              bottom: BorderSide(
                color: isScrolled ? AppColors.outline.withValues(alpha: 0.5) : Colors.transparent,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => context.go('/'),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/logo.svg',
                      width: mobile ? 30 : 38,
                      height: mobile ? 30 : 38,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'ARSLAN CAM AYNA',
                      style: GoogleFonts.inter(
                        fontSize: mobile ? 15 : 19,
                        fontWeight: FontWeight.w600,
                        letterSpacing: mobile ? 1.2 : 1.8,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              if (!mobile)
                Row(
                  children: [
                    _NavLink(title: 'ANA SAYFA', isActive: currentPath == '/', onTap: () => context.go('/')),
                    _NavLink(title: 'DRESUARLAR', isActive: currentPath == '/katalog/dresuarlar', onTap: () => context.go('/katalog/dresuarlar')),
                    _NavLink(title: 'AYNALAR', isActive: currentPath == '/katalog/aynalar', onTap: () => context.go('/katalog/aynalar')),
                    _NavLink(title: 'SEHPALAR', isActive: currentPath == '/katalog/sehpalar', onTap: () => context.go('/katalog/sehpalar')),
                    _NavLink(title: 'SAATLER', isActive: currentPath == '/katalog/saatler', onTap: () => context.go('/katalog/saatler')),
                    _NavLink(title: 'TABLOLAR', isActive: currentPath == '/katalog/tablolar', onTap: () => context.go('/katalog/tablolar')),
                    _NavLink(title: 'HAKKIMIZDA', isActive: currentPath == '/hakkimizda', onTap: () => context.go('/hakkimizda')),
                    _NavLink(title: 'ILETISIM', isActive: currentPath == '/iletisim', onTap: () => context.go('/iletisim')),
                  ],
                ),
              if (mobile)
                IconButton(
                  onPressed: onMenuTap,
                  icon: const Icon(Icons.menu, color: AppColors.textPrimary),
                  splashRadius: 24,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MobileMenuItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _MobileMenuItem({
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      onTap: onTap,
      title: Text(
        title,
        style: AppTextStyles.labelCaps.copyWith(
          color: isActive ? AppColors.accent : AppColors.textPrimary,
          letterSpacing: 1.8,
        ),
      ),
      trailing: isActive ? const Icon(Icons.chevron_right, color: AppColors.accent) : null,
    );
  }
}

class _NavLink extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;
  const _NavLink({required this.title, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final paddingLeft = width < 1300 ? 20.0 : 40.0;
    return Padding(
      padding: EdgeInsets.only(left: paddingLeft),
      child: InkWell(
        onTap: onTap,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.only(bottom: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isActive ? AppColors.accent : Colors.transparent,
                width: 1,
              ),
            ),
          ),
          child: Text(
            title,
            style: AppTextStyles.labelCaps.copyWith(
              color: isActive ? AppColors.accent : AppColors.textSecondary,
              letterSpacing: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 800;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Parallax effect on image
          Image.network(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuD33_TJUZ2dFUZFiMuWof32yMnpt6S0AIvcvZlB8qkSLi02ApSz00_6ZRfUYedp3_5Oc7CTgp4ACu1uCYl1Sx2cFXIjaRGCQvZesSAsBdOT6aV6gvnr0WW7UMzIcfAxXcr46sG8lvrUDSPgtMTrYrSFjaohhQAO574tmUaEpZGTq710BsPhitfgtCEexFqYvwfJvRjx3usLVlELFc_B1XXOKvUEPj66JHF5cQ9ro26W45Srceu9YE2uj71n8lz50_Z4VhExPEkL54c',
            fit: BoxFit.cover,
            color: Colors.black.withValues(alpha: 0.6), // Darken for premium feel
            colorBlendMode: BlendMode.darken,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'YANSIMALARDAKI ZARAFET',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.displayXl.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: isMobile ? 28 : 80,
                    ),
                  ).animate().fade(duration: 1000.ms, delay: 200.ms).slideY(begin: 0.1, end: 0, duration: 800.ms, curve: Curves.easeOutCubic),
                  SizedBox(height: isMobile ? 20 : 32),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Text(
                      'Geleneksel zanaatin modern estetikle bulustugu noktada, mekanlariniza derinlik ve isik katan el yapimi cam ve ayna tasarimlari.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyLg.copyWith(fontSize: isMobile ? 15 : 18, height: 1.5),
                    ),
                  ).animate().fade(duration: 1000.ms, delay: 400.ms).slideY(begin: 0.1, end: 0, duration: 800.ms, curve: Curves.easeOutCubic),
                  SizedBox(height: isMobile ? 28 : 64),
                  HoverButton(
                    text: 'Koleksiyonu Kesfet',
                    onTap: () {
                      context.go('/katalog/aynalar');
                    },
                  ).animate().fade(duration: 1000.ms, delay: 600.ms),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HoverButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final bool isLight;
  
  const HoverButton({super.key, required this.text, required this.onTap, this.isLight = false});

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48, vertical: isMobile ? 16 : 20),
          decoration: BoxDecoration(
            color: _isHovered 
                ? (widget.isLight ? AppColors.background : AppColors.textPrimary) 
                : Colors.transparent,
            border: Border.all(
                color: widget.isLight ? AppColors.background : AppColors.textPrimary, 
                width: 1),
          ),
          child: Text(
            widget.text.toUpperCase(),
            style: AppTextStyles.labelCaps.copyWith(
              color: _isHovered 
                  ? (widget.isLight ? AppColors.textPrimary : AppColors.background) 
                  : (widget.isLight ? AppColors.background : AppColors.textPrimary),
            ),
          ),
        ),
      ),
    );
  }
}

class CollectionsSection extends StatelessWidget {
  const CollectionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 800;
    
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 1440),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 120, vertical: isMobile ? 84 : 160),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('KOLEKSIYONLAR', style: AppTextStyles.labelCaps.copyWith(color: AppColors.accent)).animate().fade().slideY(begin: 0.5),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text('Mekana Deger Katan\nDokunuslar.', style: AppTextStyles.headlineLg.copyWith(fontSize: isMobile ? 40 : 56, height: 1.1))
                  .animate().fade(delay: 200.ms).slideY(begin: 0.2),
              ),
              if (!isMobile)
                Expanded(
                  child: Text(
                    'Her bir parca, isigin kirilmasini ve mekanin ferahligini optimize etmek icin ozel olarak tasarlanmistir.',
                    textAlign: TextAlign.right,
                    style: AppTextStyles.bodyLg,
                  ).animate().fade(delay: 300.ms),
                ),
            ],
          ),
          if (isMobile)
             Padding(
               padding: const EdgeInsets.only(top: 32.0),
               child: Text(
                  'Her bir parca, isigin kirilmasini ve mekanin ferahligini optimize etmek icin ozel olarak tasarlanmistir.',
                  style: AppTextStyles.bodyLg,
                ),
             ),
          SizedBox(height: isMobile ? 56 : 120),
          // Large edge-to-edge style cards
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: isMobile ? 0 : 1,
                fit: isMobile ? FlexFit.loose : FlexFit.tight,
                child: GestureDetector(
                  onTap: () => context.go('/katalog/saatler'),
                  child: const CollectionCard(
                    title: 'SAATLER',
                    subtitle: 'MODERN VE DEKORATIF',
                    imageUrl: 'assets/images/6.png',
                  ),
                ),
              ).animate().fade(delay: 400.ms).slideY(begin: 0.1),
              SizedBox(width: isMobile ? 0 : 48, height: isMobile ? 64 : 0),
              Flexible(
                flex: isMobile ? 0 : 1,
                fit: isMobile ? FlexFit.loose : FlexFit.tight,
                child: GestureDetector(
                  onTap: () => context.go('/katalog/aynalar'),
                  child: Padding(
                    padding: EdgeInsets.only(top: isMobile ? 0 : 80),
                    child: const CollectionCard(
                      title: 'AYNALAR',
                      subtitle: 'KLASIK VE MODERN TASARIMLAR',
                      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDaESMoJz85E10Mp-6S6sU--AAkA3j6naA9PJ2pobT-o9KuPGkfUxUDGAHtfnB5M68TaIW1NuuWsUrnNTi38vZYAssOa-KBLYmQOZSLsYJqC4A02CghHl3axme375PHVYPjzMgtQnKUWn8gTaHwVudSryNBIz2XvlTudaEB9gzgon21v7Ecn7ITIunxfxwrqTFLnOU6vF4K1MS8wjbz2gOJwdRQOVwq4RbzbMpw-f3AnmscK5V6U5IY3By2a7WBPDppf9FzbL6Njps',
                    ),
                  ),
                ),
              ).animate().fade(delay: 500.ms).slideY(begin: 0.1),
              SizedBox(width: isMobile ? 0 : 48, height: isMobile ? 64 : 0),
              Flexible(
                flex: isMobile ? 0 : 1,
                fit: isMobile ? FlexFit.loose : FlexFit.tight,
                child: GestureDetector(
                  onTap: () => context.go('/katalog/sehpalar'),
                  child: Padding(
                    padding: EdgeInsets.only(top: isMobile ? 0 : 80),
                    child: const CollectionCard(
                      title: 'SEHPALAR',
                      subtitle: 'MODERN TAMAMLAYICI',
                      imageUrl: 'https://picsum.photos/seed/sehpa1/600/800',
                    ),
                  ),
                ),
              ).animate().fade(delay: 550.ms).slideY(begin: 0.1),
              SizedBox(width: isMobile ? 0 : 48, height: isMobile ? 64 : 0),
              Flexible(
                flex: isMobile ? 0 : 1,
                fit: isMobile ? FlexFit.loose : FlexFit.tight,
                child: GestureDetector(
                  onTap: () => context.go('/katalog/dresuarlar'),
                  child: const CollectionCard(
                    title: 'DRESUARLAR',
                    subtitle: 'LUKS TAMAMLAYICI PARCALAR',
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD33_TJUZ2dFUZFiMuWof32yMnpt6S0AIvcvZlB8qkSLi02ApSz00_6ZRfUYedp3_5Oc7CTgp4ACu1uCYl1Sx2cFXIjaRGCQvZesSAsBdOT6aV6gvnr0WW7UMzIcfAxXcr46sG8lvrUDSPgtMTrYrSFjaohhQAO574tmUaEpZGTq710BsPhitfgtCEexFqYvwfJvRjx3usLVlELFc_B1XXOKvUEPj66JHF5cQ9ro26W45Srceu9YE2uj71n8lz50_Z4VhExPEkL54c',
                  ),
                ),
              ).animate().fade(delay: 600.ms).slideY(begin: 0.1),
            ],
          ),
        ],
      ),
    );
  }
}

class CollectionCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  const CollectionCard({super.key, required this.title, required this.subtitle, required this.imageUrl});

  @override
  State<CollectionCard> createState() => _CollectionCardState();
}

class _CollectionCardState extends State<CollectionCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final hasBoundedHeight = constraints.hasBoundedHeight && constraints.maxHeight.isFinite;

        Widget imageWidget = Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(),
          child: Stack(
            fit: StackFit.expand,
            children: [
              AnimatedScale(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOutCubic,
                scale: _isHovered ? 1.05 : 1.0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: widget.imageUrl.startsWith('http')
                      ? Image.network(widget.imageUrl, fit: BoxFit.contain)
                      : Image.asset(widget.imageUrl, fit: BoxFit.contain),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: _isHovered ? 0.2 : 0.0,
                child: Container(color: Colors.black),
              ),
            ],
          ),
        );

        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          cursor: SystemMouseCursors.click,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (hasBoundedHeight)
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: AspectRatio(aspectRatio: 1, child: imageWidget),
                  ),
                )
              else
                SizedBox(
                  width: double.infinity,
                  height: 320.0,
                  child: AspectRatio(aspectRatio: 1, child: imageWidget),
                ),
              const SizedBox(height: 20),
              Text(
                widget.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.headlineMd.copyWith(letterSpacing: 1.0),
              ),
              const SizedBox(height: 8),
              Text(
                widget.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.labelCaps.copyWith(color: AppColors.textSecondary),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TechnicalSpecsSection extends StatelessWidget {
  const TechnicalSpecsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    
    return Container(
      width: double.infinity,
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 72 : 120),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1440),
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 120),
          child: Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: isMobile ? 0 : 1, child: const SpecItem(number: '01', title: 'ULTRA NET CAM', desc: 'Yuksek isik gecirgenligi ve sifir renk distorsiyonu.')),
              SizedBox(width: isMobile ? 0 : 48, height: isMobile ? 48 : 0),
              Expanded(flex: isMobile ? 0 : 1, child: const SpecItem(number: '02', title: 'HASSAS KESIM', desc: 'CNC teknolojisi ile milimetrik dogrulukta uretim.')),
              SizedBox(width: isMobile ? 0 : 48, height: isMobile ? 48 : 0),
              Expanded(flex: isMobile ? 0 : 1, child: const SpecItem(number: '03', title: 'OZEL RODAJ', desc: 'Puruzsuz ve estetik kenar bitisleri.')),
              SizedBox(width: isMobile ? 0 : 48, height: isMobile ? 48 : 0),
              Expanded(flex: isMobile ? 0 : 1, child: const SpecItem(number: '04', title: 'EKOLOJIK URETIM', desc: 'Cevre dostu gumusleme ve kaplama surecleri.')),
            ],
          ),
        ),
      ),
    );
  }
}

class SpecItem extends StatelessWidget {
  final String number;
  final String title;
  final String desc;
  const SpecItem({super.key, required this.number, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(number, style: AppTextStyles.displayXl.copyWith(color: AppColors.outline, height: 1)),
        const SizedBox(height: 24),
        Text(title, style: AppTextStyles.labelCaps.copyWith(color: AppColors.accent)),
        const SizedBox(height: 16),
        Text(desc, style: AppTextStyles.bodyMd),
      ],
    );
  }
}

class BrandStripSection extends StatelessWidget {
  const BrandStripSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 800;
    
    return Container(
      width: double.infinity,
      color: AppColors.surfaceLight,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 72 : 120, horizontal: isMobile ? 20 : 64),
      child: Column(
        children: [
          Text(
            'ZANAATIN BERRAKLIGI',
            textAlign: TextAlign.center,
            style: AppTextStyles.displayXl.copyWith(color: AppColors.textPrimary, letterSpacing: isMobile ? 2 : 8, fontSize: isMobile ? 32 : 80),
          ),
          const SizedBox(height: 32),
          Text(
            'ARSLAN CAM AYNA ATOLYESI - 1988\'DEN BUGUNE',
            textAlign: TextAlign.center,
            style: AppTextStyles.labelCaps.copyWith(color: AppColors.accent, letterSpacing: 6),
          ),
        ],
      ),
    );
  }
}

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    return Container(
      color: AppColors.background,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 120, vertical: isMobile ? 56 : 80),
      child: Column(
        children: [
          Container(height: 1, color: AppColors.outline),
          const SizedBox(height: 64),
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ARSLAN CAM AYNA',
                style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 2, color: AppColors.textPrimary),
              ),
              SizedBox(height: isMobile ? 32 : 0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () => launchUrl(Uri.parse('https://www.instagram.com/arslan_cam_ayna/')),
                    child: Text('INSTAGRAM', style: AppTextStyles.labelCaps),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 64),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 12,
            children: [
              Text('(c) 2024 Tum haklari saklidir.', style: AppTextStyles.bodyMd.copyWith(fontSize: 12)),
              Text('Tasarim & Gelistirme', style: AppTextStyles.bodyMd.copyWith(fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }
}


