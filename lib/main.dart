import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
          TopNavBar(isScrolled: _isScrolled),
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
          FeaturedProjectsSection(),
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

  const TopNavBar({
    super.key,
    required this.isScrolled,
  });

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 900;
    // Get current path to highlight active nav link
    final currentPath = GoRouterState.of(context).uri.path;
    
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Container(
          height: 96,
          padding: EdgeInsets.symmetric(horizontal: mobile ? 24 : 64),
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
                child: Text(
                  'ARSLAN CAM AYNA',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.0,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              if (!mobile)
                Row(
                  children: [
                    _NavLink(title: 'ANA SAYFA', isActive: currentPath == '/', onTap: () => context.go('/')),
                    _NavLink(title: 'AYNALAR', isActive: currentPath == '/katalog/aynalar', onTap: () => context.go('/katalog/aynalar')),
                    _NavLink(title: 'CAMLAR', isActive: currentPath == '/katalog/camlar', onTap: () => context.go('/katalog/camlar')),
                    _NavLink(title: 'DRESUARLAR', isActive: currentPath == '/katalog/dresuarlar', onTap: () => context.go('/katalog/dresuarlar')),
                    _NavLink(title: 'HAKKIMIZDA', isActive: currentPath == '/hakkimizda', onTap: () => context.go('/hakkimizda')),
                    _NavLink(title: 'İLETİŞİM', isActive: currentPath == '/iletisim', onTap: () => context.go('/iletisim')),
                  ],
                ),
              if (mobile)
                const Icon(Icons.menu, color: AppColors.textPrimary),
            ],
          ),
        ),
      ),
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
    return Padding(
      padding: const EdgeInsets.only(left: 48),
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
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBbAF675t9XVCrk67uXOk33MSB7ZIWQFDI2rwDqZy85LSR83M7YOiGK73L97PrFDog1MsLlvz386RfiCPWjAD85oSnAjVCx0go6_D8EPaLOgIi79p58y6Y50Of95vWbkkfS8qozPjAysQc6qhBAyoT5Mlad0_lWQ-HBM5dKg22dyb-ECkUY6DtzdKYMVVkTWThHZtQzRJmnYus3ArE05d3noaOkSUPpa2TZGeSqAQAeGU-alAbtS9T8FLE9xC3DOiRVTzX_Wa4uqfE',
            fit: BoxFit.cover,
            color: Colors.black.withValues(alpha: 0.6), // Darken for premium feel
            colorBlendMode: BlendMode.darken,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'YANSIMALARDAKİ ZARAFET',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.displayXl.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: isMobile ? 40 : 80,
                    ),
                  ).animate().fade(duration: 1000.ms, delay: 200.ms).slideY(begin: 0.1, end: 0, duration: 800.ms, curve: Curves.easeOutCubic),
                  const SizedBox(height: 32),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Text(
                      'Geleneksel zanaatın modern estetikle buluştuğu noktada, mekanlarınıza derinlik ve ışık katan el yapımı cam ve ayna tasarımları.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyLg,
                    ),
                  ).animate().fade(duration: 1000.ms, delay: 400.ms).slideY(begin: 0.1, end: 0, duration: 800.ms, curve: Curves.easeOutCubic),
                  const SizedBox(height: 64),
                  HoverButton(
                    text: 'Koleksiyonu Keşfet',
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
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
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
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 32 : 120, vertical: 160),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('KOLEKSİYONLAR', style: AppTextStyles.labelCaps.copyWith(color: AppColors.accent)).animate().fade().slideY(begin: 0.5),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text('Mekana Değer Katan\nDokunuşlar.', style: AppTextStyles.headlineLg.copyWith(fontSize: isMobile ? 40 : 56, height: 1.1))
                  .animate().fade(delay: 200.ms).slideY(begin: 0.2),
              ),
              if (!isMobile)
                Expanded(
                  child: Text(
                    'Her bir parça, ışığın kırılmasını ve mekanın ferahlığını optimize etmek için özel olarak tasarlanmıştır.',
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
                  'Her bir parça, ışığın kırılmasını ve mekanın ferahlığını optimize etmek için özel olarak tasarlanmıştır.',
                  style: AppTextStyles.bodyLg,
                ),
             ),
          const SizedBox(height: 120),
          // Large edge-to-edge style cards
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: isMobile ? 0 : 1,
                child: GestureDetector(
                  onTap: () => context.go('/katalog/aynalar'),
                  child: const CollectionCard(
                    title: 'AYNALAR',
                    subtitle: 'KLASİK VE MODERN TASARIMLAR',
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDaESMoJz85E10Mp-6S6sU--AAkA3j6naA9PJ2pobT-o9KuPGkfUxUDGAHtfnB5M68TaIW1NuuWsUrnNTi38vZYAssOa-KBLYmQOZSLsYJqC4A02CghHl3axme375PHVYPjzMgtQnKUWn8gTaHwVudSryNBIz2XvlTudaEB9gzgon21v7Ecn7ITIunxfxwrqTFLnOU6vF4K1MS8wjbz2gOJwdRQOVwq4RbzbMpw-f3AnmscK5V6U5IY3By2a7WBPDppf9FzbL6Njps',
                  ),
                ),
              ).animate().fade(delay: 400.ms).slideY(begin: 0.1),
              SizedBox(width: isMobile ? 0 : 48, height: isMobile ? 64 : 0),
              Expanded(
                flex: isMobile ? 0 : 1,
                child: GestureDetector(
                  onTap: () => context.go('/katalog/camlar'),
                  child: Padding(
                    padding: EdgeInsets.only(top: isMobile ? 0 : 80),
                    child: const CollectionCard(
                      title: 'CAM ÜRÜNLER',
                      subtitle: 'MİMARİ ÇÖZÜMLER',
                      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAFrARYGGayXff0f_qPe5Ug0D9dejkeCf4xSFPaftwhhHIHfVllW-QZuMKbdJzL7tdTDEoh3EYsrj8dWIojk48v-Kbm1NQNUQO4gOK0ghgr797LtliWGHu537vCQu5nl8iCvkXDBK4Ec3Xi8uWgH79HczHr2fdNTtuTMPzTna88MUn78eKe7bRgsNsoCVgQ3vV1pSLcWVhYIyypPiUsRcMvPe_GJSzDhqf48paJIszJoPjScrv_Rmf6izT0P2S04y8K65Zhmk49LYY',
                    ),
                  ),
                ),
              ).animate().fade(delay: 500.ms).slideY(begin: 0.1),
              SizedBox(width: isMobile ? 0 : 48, height: isMobile ? 64 : 0),
              Expanded(
                flex: isMobile ? 0 : 1,
                child: GestureDetector(
                  onTap: () => context.go('/katalog/dresuarlar'),
                  child: const CollectionCard(
                    title: 'DRESUARLAR',
                    subtitle: 'LÜKS TAMAMLAYICI PARÇALAR',
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
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AnimatedScale(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeOutCubic,
                    scale: _isHovered ? 1.05 : 1.0,
                    child: Image.network(widget.imageUrl, fit: BoxFit.cover),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 400),
                    opacity: _isHovered ? 0.2 : 0.0,
                    child: Container(color: Colors.black),
                  ),
                ],
              ),
            ),
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
      padding: const EdgeInsets.symmetric(vertical: 120),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1440),
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 32 : 120),
          child: Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: isMobile ? 0 : 1, child: const SpecItem(number: '01', title: 'ULTRA NET CAM', desc: 'Yüksek ışık geçirgenliği ve sıfır renk distorsiyonu.')),
              SizedBox(width: isMobile ? 0 : 48, height: isMobile ? 48 : 0),
              Expanded(flex: isMobile ? 0 : 1, child: const SpecItem(number: '02', title: 'HASSAS KESİM', desc: 'CNC teknolojisi ile milimetrik doğrulukta üretim.')),
              SizedBox(width: isMobile ? 0 : 48, height: isMobile ? 48 : 0),
              Expanded(flex: isMobile ? 0 : 1, child: const SpecItem(number: '03', title: 'ÖZEL RODAJ', desc: 'Pürüzsüz ve estetik kenar bitişleri.')),
              SizedBox(width: isMobile ? 0 : 48, height: isMobile ? 48 : 0),
              Expanded(flex: isMobile ? 0 : 1, child: const SpecItem(number: '04', title: 'EKOLOJİK ÜRETİM', desc: 'Çevre dostu gümüşleme ve kaplama süreçleri.')),
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

