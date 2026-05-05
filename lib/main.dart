import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'pages.dart';

enum PageType { home, catalogAynalar, catalogCamlar, catalogDresuarlar, about, contact, productDetail }

void main() {
  runApp(const ArslanCamAynaApp());
}

// --- DESIGN SYSTEM ---
class AppColors {
  static const Color background = Color(0xFFF9F9F9);
  static const Color textPrimary = Color(0xFF1A1C1C);
  static const Color textSecondary = Color(0xFF5F5E5B);
  static const Color charcoal = Color(0xFF121212);
  static const Color outline = Color(0xFFE2E2E2);
  static const Color lightBg = Color(0xFFF3F3F3);
}

class AppTextStyles {
  static TextStyle get displayXl => GoogleFonts.inter(
        fontSize: 72,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.44,
        height: 1.1,
        color: AppColors.textPrimary,
      );
  static TextStyle get headlineLg => GoogleFonts.inter(
        fontSize: 40,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.4,
        height: 1.2,
        color: AppColors.textPrimary,
      );
  static TextStyle get headlineMd => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.48,
        height: 1.4,
        color: AppColors.textPrimary,
      );
  static TextStyle get bodyLg => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        height: 1.6,
        color: AppColors.textSecondary,
      );
  static TextStyle get bodyMd => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: AppColors.textSecondary,
      );
  static TextStyle get labelCaps => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.8,
        height: 1.0,
        color: AppColors.textPrimary,
      );
}

class ArslanCamAynaApp extends StatelessWidget {
  const ArslanCamAynaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arslan Cam Ayna',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.light(
          primary: AppColors.charcoal,
          surface: AppColors.background,
          onSurface: AppColors.textPrimary,
        ),
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: const MainShell(),
    );
  }
}

// --- MAIN SHELL ---
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  PageType _currentPage = PageType.home;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 50 && !_isScrolled) {
        setState(() => _isScrolled = true);
      } else if (_scrollController.offset <= 50 && _isScrolled) {
        setState(() => _isScrolled = false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onNavigate(PageType page) {
    setState(() {
      _currentPage = page;
    });
    _scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                if (_currentPage == PageType.home) HomeContent(onNavigate: _onNavigate),
                if (_currentPage == PageType.catalogAynalar) CatalogContent(onNavigate: _onNavigate, category: 'Aynalar'),
                if (_currentPage == PageType.catalogCamlar) CatalogContent(onNavigate: _onNavigate, category: 'Camlar'),
                if (_currentPage == PageType.catalogDresuarlar) CatalogContent(onNavigate: _onNavigate, category: 'Dresuarlar'),
                if (_currentPage == PageType.about) AboutContent(onNavigate: _onNavigate),
                if (_currentPage == PageType.contact) const ContactContent(),
                if (_currentPage == PageType.productDetail) ProductDetailContent(onNavigate: _onNavigate),
                SiteFooter(onNavigate: _onNavigate),
              ],
            ),
          ),
          TopNavBar(
            isScrolled: _isScrolled,
            currentPage: _currentPage,
            onNavigate: _onNavigate,
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final ValueChanged<PageType> onNavigate;
  const HomeContent({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeroSection(),
        CollectionsSection(onNavigate: onNavigate),
        const TechnicalSpecsSection(),
        FeaturedProjectsSection(),
        BrandStripSection(),
      ],
    );
  }
}

// --- COMPONENTS ---

class TopNavBar extends StatelessWidget {
  final bool isScrolled;
  final PageType currentPage;
  final ValueChanged<PageType> onNavigate;

