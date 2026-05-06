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

class AppColors {
  static const Color background = Color(0xFF121415);
  static const Color surface = Color(0xFF1C1E20);
  static const Color surfaceLight = Color(0xFF26282A);
  static const Color textPrimary = Color(0xFFEFEFEF);
  static const Color textSecondary = Color(0xFF9EA3A7);
  static const Color outline = Color(0xFF2C2F32);
  static const Color accent = Color(0xFFD4AF37);
}

class AppTextStyles {
  static TextStyle get displayXl => GoogleFonts.inter(
        fontSize: 72,
        fontWeight: FontWeight.w200,
        letterSpacing: -2,
        height: 1.1,
        color: AppColors.textPrimary,
      );
  static TextStyle get headlineLg => GoogleFonts.inter(
        fontSize: 48,
        fontWeight: FontWeight.w300,
        letterSpacing: -1,
        height: 1.2,
        color: AppColors.textPrimary,
      );
  static TextStyle get headlineMd => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        height: 1.35,
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
        letterSpacing: 3,
        color: AppColors.textPrimary,
      );
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => MainShell(child: child),
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
        if (mounted) setState(() => _isScrolled = isScrolled);
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
          StyleCollectionsSection(),
          LivingSpacesSection(),
          CraftsmanshipSection(),
          ProductShowcaseSection(),
          BrandApproachSection(),
          InstagramPreviewSection(),
          FinalCtaSection(),
          SiteFooter(),
        ],
      ),
    );
  }
}

class TopNavBar extends StatelessWidget {
  final bool isScrolled;
  const TopNavBar({super.key, required this.isScrolled});

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 900;
    final currentPath = GoRouterState.of(context).uri.path;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          height: 92,
          padding: EdgeInsets.symmetric(horizontal: mobile ? 24 : 60),
          decoration: BoxDecoration(
            color: isScrolled ? AppColors.surface.withValues(alpha: 0.78) : AppColors.surface.withValues(alpha: 0.22),
            border: Border(bottom: BorderSide(color: AppColors.outline.withValues(alpha: 0.5))),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => context.go('/'),
                child: Text(
                  'ARSLAN CAM AYNA',
                  style: GoogleFonts.inter(fontSize: 19, fontWeight: FontWeight.w600, letterSpacing: 2.2, color: AppColors.textPrimary),
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
              if (mobile) const Icon(Icons.menu, color: AppColors.textPrimary),
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
      padding: const EdgeInsets.only(left: 36),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: AppTextStyles.labelCaps.copyWith(color: isActive ? AppColors.accent : AppColors.textSecondary),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.98,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network('https://picsum.photos/seed/heroarslan/1920/1200', fit: BoxFit.cover),
          Container(color: Colors.black.withValues(alpha: 0.5)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 56),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Mekana Yansıyan\nSessiz Lüks',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.displayXl.copyWith(fontSize: isMobile ? 46 : 92, height: 1.03),
                ).animate().fade(duration: 900.ms).slideY(begin: 0.08, end: 0),
                const SizedBox(height: 24),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 760),
                  child: Text(
                    'Modern iç mekanlara özel cam ve ayna çözümlerini, editoryal bir sadelik içinde sunuyoruz.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyLg.copyWith(color: Colors.white.withValues(alpha: 0.86), fontSize: isMobile ? 16 : 20),
                  ),
                ).animate().fade(delay: 220.ms),
                const SizedBox(height: 48),
                HoverButton(text: 'Koleksiyonları Keşfet', onTap: () => context.go('/katalog/aynalar')).animate().fade(delay: 380.ms),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StyleCollectionsSection extends StatelessWidget {
  const StyleCollectionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    const items = [
      ('Noir Collection', 'Derin kontrast, siyah çerçeve', 'https://picsum.photos/seed/noir/1200/900'),
      ('Soft Beige', 'Sıcak tonlarda dingin yüzeyler', 'https://picsum.photos/seed/beige/1200/900'),
      ('Black Frame Series', 'Mimari çizgilerle güçlü ifade', 'https://picsum.photos/seed/frame/1200/900'),
      ('Modern Line', 'Yalın geometri, net yansıma', 'https://picsum.photos/seed/line/1200/900'),
      ('Oval Collection', 'Yumuşak formlarla zamansız görünüm', 'https://picsum.photos/seed/oval/1200/900'),
    ];
    return _SectionScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(
            eyebrow: 'KOLEKSİYONLAR',
            title: 'Stil Odaklı\nSeçkiler',
            desc: 'Noir Collection, Soft Beige ve Modern Line ile ürün değil mekan karakteri seçin.',
          ),
          const SizedBox(height: 42),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 3,
              crossAxisSpacing: 22,
              mainAxisSpacing: 22,
              childAspectRatio: isMobile ? 1.32 : 1.08,
            ),
            itemBuilder: (context, index) => _ImageOverlayCard(
              title: items[index].$1,
              subtitle: items[index].$2,
              imageUrl: items[index].$3,
            ),
          ),
        ],
      ),
    );
  }
}