class FeaturedProjectsSection extends StatelessWidget {
  const FeaturedProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 800;

    return Container(
      constraints: const BoxConstraints(maxWidth: 1440),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 32 : 120, vertical: 160),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('ÖNE ÇIKAN PROJELER', style: AppTextStyles.headlineLg.copyWith(fontSize: isMobile ? 32 : 48)),
              if (!isMobile)
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.textPrimary))),
                  child: Text('TÜMÜNÜ GÖRÜNTÜLE', style: AppTextStyles.labelCaps),
                ),
            ],
          ),
          const SizedBox(height: 96),
          if (isMobile)
            const Column(
              children: [
                SizedBox(height: 400, child: ProjectCard(
                  imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCJNCmyQquczzPiaJw6dy9lvV0MeFUVmMrhwSWaC7-4C1yRPsDj3DCBIxxlbK9YthSJIi4e3yYldIEnRqb2f0QVq3Z6ehRxxiflTiZH84ZJq6dA7QSrh2BRef_IO5ePMLCknGn_YfQgDeCqRFu8bxyCJyiqdew42FcXhRhS83Z-5egOgPqNxDIR_ZTJW07SstTKEx_ONLballJE1XdarbDFOQuXkx307g4KEqCFssC8HTrDGEsK6hTNJy7nBScPar04v0Jm6nafckA',
                  location: 'İSTANBUL / 2023',
                  title: 'MARINA RESIDENCE LOBİ',
                )),
                SizedBox(height: 32),
                SizedBox(height: 400, child: ProjectCard(
                  imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBDgBwtqhRyMhh32bhFpDC-GA_rflROrP94ovsZUu41jKtonF1FvNjc-yzD7-dXejcrC3eNRbrDjTVV8TZI6JPuuuX2wioXniBt3va28QRvK2hKGJxFNexMKv2JR62xAu4j8wDaoRH7I5lTgVw0gSMt-Yd8xI4m32BWQLWEV4qPsyNO1hxGFIwZIE_rHhhEVfWUbh4DbDSBvImB0y2POZuZjtlQLROPyRVMaAYnzBWkdAXDXIv0BnSmp98NxXGG5DBg2lYyu60JOo4',
                  location: 'ANKARA / 2024',
                  title: 'VİLLA K MODERNA',
                )),
              ],
            )
          else
            const SizedBox(
              height: 500,
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: ProjectCard(
                      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCJNCmyQquczzPiaJw6dy9lvV0MeFUVmMrhwSWaC7-4C1yRPsDj3DCBIxxlbK9YthSJIi4e3yYldIEnRqb2f0QVq3Z6ehRxxiflTiZH84ZJq6dA7QSrh2BRef_IO5ePMLCknGn_YfQgDeCqRFu8bxyCJyiqdew42FcXhRhS83Z-5egOgPqNxDIR_ZTJW07SstTKEx_ONLballJE1XdarbDFOQuXkx307g4KEqCFssC8HTrDGEsK6hTNJy7nBScPar04v0Jm6nafckA',
                      location: 'İSTANBUL / 2023',
                      title: 'MARINA RESIDENCE LOBİ',
                    ),
                  ),
                  SizedBox(width: 48),
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Expanded(
                          child: ProjectCard(
                            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBDgBwtqhRyMhh32bhFpDC-GA_rflROrP94ovsZUu41jKtonF1FvNjc-yzD7-dXejcrC3eNRbrDjTVV8TZI6JPuuuX2wioXniBt3va28QRvK2hKGJxFNexMKv2JR62xAu4j8wDaoRH7I5lTgVw0gSMt-Yd8xI4m32BWQLWEV4qPsyNO1hxGFIwZIE_rHhhEVfWUbh4DbDSBvImB0y2POZuZjtlQLROPyRVMaAYnzBWkdAXDXIv0BnSmp98NxXGG5DBg2lYyu60JOo4',
                            location: 'ANKARA / 2024',
                            title: 'VİLLA K MODERNA',
                          ),
                        ),
                        SizedBox(height: 48),
                        Expanded(
                          child: ProjectCard(
                            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuChB1orEKshO9K3vaozq_MHFoRKd0R9C9aYoTXGOucxLpjdJuITwHzCQ7NA158BCrj4y9tpWNKgIB6wqjrODOp4Dxe-gwSKRM_YA9t-3UuiWLgOdJauvKlGXewJaqfm3ZrsQibPE8lf8tydMCsIpVaRIb0QBGrzbcPqfPwEDd8amUiTYfMpPXFrpy02PjOA16yJApok5P7s9ljxNOheOu9u94p4RhMGt5ey8imZoW2kVQ8OQc5TGJR3CPwAsNMpo11TWgUeOsAimnQ',
                            location: 'İZMİR / 2023',
                            title: 'CENTER OFFICE',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String imageUrl;
  final String location;
  final String title;

  const ProjectCard({super.key, required this.imageUrl, required this.location, required this.title});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(),
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedScale(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeOutCubic,
              scale: _isHovered ? 1.05 : 1.0,
              child: ColorFiltered(
                colorFilter: ColorFilter.matrix(_isHovered ? _colorMatrix : _grayscaleMatrix),
                child: Image.network(widget.imageUrl, fit: BoxFit.cover),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 600),
              opacity: _isHovered ? 1.0 : 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withValues(alpha: 0.8), Colors.transparent],
                  ),
                ),
                padding: const EdgeInsets.all(48),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.location, style: AppTextStyles.labelCaps.copyWith(color: AppColors.accent)),
                    const SizedBox(height: 16),
                    Text(widget.title, style: AppTextStyles.headlineMd.copyWith(color: Colors.white, fontSize: 32)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static const List<double> _grayscaleMatrix = [
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0,      0,      0,      1, 0,
  ];

  static const List<double> _colorMatrix = [
    1, 0, 0, 0, 0,
    0, 1, 0, 0, 0,
    0, 0, 1, 0, 0,
    0, 0, 0, 1, 0,
  ];
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
      padding: EdgeInsets.symmetric(vertical: 120, horizontal: isMobile ? 32 : 64),
      child: Column(
        children: [
          Text(
            'ZANAATIN BERRAKLIĞI',
            textAlign: TextAlign.center,
            style: AppTextStyles.displayXl.copyWith(color: AppColors.textPrimary, letterSpacing: 8, fontSize: isMobile ? 40 : 80),
          ),
          const SizedBox(height: 32),
          Text(
            'ARSLAN CAM AYNA ATÖLYESİ — 1988\'DEN BUGÜNE',
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
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 32 : 120, vertical: 80),
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
                  const SizedBox(width: 32),
                  Text('PINTEREST', style: AppTextStyles.labelCaps),
                  const SizedBox(width: 32),
                  Text('LINKEDIN', style: AppTextStyles.labelCaps),
                ],
              )
            ],
          ),
          const SizedBox(height: 64),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('© 2024 Tüm hakları saklıdır.', style: AppTextStyles.bodyMd.copyWith(fontSize: 12)),
              Text('Tasarım & Geliştirme', style: AppTextStyles.bodyMd.copyWith(fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }
}