  const TopNavBar({
    super.key,
    required this.isScrolled,
    required this.currentPage,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 900;
    
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Container(
          height: 96,
          padding: EdgeInsets.symmetric(horizontal: mobile ? 24 : 64),
          decoration: BoxDecoration(
            color: isScrolled ? AppColors.charcoal : AppColors.charcoal.withValues(alpha: 0.7),
            border: Border(
              bottom: BorderSide(
                color: isScrolled ? Colors.white24 : Colors.transparent,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => onNavigate(PageType.home),
                child: Text(
                  'ARSLAN CAM AYNA',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                    color: Colors.white,
                  ),
                ),
              ),
              if (!mobile)
                Row(
                  children: [
                    _NavLink(title: 'ANA SAYFA', isActive: currentPage == PageType.home, onTap: () => onNavigate(PageType.home)),
                    _NavLink(title: 'AYNALAR', isActive: currentPage == PageType.catalogAynalar, onTap: () => onNavigate(PageType.catalogAynalar)),
                    _NavLink(title: 'CAMLAR', isActive: currentPage == PageType.catalogCamlar, onTap: () => onNavigate(PageType.catalogCamlar)),
                    _NavLink(title: 'DRESUARLAR', isActive: currentPage == PageType.catalogDresuarlar, onTap: () => onNavigate(PageType.catalogDresuarlar)),
                    _NavLink(title: 'HAKKIMIZDA', isActive: currentPage == PageType.about, onTap: () => onNavigate(PageType.about)),
                    _NavLink(title: 'İLETİŞİM', isActive: currentPage == PageType.contact, onTap: () => onNavigate(PageType.contact)),
                  ],
                ),
              if (mobile)
                const Icon(Icons.menu, color: Colors.white),
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
                color: isActive ? Colors.white : Colors.transparent,
                width: 1,
              ),
            ),
          ),
          child: Text(
            title,
            style: AppTextStyles.labelCaps.copyWith(
              color: isActive ? Colors.white : Colors.white70,
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
          Image.network(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBbAF675t9XVCrk67uXOk33MSB7ZIWQFDI2rwDqZy85LSR83M7YOiGK73L97PrFDog1MsLlvz386RfiCPWjAD85oSnAjVCx0go6_D8EPaLOgIi79p58y6Y50Of95vWbkkfS8qozPjAysQc6qhBAyoT5Mlad0_lWQ-HBM5dKg22dyb-ECkUY6DtzdKYMVVkTWThHZtQzRJmnYus3ArE05d3noaOkSUPpa2TZGeSqAQAeGU-alAbtS9T8FLE9xC3DOiRVTzX_Wa4uqfE',
            fit: BoxFit.cover,
            color: Colors.black.withValues(alpha: 0.4),
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
                      color: Colors.white,
                      fontSize: isMobile ? 48 : 72,
                      letterSpacing: 4,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Text(
                      'Geleneksel zanaatın modern estetikle buluştuğu noktada, mekanlarınıza derinlik ve ışık katan el yapımı cam ve ayna tasarımları.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyLg.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  HoverButton(
                    text: 'KEŞFEDİN',
                    onTap: () {},
                  ),
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
  const HoverButton({super.key, required this.text, required this.onTap});

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
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
          decoration: BoxDecoration(
            color: _isHovered ? Colors.white : Colors.transparent,
            border: Border.all(color: Colors.white, width: 1),
          ),
          child: Text(
            widget.text,
            style: AppTextStyles.labelCaps.copyWith(
              color: _isHovered ? AppColors.charcoal : Colors.white,
              letterSpacing: 3,
            ),
          ),
        ),
      ),
    );
  }
}