class LivingSpacesSection extends StatelessWidget {
  const LivingSpacesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    const spaces = ['Antre', 'Salon', 'Yatak Odası', 'Cafe', 'Villa', 'Otel', 'Ofis'];
    return _SectionScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(
            eyebrow: 'YAŞAM ALANLARI',
            title: 'Ürün Değil,\nAtmosfer',
            desc: 'Koleksiyonların farklı mekanlarda yarattığı yaşam hissini keşfedin.',
          ),
          const SizedBox(height: 42),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: spaces.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: isMobile ? 1.34 : 1.2,
            ),
            itemBuilder: (context, index) => _ImageOverlayCard(
              title: spaces[index],
              subtitle: 'Mekan senaryosu',
              imageUrl: 'https://picsum.photos/seed/living$index/1200/900',
            ),
          ),
        ],
      ),
    );
  }
}

class CraftsmanshipSection extends StatelessWidget {
  const CraftsmanshipSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    const items = [
      ('Temperli Cam', 'Yüksek dayanım ve net görüntü için özel temperleme.'),
      ('Özel Ölçü Üretim', 'Mekana göre milimetrik ölçülendirme ve uygulama.'),
      ('Metal Çerçeve', 'İnce profil ve premium yüzey bitişleri.'),
      ('CNC İşçilik', 'Kesim ve rodajda hassas üretim standardı.'),
      ('Bronz Detaylar', 'Sıcak metal tonlarıyla rafine etki.'),
      ('Modern Yaklaşım', 'Ustalık ve teknolojinin dengeli birlikteliği.'),
    ];
    return Container(
      width: double.infinity,
      color: AppColors.surface.withValues(alpha: 0.55),
      child: _SectionScaffold(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionHeader(
              eyebrow: 'MALZEME & İŞÇİLİK',
              title: 'Modern Üretim,\nZamansız Sonuç',
              desc: 'Her yüzeyde kalite, her detayda dengeli bir işçilik yaklaşımı.',
            ),
            const SizedBox(height: 34),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : 2,
                crossAxisSpacing: 18,
                mainAxisSpacing: 14,
                childAspectRatio: isMobile ? 3.2 : 3.7,
              ),
              itemBuilder: (context, index) => _CraftItem(title: items[index].$1, desc: items[index].$2),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductShowcaseSection extends StatelessWidget {
  const ProductShowcaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _ShowcasePanel(
          title: 'Noir Mirror Panel',
          desc: 'Siyah çerçeve geometrisiyle modern antre kurguları.',
          imageUrl: 'https://picsum.photos/seed/showcase1/1800/1100',
          alignRight: false,
        ),
        _ShowcasePanel(
          title: 'Bronze Reflection',
          desc: 'Bronz yüzey dokusu ile sıcak ve rafine yaşam alanları.',
          imageUrl: 'https://picsum.photos/seed/showcase2/1800/1100',
          alignRight: true,
        ),
        _ShowcasePanel(
          title: 'Soft Oval Edition',
          desc: 'Yumuşak form diliyle dingin ve zamansız kompozisyonlar.',
          imageUrl: 'https://picsum.photos/seed/showcase3/1800/1100',
          alignRight: false,
        ),
      ],
    );
  }
}