class CollectionsSection extends StatelessWidget {
  final ValueChanged<PageType> onNavigate;
  const CollectionsSection({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 800;
    
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 1440),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 32 : 64, vertical: 160),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('KOLEKSİYONLAR', style: AppTextStyles.labelCaps.copyWith(color: AppColors.textSecondary)),
                    const SizedBox(height: 16),
                    Text('MEKANA DEĞER KATAN DOKUNUŞLAR', style: AppTextStyles.headlineLg.copyWith(fontSize: isMobile ? 32 : 40)),
                  ],
                ),
              ),
              if (!isMobile)
                Expanded(
                  child: Text(
                    'Her bir parça, ışığın kırılmasını ve mekanın ferahlığını optimize etmek için özel olarak tasarlanmıştır.',
                    textAlign: TextAlign.right,
                    style: AppTextStyles.bodyMd,
                  ),
                ),
            ],
          ),
          if (isMobile)
             Padding(
               padding: const EdgeInsets.only(top: 24.0),
               child: Text(
                  'Her bir parça, ışığın kırılmasını ve mekanın ferahlığını optimize etmek için özel olarak tasarlanmıştır.',
                  style: AppTextStyles.bodyMd,
                ),
             ),
          const SizedBox(height: 96),
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: isMobile ? 0 : 1,
                child: GestureDetector(
                  onTap: () => onNavigate(PageType.catalogAynalar),
                  child: const CollectionCard(
                    title: 'AYNALAR',
                    subtitle: 'KLASİK VE MODERN TASARIMLAR',
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDaESMoJz85E10Mp-6S6sU--AAkA3j6naA9PJ2pobT-o9KuPGkfUxUDGAHtfnB5M68TaIW1NuuWsUrnNTi38vZYAssOa-KBLYmQOZSLsYJqC4A02CghHl3axme375PHVYPjzMgtQnKUWn8gTaHwVudSryNBIz2XvlTudaEB9gzgon21v7Ecn7ITIunxfxwrqTFLnOU6vF4K1MS8wjbz2gOJwdRQOVwq4RbzbMpw-f3AnmscK5V6U5IY3By2a7WBPDppf9FzbL6Njps',
                  ),
                ),
              ),
              SizedBox(width: isMobile ? 0 : 48, height: isMobile ? 48 : 0),
              Expanded(
                flex: isMobile ? 0 : 1,
                child: GestureDetector(
                  onTap: () => onNavigate(PageType.catalogCamlar),
                  child: const CollectionCard(
                    title: 'CAM ÜRÜNLER',
                    subtitle: 'MİMARİ ÇÖZÜMLER',
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAFrARYGGayXff0f_qPe5Ug0D9dejkeCf4xSFPaftwhhHIHfVllW-QZuMKbdJzL7tdTDEoh3EYsrj8dWIojk48v-Kbm1NQNUQO4gOK0ghgr797LtliWGHu537vCQu5nl8iCvkXDBK4Ec3Xi8uWgH79HczHr2fdNTtuTMPzTna88MUn78eKe7bRgsNsoCVgQ3vV1pSLcWVhYIyypPiUsRcMvPe_GJSzDhqf48paJIszJoPjScrv_Rmf6izT0P2S04y8K65Zhmk49LYY',
                  ),
                ),
              ),
              SizedBox(width: isMobile ? 0 : 48, height: isMobile ? 48 : 0),
              Expanded(
                flex: isMobile ? 0 : 1,
                child: GestureDetector(
                  onTap: () => onNavigate(PageType.catalogDresuarlar),
                  child: const CollectionCard(
                    title: 'DRESUARLAR',
                    subtitle: 'LÜKS TAMAMLAYICI PARÇALAR',
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD33_TJUZ2dFUZFiMuWof32yMnpt6S0AIvcvZlB8qkSLi02ApSz00_6ZRfUYedp3_5Oc7CTgp4ACu1uCYl1Sx2cFXIjaRGCQvZesSAsBdOT6aV6gvnr0WW7UMzIcfAxXcr46sG8lvrUDSPgtMTrYrSFjaohhQAO574tmUaEpZGTq710BsPhitfgtCEexFqYvwfJvRjx3usLVlELFc_B1XXOKvUEPj66JHF5cQ9ro26W45Srceu9YE2uj71n8lz50_Z4VhExPEkL54c',
                  ),
                ),
              ),
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
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isBounded = constraints.maxHeight != double.infinity;
          Widget imageWidget = Container(
            width: double.infinity,
            decoration: BoxDecoration(border: Border.all(color: AppColors.outline)),
            child: ClipRRect(
              child: TweenAnimationBuilder(
                duration: const Duration(milliseconds: 700),
                tween: Tween<double>(begin: 1.0, end: _isHovered ? 1.05 : 1.0),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Image.network(widget.imageUrl, fit: BoxFit.cover),
                  );
                },
              ),
            ),
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isBounded)
                Expanded(child: imageWidget)
              else
                AspectRatio(aspectRatio: 4 / 5, child: imageWidget),
              const SizedBox(height: 24),
              Text(widget.title, style: AppTextStyles.headlineMd.copyWith(letterSpacing: 0)),
              const SizedBox(height: 8),
              Text(widget.subtitle, style: AppTextStyles.labelCaps.copyWith(color: AppColors.textSecondary)),
            ],
          );
        },
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
      color: AppColors.lightBg,
      padding: const EdgeInsets.symmetric(vertical: 96),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1440),
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 32 : 64),
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
        const SizedBox(height: 16),
        Text(title, style: AppTextStyles.labelCaps),
        const SizedBox(height: 8),
        Text(desc, style: AppTextStyles.bodyMd.copyWith(fontSize: 14)),
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
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 32 : 64, vertical: 160),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('ÖNE ÇIKAN PROJELER', style: AppTextStyles.headlineLg.copyWith(fontSize: isMobile ? 32 : 40)),
              if (!isMobile)
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.charcoal))),
                  child: Text('TÜMÜNÜ GÖRÜNTÜLE', style: AppTextStyles.labelCaps),
                ),
            ],
          ),
          const SizedBox(height: 96),
          if (isMobile)
            Column(
              children: [
                SizedBox(height: 400, child: ProjectCard(
                  imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCJNCmyQquczzPiaJw6dy9lvV0MeFUVmMrhwSWaC7-4C1yRPsDj3DCBIxxlbK9YthSJIi4e3yYldIEnRqb2f0QVq3Z6ehRxxiflTiZH84ZJq6dA7QSrh2BRef_IO5ePMLCknGn_YfQgDeCqRFu8bxyCJyiqdew42FcXhRhS83Z-5egOgPqNxDIR_ZTJW07SstTKEx_ONLballJE1XdarbDFOQuXkx307g4KEqCFssC8HTrDGEsK6hTNJy7nBScPar04v0Jm6nafckA',
                  location: 'İSTANBUL / 2023',
                  title: 'MARINA RESIDENCE LOBİ',
                )),
                const SizedBox(height: 32),
                SizedBox(height: 400, child: ProjectCard(
                  imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBDgBwtqhRyMhh32bhFpDC-GA_rflROrP94ovsZUu41jKtonF1FvNjc-yzD7-dXejcrC3eNRbrDjTVV8TZI6JPuuuX2wioXniBt3va28QRvK2hKGJxFNexMKv2JR62xAu4j8wDaoRH7I5lTgVw0gSMt-Yd8xI4m32BWQLWEV4qPsyNO1hxGFIwZIE_rHhhEVfWUbh4DbDSBvImB0y2POZuZjtlQLROPyRVMaAYnzBWkdAXDXIv0BnSmp98NxXGG5DBg2lYyu60JOo4',
                  location: 'ANKARA / 2024',
                  title: 'VİLLA K MODERNA',
                )),
                const SizedBox(height: 32),
                SizedBox(height: 400, child: ProjectCard(
                  imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuChB1orEKshO9K3vaozq_MHFoRKd0R9C9aYoTXGOucxLpjdJuITwHzCQ7NA158BCrj4y9tpWNKgIB6wqjrODOp4Dxe-gwSKRM_YA9t-3UuiWLgOdJauvKlGXewJaqfm3ZrsQibPE8lf8tydMCsIpVaRIb0QBGrzbcPqfPwEDd8amUiTYfMpPXFrpy02PjOA16yJApok5P7s9ljxNOheOu9u94p4RhMGt5ey8imZoW2kVQ8OQc5TGJR3CPwAsNMpo11TWgUeOsAimnQ',
                  location: 'İZMİR / 2023',
                  title: 'CENTER OFFICE CAM TASARIM',
                )),
              ],
            )
          else
            SizedBox(
              height: 600,
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: ProjectCard(
                      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCJNCmyQquczzPiaJw6dy9lvV0MeFUVmMrhwSWaC7-4C1yRPsDj3DCBIxxlbK9YthSJIi4e3yYldIEnRqb2f0QVq3Z6ehRxxiflTiZH84ZJq6dA7QSrh2BRef_IO5ePMLCknGn_YfQgDeCqRFu8bxyCJyiqdew42FcXhRhS83Z-5egOgPqNxDIR_ZTJW07SstTKEx_ONLballJE1XdarbDFOQuXkx307g4KEqCFssC8HTrDGEsK6hTNJy7nBScPar04v0Jm6nafckA',
                      location: 'İSTANBUL / 2023',
                      title: 'MARINA RESIDENCE LOBİ',
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Expanded(
                          child: ProjectCard(
                            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBDgBwtqhRyMhh32bhFpDC-GA_rflROrP94ovsZUu41jKtonF1FvNjc-yzD7-dXejcrC3eNRbrDjTVV8TZI6JPuuuX2wioXniBt3va28QRvK2hKGJxFNexMKv2JR62xAu4j8wDaoRH7I5lTgVw0gSMt-Yd8xI4m32BWQLWEV4qPsyNO1hxGFIwZIE_rHhhEVfWUbh4DbDSBvImB0y2POZuZjtlQLROPyRVMaAYnzBWkdAXDXIv0BnSmp98NxXGG5DBg2lYyu60JOo4',
                            location: 'ANKARA / 2024',
                            title: 'VİLLA K MODERNA',
                          ),
                        ),
                        const SizedBox(height: 32),
                        Expanded(
                          child: ProjectCard(
                            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuChB1orEKshO9K3vaozq_MHFoRKd0R9C9aYoTXGOucxLpjdJuITwHzCQ7NA158BCrj4y9tpWNKgIB6wqjrODOp4Dxe-gwSKRM_YA9t-3UuiWLgOdJauvKlGXewJaqfm3ZrsQibPE8lf8tydMCsIpVaRIb0QBGrzbcPqfPwEDd8amUiTYfMpPXFrpy02PjOA16yJApok5P7s9ljxNOheOu9u94p4RhMGt5ey8imZoW2kVQ8OQc5TGJR3CPwAsNMpo11TWgUeOsAimnQ',
                            location: 'İZMİR / 2023',
                            title: 'CENTER OFFICE CAM TASARIM',
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
        decoration: BoxDecoration(border: Border.all(color: AppColors.outline)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            TweenAnimationBuilder(
              duration: const Duration(milliseconds: 700),
              tween: Tween<double>(begin: 1.0, end: _isHovered ? 1.05 : 1.0),
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.matrix(_isHovered ? _colorMatrix : _grayscaleMatrix),
                    child: Image.network(widget.imageUrl, fit: BoxFit.cover),
                  ),
                );
              },
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _isHovered ? 1.0 : 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withValues(alpha: 0.6), Colors.transparent],
                  ),
                ),
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.location, style: AppTextStyles.labelCaps.copyWith(color: Colors.white, fontSize: 10)),
                    const SizedBox(height: 8),
                    Text(widget.title, style: AppTextStyles.headlineMd.copyWith(color: Colors.white, fontSize: 18)),
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
      alignment: Alignment.center,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1440),
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 32 : 120, vertical: 80),
        child: Container(
          width: double.infinity,
          color: AppColors.charcoal,
          padding: EdgeInsets.symmetric(vertical: 80, horizontal: isMobile ? 32 : 64),
          child: Column(
            children: [
              Text(
                'ZANAATIN BERRAKLIĞI',
                textAlign: TextAlign.center,
                style: AppTextStyles.displayXl.copyWith(color: Colors.white, letterSpacing: 6, fontSize: isMobile ? 32 : 60),
              ),
              const SizedBox(height: 32),
              Text(
                'ARSLAN CAM AYNA ATÖLYESİ — 1988\'DEN BUGÜNE',
                textAlign: TextAlign.center,
                style: AppTextStyles.labelCaps.copyWith(color: AppColors.outline.withValues(alpha: 0.6), letterSpacing: 5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SiteFooter extends StatelessWidget {
  final ValueChanged<PageType>? onNavigate;
  const SiteFooter({super.key, this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 800;

    return Container(
      width: double.infinity,
      color: AppColors.charcoal,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 32 : 64, vertical: 80),
      child: Column(
        children: [
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: isMobile ? 0 : 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ARSLAN CAM AYNA', style: AppTextStyles.headlineMd.copyWith(fontWeight: FontWeight.w800, fontSize: 18, color: Colors.white)),
                    const SizedBox(height: 24),
                    Text(
                      'ZANAATIN MODERN YÜZÜ.\nHER PARÇADA KUSURSUZ ŞEFFAFLIK.',
                      style: AppTextStyles.labelCaps.copyWith(fontSize: 10, color: Colors.white70, height: 1.8),
                    ),
                    if (isMobile) const SizedBox(height: 48),
                  ],
                ),
              ),
              Expanded(
                flex: isMobile ? 0 : 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('MENÜ', style: AppTextStyles.labelCaps.copyWith(fontSize: 10, color: Colors.white)),
                    const SizedBox(height: 24),
                    _FooterLink(title: 'ANA SAYFA', onTap: onNavigate != null ? () => onNavigate!(PageType.home) : null),
                    _FooterLink(title: 'AYNALAR', onTap: onNavigate != null ? () => onNavigate!(PageType.catalogAynalar) : null),
                    _FooterLink(title: 'CAMLAR', onTap: onNavigate != null ? () => onNavigate!(PageType.catalogCamlar) : null),
                    _FooterLink(title: 'DRESUARLAR', onTap: onNavigate != null ? () => onNavigate!(PageType.catalogDresuarlar) : null),
                    if (isMobile) const SizedBox(height: 48),
                  ],
                ),
              ),
              Expanded(
                flex: isMobile ? 0 : 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('KURUMSAL', style: AppTextStyles.labelCaps.copyWith(fontSize: 10, color: Colors.white)),
                    const SizedBox(height: 24),
                    _FooterLink(title: 'HAKKIMIZDA', onTap: onNavigate != null ? () => onNavigate!(PageType.about) : null),
                    _FooterLink(title: 'İLETİŞİM', onTap: onNavigate != null ? () => onNavigate!(PageType.contact) : null),
                    if (isMobile) const SizedBox(height: 48),
                  ],
                ),
              ),
              Expanded(
                flex: isMobile ? 0 : 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('YASAL', style: AppTextStyles.labelCaps.copyWith(fontSize: 10, color: Colors.white)),
                    const SizedBox(height: 24),
                    const _FooterLink(title: 'KVKK'),
                    const _FooterLink(title: 'ÇEREZ POLİTİKASI'),
                    if (isMobile) const SizedBox(height: 48),
                  ],
                ),
              ),
              Expanded(
                flex: isMobile ? 0 : 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('TAKİP EDİN', style: AppTextStyles.labelCaps.copyWith(fontSize: 10, color: Colors.white)),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () async {
                              final uri = Uri.parse('https://www.instagram.com/arslan_cam_ayna/');
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri);
                              }
                            },
                            child: Image.network(
                              'https://cdn-icons-png.flaticon.com/512/1384/1384031.png',
                              width: 20,
                              height: 20,
                              color: Colors.white70,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.camera_alt_outlined, size: 20, color: Colors.white70),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 80),
          Container(
            padding: const EdgeInsets.only(top: 24),
            decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.white24))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('© 2024 ARSLAN CAM AYNA. TÜM HAKLARI SAKLIDIR.', style: AppTextStyles.labelCaps.copyWith(fontSize: 10, color: Colors.white70)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const _FooterLink({required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: onTap,
        child: MouseRegion(
          cursor: onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
          child: Text(title, style: AppTextStyles.labelCaps.copyWith(fontSize: 10, color: Colors.white70)),
        ),
      ),
    );
  }
}