class BrandApproachSection extends StatelessWidget {
  const BrandApproachSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    const values = [
      ('Minimal Tasarım', 'Sade ve mimariyle uyumlu yüzey dili.'),
      ('Modern İşçilik', 'Ustalıkla teknolojiyi birleştiren üretim.'),
      ('Özel Üretim', 'Her projeye özel ölçü ve detay yaklaşımı.'),
      ('Zamansız Detaylar', 'Yıllar içinde değerini koruyan seçimler.'),
    ];
    return _SectionScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(
            eyebrow: 'MARKA YAKLAŞIMI',
            title: 'Camı, Mekanın\nDiline Dönüştürüyoruz',
            desc: 'Sadelik, işçilik ve kalıcı estetik odaklı tasarım yaklaşımı.',
          ),
          const SizedBox(height: 32),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: values.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: isMobile ? 2.6 : 1.1,
            ),
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(border: Border.all(color: AppColors.outline)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(values[index].$1, style: AppTextStyles.headlineMd.copyWith(fontSize: 22)),
                  const SizedBox(height: 12),
                  Text(values[index].$2, style: AppTextStyles.bodyMd),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InstagramPreviewSection extends StatelessWidget {
  const InstagramPreviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return Container(
      width: double.infinity,
      color: AppColors.surface.withValues(alpha: 0.35),
      child: _SectionScaffold(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionHeader(
              eyebrow: 'INSTAGRAM PREVIEW',
              title: 'Curated Moodboard',
              desc: '@arslan_cam_ayna seçkilerinden ilham veren kareler.',
            ),
            const SizedBox(height: 34),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 2 : 4,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) => _InstaCard(imageUrl: 'https://picsum.photos/seed/insta$index/900/900'),
            ),
          ],
        ),
      ),
    );
  }
}

class FinalCtaSection extends StatelessWidget {
  const FinalCtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return _SectionScaffold(
      child: Column(
        children: [
          Text(
            'Mekanınıza Özel Çözümler',
            textAlign: TextAlign.center,
            style: AppTextStyles.headlineLg.copyWith(fontSize: isMobile ? 40 : 72, height: 1.04),
          ),
          const SizedBox(height: 20),
          Text(
            'WhatsApp, Instagram veya telefon üzerinden proje ekibimizle iletişime geçin.',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyLg,
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            alignment: WrapAlignment.center,
            children: [
              HoverButton(text: 'WhatsApp', onTap: () => launchUrl(Uri.parse('https://wa.me/905555550000'))),
              HoverButton(text: 'Instagram', onTap: () => launchUrl(Uri.parse('https://www.instagram.com/arslan_cam_ayna/'))),
              HoverButton(text: 'Telefon', onTap: () => launchUrl(Uri.parse('tel:+903125550000'))),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionScaffold extends StatelessWidget {
  final Widget child;
  const _SectionScaffold({required this.child});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 84, vertical: isMobile ? 84 : 124),
      child: child,
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String desc;
  const _SectionHeader({required this.eyebrow, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(eyebrow, style: AppTextStyles.labelCaps.copyWith(color: AppColors.accent)),
        const SizedBox(height: 14),
        Text(title, style: AppTextStyles.headlineLg.copyWith(fontSize: isMobile ? 40 : 68, height: 1.08)),
        const SizedBox(height: 16),
        ConstrainedBox(constraints: const BoxConstraints(maxWidth: 760), child: Text(desc, style: AppTextStyles.bodyLg)),
      ],
    );
  }
}

class _ImageOverlayCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  const _ImageOverlayCard({required this.title, required this.subtitle, required this.imageUrl});

  @override
  State<_ImageOverlayCard> createState() => _ImageOverlayCardState();
}

class _ImageOverlayCardState extends State<_ImageOverlayCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedScale(duration: const Duration(milliseconds: 700), curve: Curves.easeOutCubic, scale: _hover ? 1.03 : 1.0, child: Image.network(widget.imageUrl, fit: BoxFit.cover)),
            Container(color: Colors.black.withValues(alpha: _hover ? 0.52 : 0.4)),
            Positioned(
              left: 20,
              right: 20,
              bottom: 18,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.title, style: AppTextStyles.headlineMd.copyWith(fontSize: 29, color: Colors.white)),
                  const SizedBox(height: 6),
                  Text(widget.subtitle, style: AppTextStyles.bodyMd.copyWith(color: Colors.white.withValues(alpha: 0.88))),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animate().fade(duration: 700.ms).slideY(begin: 0.05, end: 0);
  }
}

class _CraftItem extends StatelessWidget {
  final String title;
  final String desc;
  const _CraftItem({required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(border: Border.all(color: AppColors.outline)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_outline, size: 20, color: AppColors.accent),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.labelCaps.copyWith(letterSpacing: 2)),
                const SizedBox(height: 8),
                Text(desc, style: AppTextStyles.bodyMd),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ShowcasePanel extends StatelessWidget {
  final String title;
  final String desc;
  final String imageUrl;
  final bool alignRight;
  const _ShowcasePanel({required this.title, required this.desc, required this.imageUrl, required this.alignRight});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return SizedBox(
      height: isMobile ? 440 : 620,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(imageUrl, fit: BoxFit.cover),
          Container(color: Colors.black.withValues(alpha: 0.38)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 84, vertical: isMobile ? 40 : 72),
            child: Align(
              alignment: alignRight && !isMobile ? Alignment.centerRight : Alignment.centerLeft,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: isMobile ? 420 : 560),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyles.headlineLg.copyWith(fontSize: isMobile ? 36 : 64, color: Colors.white, height: 1.08)),
                    const SizedBox(height: 16),
                    Text(desc, style: AppTextStyles.bodyLg.copyWith(color: Colors.white.withValues(alpha: 0.88))),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ).animate().fade(duration: 900.ms).slideY(begin: 0.05, end: 0);
  }
}

class _InstaCard extends StatefulWidget {
  final String imageUrl;
  const _InstaCard({required this.imageUrl});

  @override
  State<_InstaCard> createState() => _InstaCardState();
}

class _InstaCardState extends State<_InstaCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(widget.imageUrl, fit: BoxFit.cover),
          AnimatedContainer(duration: const Duration(milliseconds: 350), color: Colors.black.withValues(alpha: _hover ? 0.36 : 0.08)),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 350),
            opacity: _hover ? 1 : 0,
            child: Center(child: Text('INSTAGRAM', style: AppTextStyles.labelCaps.copyWith(color: Colors.white))),
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
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.textPrimary : Colors.transparent,
            border: Border.all(color: AppColors.textPrimary, width: 1),
          ),
          child: Text(
            widget.text.toUpperCase(),
            style: AppTextStyles.labelCaps.copyWith(color: _isHovered ? AppColors.background : AppColors.textPrimary),
          ),
        ),
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
        final imageHeight = hasBoundedHeight ? (constraints.maxHeight - 92).clamp(180.0, 520.0).toDouble() : 280.0;
        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          cursor: SystemMouseCursors.click,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: imageHeight,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AnimatedScale(duration: const Duration(milliseconds: 800), curve: Curves.easeOutCubic, scale: _isHovered ? 1.05 : 1.0, child: Image.network(widget.imageUrl, fit: BoxFit.cover)),
                    AnimatedOpacity(duration: const Duration(milliseconds: 400), opacity: _isHovered ? 0.2 : 0.0, child: Container(color: Colors.black)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(widget.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: AppTextStyles.headlineMd.copyWith(letterSpacing: 1)),
              const SizedBox(height: 8),
              Text(widget.subtitle, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTextStyles.labelCaps.copyWith(color: AppColors.textSecondary)),
            ],
          ),
        );
      },
    );
  }
}

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return Container(
      color: AppColors.background,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 84, vertical: 72),
      child: Column(
        children: [
          Container(height: 1, color: AppColors.outline),
          const SizedBox(height: 56),
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('ARSLAN CAM AYNA', style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: 2, color: AppColors.textPrimary)),
              SizedBox(height: isMobile ? 28 : 0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(onTap: () => launchUrl(Uri.parse('https://www.instagram.com/arslan_cam_ayna/')), child: Text('INSTAGRAM', style: AppTextStyles.labelCaps)),
                  const SizedBox(width: 28),
                  InkWell(onTap: () => launchUrl(Uri.parse('https://wa.me/905555550000')), child: Text('WHATSAPP', style: AppTextStyles.labelCaps)),
                  const SizedBox(width: 28),
                  InkWell(onTap: () => launchUrl(Uri.parse('tel:+903125550000')), child: Text('TELEFON', style: AppTextStyles.labelCaps)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 56),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('© 2026 Tüm hakları saklıdır.', style: AppTextStyles.bodyMd.copyWith(fontSize: 12)),
              Text('Arslan Cam Ayna Digital', style: AppTextStyles.bodyMd.copyWith(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
