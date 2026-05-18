import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart'; // For AppColors, AppTextStyles and shared components

class ProductItem {
  final String id;
  final String title;
  final String category;
  final String imageUrl;
  final List<String> styleTags;
  final String description;
  const ProductItem({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    this.styleTags = const [],
    this.description = '',
  });
}

final List<ProductItem> allProducts = [
  // --- AYNALAR ---
  const ProductItem(
    id: 'a1',
    title: 'MINIMALIST FLOTAL AYNA',
    category: 'Aynalar',
    styleTags: ['Minimal', 'Modern'],
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAaQ2bpUSggNk7TdPNcdAEFHzAjoJ8__rC1VihCtRXv8rjs_2VWuweWxsbLZfmFdD5PQ91x2ax00DdMcfkkYMh_jzoT8SawYEOb93cAEziv6UwcDkUF5_OPKTd8y2nLHKOFrI015wt8xwa-bYY52y0TBZy-h3LSOjs49-7JVHhQBCt_RqbCX1xoyukvtKruiaWNIL03akeUpWnquiet1GstwWXlI4llxbOSSW5focrx49ASNPM9DGke6PW_cMsxTWerwE8H-G1RGYI',
  ),
  const ProductItem(
    id: 'a2',
    title: 'AURA AYDINLATMALI AYNA',
    category: 'Aynalar',
    styleTags: ['Luxury', 'Modern'],
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD0vY5-R_eMzt2s9Lx-7YHe3Io11GvQXVWjK9Z5tsK4ujKzZLDgs4VVr2wwg7UrWBvBFgfD-hU-hN4a-DjZwzayJznGwFJqGYKr-DZ2IrtID_MwqHs1xi1MwK9Py5CqeCXvoNbVoDpJrbYokgt8NkXCsIWCgG24RCBHYhy7BPX1ikoW8YIoMxXAF7DrGQguz7acfRgRPn9LPZ2Pb5G0kzFZyypEgUUAz1FdimLzw3yDdx8GwzsgS8OgD9n61kjZ-p2QEZiRP_8N-qU',
  ),
  const ProductItem(
    id: 'a3',
    title: 'FLUTLU DEKORATIF AYNA',
    category: 'Aynalar',
    styleTags: ['Vintage', 'Classic'],
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDKcyVShv4VHFDlopj7bJfQjD0RvXQktsJpolKZ3ZAGmAksy7Tr8kVWTO5SbcmOVuEB1jBtijPusOAajg0A6PAx7iMwvwFnug-nRWb7NJaVb7z3Z7CUehB5udSTehaQCWFSz0wGHFXTabXprQm6jgswjwtx1Yfv2wmDeLxj9T6UJlT5gJQXbtJgf7qnOXwYAhxQ6Pu2n5Moix61jcarIb3T1_yED5WZYGTj0RaTjYmzK9xd9YX2c0qohFjQYVgalZ2UUAoCSix6_iE',
  ),
  const ProductItem(id: 'a4', title: 'ELIPS MODERN AYNA', category: 'Aynalar', styleTags: ['Oval Collection'], imageUrl: 'https://picsum.photos/seed/ayna4/600/800'),
  const ProductItem(id: 'a5', title: 'CERCEVESIZ SALON AYNASI', category: 'Aynalar', styleTags: ['Minimal'], imageUrl: 'https://picsum.photos/seed/ayna5/600/800'),

    // --- TABLOLAR ---
  const ProductItem(
    id: 'c1',
    title: 'YASAM AGACI DEKORATIF TABLO',
    category: 'Tablolar',
    styleTags: ['Sanatsal', 'Renkli', 'Modern'],
    imageUrl: 'assets/images/tablo_1.png',
    description: 'Canli renk gecisleri ve koklerden tepeye uzanan kompozisyonuyla yasam enerjisini mekana tasiyan modern dekoratif tablo.',
  ),
  const ProductItem(
    id: 'c2',
    title: 'BEYAZ TAVUS KUSU TABLO',
    category: 'Tablolar',
    styleTags: ['Luks', 'Klasik', 'Elegant', 'Modern'],
    imageUrl: 'assets/images/tablo_2.png',
    description: 'Inci beyazi dokular ve mavi detaylarla zenginlesen tavus kusu temasi, salonda odak noktasi olusturan premium bir tasarim sunar.',
  ),
  const ProductItem(
    id: 'c3',
    title: 'KELEBEK VE MAVI GUL TABLO',
    category: 'Tablolar',
    styleTags: ['Romantik', 'Sanatsal', 'Modern'],
    imageUrl: 'assets/images/tablo_3.png',
    description: 'Narin kelebek formu ile mavi gul detaylarini birlestiren bu kompozisyon, duvara zarif ve etkileyici bir karakter kazandirir.',
  ),
  const ProductItem(
    id: 'c4',
    title: 'SOYUT ALTIN GEOMETRI TABLO',
    category: 'Tablolar',
    styleTags: ['Soyut', 'Geometrik', 'Luks', 'Modern'],
    imageUrl: 'assets/images/tablo_4.png',
    description: 'Altin tonlu geometrik katmanlar ve aydinlik yansimalarla tasarlanan soyut form, modern ic mekanlara derinlik katar.',
  ),
  const ProductItem(
    id: 'c5',
    title: 'METALIK CICEK KOMPOZISYONU',
    category: 'Tablolar',
    styleTags: ['Cicek', 'Zarif', 'Modern'],
    imageUrl: 'assets/images/tablo_5.png',
    description: 'Metalik mavi ve gumus gecisleriyle bicimlenen cicek kompozisyonu, rafine bir gorunumu guclu bir sanat diliyle bulusturur.',
  ),
  // --- DRESUARLAR ---
  const ProductItem(
    id: 'd1',
    title: 'LUKS CAM DRESUAR',
    category: 'Dresuarlar',
    styleTags: ['Luxury', 'Modern'],
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD33_TJUZ2dFUZFiMuWof32yMnpt6S0AIvcvZlB8qkSLi02ApSz00_6ZRfUYedp3_5Oc7CTgp4ACu1uCYl1Sx2cFXIjaRGCQvZesSAsBdOT6aV6gvnr0WW7UMzIcfAxXcr46sG8lvrUDSPgtMTrYrSFjaohhQAO574tmUaEpZGTq710BsPhitfgtCEexFqYvwfJvRjx3usLVlELFc_B1XXOKvUEPj66JHF5cQ9ro26W45Srceu9YE2uj71n8lz50_Z4VhExPEkL54c',
  ),
  const ProductItem(id: 'd2', title: 'GOLD AYAKLI CAM DRESUAR', category: 'Dresuarlar', styleTags: ['Gold Details', 'Luxury'], imageUrl: 'https://picsum.photos/seed/dresuar2/600/800'),
  const ProductItem(id: 'd3', title: 'SIYAH PROFIL DRESUAR', category: 'Dresuarlar', styleTags: ['Black Frame', 'Minimal'], imageUrl: 'https://picsum.photos/seed/dresuar3/600/800'),
];

class CatalogContent extends StatefulWidget {
  final String category;
  const CatalogContent({super.key, required this.category});

  @override
  State<CatalogContent> createState() => _CatalogContentState();
}

class _CatalogContentState extends State<CatalogContent> {
  String _selectedStyle = 'Tum';

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    
    // Title capitalization fix based on category
    final categoryMap = {
      'aynalar': 'Aynalar',
      'saatler': 'Saatler',
      'dresuarlar': 'Dresuarlar',
      'sehpalar': 'Sehpalar',
      'tablolar': 'Tablolar',
    };
    final displayCategory = categoryMap[widget.category.toLowerCase()] ?? widget.category;

    var filteredItems = allProducts.where((p) => p.category.toLowerCase() == widget.category.toLowerCase()).toList();
    
    // Extract unique styles
    Set<String> allStyles = {'Tum'};
    if (widget.category.toLowerCase() == 'tablolar') {
      allStyles = {'Modern'};
      filteredItems = filteredItems.where((p) => p.styleTags.contains('Modern')).toList();
    } else {
      for (var item in filteredItems) {
        allStyles.addAll(item.styleTags);
      }
    }

    if (_selectedStyle != 'Tum' && widget.category.toLowerCase() != 'tablolar') {
      filteredItems = filteredItems.where((p) => p.styleTags.contains(_selectedStyle)).toList();
    }

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1440),
          padding: EdgeInsets.only(
            left: isMobile ? 32 : 120,
            right: isMobile ? 32 : 120,
            top: 200,
            bottom: 120,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  InkWell(
                    onTap: () => context.go('/'),
                    child: Text(
                      'KOLEKSIYON',
                      style: AppTextStyles.labelCaps.copyWith(color: AppColors.accent),
                    ),
                  ),
                  Text(' / ', style: AppTextStyles.labelCaps.copyWith(color: AppColors.accent)),
                  InkWell(
                    onTap: () => context.go('/katalog/${widget.category.toLowerCase()}'),
                    child: Text(
                      displayCategory.toUpperCase(),
                      style: AppTextStyles.labelCaps.copyWith(color: AppColors.accent),
                    ),
                  ),
                ],
              ).animate().fade().slideY(begin: 0.3),
              const SizedBox(height: 24),
              Text(displayCategory, style: AppTextStyles.headlineLg.copyWith(fontSize: isMobile ? 48 : 80, fontWeight: FontWeight.w200))
                .animate().fade(delay: 200.ms).slideY(begin: 0.2),
              if (widget.category.toLowerCase() == 'tablolar') const SizedBox(height: 20),
              if (widget.category.toLowerCase() == 'tablolar')
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () => context.go('/'),
                      child: Text('Anasayfa', style: AppTextStyles.bodyMd.copyWith(color: AppColors.textPrimary)),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.chevron_right, size: 16, color: AppColors.textSecondary),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () => context.go('/katalog/tablolar'),
                      child: Text('Tablolar', style: AppTextStyles.bodyMd),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.chevron_right, size: 16, color: AppColors.textSecondary),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () => setState(() => _selectedStyle = 'Modern'),
                      child: Text('Modern', style: AppTextStyles.bodyMd.copyWith(color: AppColors.accent)),
                    ),
                  ],
                ).animate().fade().slideY(begin: 0.2),
              
              const SizedBox(height: 64),
              
              // Style Based Discovery System
              if (allStyles.isNotEmpty)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: allStyles.map((style) => Padding(
                      padding: const EdgeInsets.only(right: 32),
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedStyle = style),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: (widget.category.toLowerCase() == 'tablolar' ? style == 'Modern' : _selectedStyle == style)
                                    ? AppColors.accent
                                    : Colors.transparent,
                                width: 1,
                              )
                            )
                          ),
                          child: Text(
                            style,
                            style: AppTextStyles.labelCaps.copyWith(
                              color: (widget.category.toLowerCase() == 'tablolar' ? style == 'Modern' : _selectedStyle == style)
                                  ? AppColors.accent
                                  : AppColors.textSecondary,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                    )).toList(),
                  ),
                ).animate().fade(delay: 300.ms),

              const SizedBox(height: 80),
              
              if (filteredItems.isEmpty)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Bu stilde urun bulunmuyor.', style: AppTextStyles.bodyLg),
                )
              else
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredItems.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isMobile ? 1 : 3, // Smaller cards so they don't take up the whole screen
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 80,
                    childAspectRatio: isMobile ? 0.68 : 0.72, // Balanced height after compact card/photo sizing
                  ),
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    return GestureDetector(
                      onTap: () => context.go('/urun/${item.id}'),
                      child: CollectionCard(
                        title: item.title,
                        subtitle: widget.category.toLowerCase() == 'tablolar' ? 'TABLO KOLEKSIYONU' : item.styleTags.join(' - ').toUpperCase(),
                        imageUrl: item.imageUrl,
                      ),
                    ).animate().fade(delay: (200 + (index * 100)).ms).slideY(begin: 0.1);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetailContent extends StatelessWidget {
  final String productId;
  const ProductDetailContent({super.key, required this.productId});

  Widget _buildTechRow(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.outline, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(label, style: AppTextStyles.labelCaps.copyWith(color: AppColors.textSecondary))),
          Text(value, style: AppTextStyles.bodyMd.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 800;
    
    // Find product or default to first
    final product = allProducts.firstWhere((p) => p.id == productId, orElse: () => allProducts.first);

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1440),
          padding: EdgeInsets.only(
            left: isMobile ? 32 : 120,
            right: isMobile ? 32 : 120,
            top: 160,
            bottom: 120,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Premium Product Layout
              Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Section
                  Expanded(
                    flex: isMobile ? 0 : 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            InkWell(
                              onTap: () => context.go('/'),
                              child: Text('KOLEKSIYONLAR', style: AppTextStyles.labelCaps.copyWith(color: AppColors.accent)),
                            ),
                            Text(' > ', style: AppTextStyles.labelCaps.copyWith(color: AppColors.accent)),
                            InkWell(
                              onTap: () => context.go('/katalog/${product.category.toLowerCase()}'),
                              child: Text(product.category.toUpperCase(), style: AppTextStyles.labelCaps.copyWith(color: AppColors.accent)),
                            ),
                          ],
                        ).animate().fade().slideY(),
                        const SizedBox(height: 32),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(border: Border.all(color: AppColors.outline)),
                          child: product.imageUrl.startsWith('http')
                              ? SizedBox(
                                  height: isMobile ? 340 : 520,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Image.network(product.imageUrl, fit: BoxFit.contain),
                                  ),
                                )
                              : SizedBox(
                                  height: isMobile ? 340 : 520,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Image.asset(product.imageUrl, fit: BoxFit.contain),
                                  ),
                                ),
                        ).animate().fade(delay: 200.ms),
                      ],
                    ),
                  ),
                  SizedBox(width: isMobile ? 0 : 80, height: isMobile ? 64 : 0),
                  
                  // Details Section
                  Expanded(
                    flex: isMobile ? 0 : 5,
                    child: Padding(
                      padding: EdgeInsets.only(top: isMobile ? 0 : 64),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.title, style: AppTextStyles.headlineLg.copyWith(fontSize: isMobile ? 48 : 64, height: 1.1, fontWeight: FontWeight.w200))
                            .animate().fade(delay: 300.ms).slideY(),
                          const SizedBox(height: 48),
                          Text(
                            product.description.isNotEmpty
                                ? product.description
                                : 'Geleneksel cam isleme sanatinin modern mimariyle bulustugu nokta. Bu seri, seffafligin ve yansimanin en saf halini yasam alanlariniza tasiyor. El isciligiyle hazirlanan kenar detaylari ve ustun cam kalitesiyle zamansiz bir parca.',
                            style: AppTextStyles.bodyLg,
                          ).animate().fade(delay: 400.ms),
                          const SizedBox(height: 80),
                          
                          Text('TEKNIK OZELLIKLER', style: AppTextStyles.labelCaps.copyWith(color: AppColors.textPrimary)),
                          const SizedBox(height: 16),
                          Container(height: 1, color: AppColors.outline),
                          _buildTechRow('MALZEME', 'Ekstra Berrak Flotal Ayna').animate().fade(delay: 500.ms),
                          _buildTechRow('STANDART BOYUT', '120cm x 40cm x 85cm').animate().fade(delay: 550.ms),
                          _buildTechRow('YUZEY ISLEMI', 'Bizote & Polisaj').animate().fade(delay: 600.ms),
                          _buildTechRow('TASIMA KAPASITESI', '45 kg').animate().fade(delay: 650.ms),
                          
                          const SizedBox(height: 80),
                          Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children: [
                              HoverButton(
                                text: 'ILETISIME GEC',
                                onTap: () {
                                  context.go('/iletisim');
                                },
                              ),
                              HoverButton(
                                text: 'WHATSAPP',
                                onTap: () {
                                  launchUrl(
                                    Uri.parse('https://wa.me/905000000000'),
                                    mode: LaunchMode.externalApplication,
                                  );
                                },
                              ),
                            ],
                          ).animate().fade(delay: 700.ms),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  Widget _buildFeature(String title, String desc) {
    return Container(
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.headlineMd),
          const SizedBox(height: 24),
          Text(desc, style: AppTextStyles.bodyMd),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 800;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Minimal Hero
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              left: isMobile ? 32 : 120,
              right: isMobile ? 32 : 120,
              top: 200,
              bottom: 120,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('HAKKIMIZDA', style: AppTextStyles.labelCaps.copyWith(color: AppColors.accent)).animate().fade().slideY(),
                const SizedBox(height: 32),
                Text(
                  'Yarim Asirlik Ustalik,\nModern Cizgiler.',
                  style: AppTextStyles.headlineLg.copyWith(fontSize: isMobile ? 48 : 80, fontWeight: FontWeight.w200),
                ).animate().fade(delay: 200.ms).slideY(),
                const SizedBox(height: 64),
                Container(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Text(
                    '1970\'den beri camin seffafligini ve aynanin derinligini sanatla bulusturuyoruz. Geleneksel zanaat tekniklerini, modern mimari trendlerle harmanlayarak mekanlariniza deger katiyoruz.',
                    style: AppTextStyles.bodyLg,
                  ),
                ).animate().fade(delay: 400.ms),
              ],
            ),
          ),
          
          // Visual Block
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 32 : 120),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1440),
              child: Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: isMobile ? 0 : 3,
                    child: Container(
                      height: isMobile ? 320 : 460,
                      decoration: BoxDecoration(border: Border.all(color: AppColors.outline)),
                      child: Image.asset('assets/images/4.png', fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: isMobile ? 0 : 24, height: isMobile ? 24 : 0),
                  Expanded(
                    flex: isMobile ? 0 : 2,
                    child: Container(
                      height: isMobile ? 220 : 300,
                      decoration: BoxDecoration(border: Border.all(color: AppColors.outline)),
                      child: Image.asset('assets/images/2.png', fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
            ),
          ).animate().fade(delay: 500.ms),

          // Features
          Container(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 32 : 120, vertical: 160),
            constraints: const BoxConstraints(maxWidth: 1440),
            child: Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              children: [
                Expanded(
                  flex: isMobile ? 0 : 1,
                  child: _buildFeature('Ustun Kalite', 'Uluslararasi standartlarda sertifikali cam ve ayna panelleri ile omur boyu dayaniklilik garantisi sunuyoruz.'),
                ),
                SizedBox(width: isMobile ? 0 : 32, height: isMobile ? 32 : 0),
                Expanded(
                  flex: isMobile ? 0 : 1,
                  child: _buildFeature('Ozel Tasarim', 'Mimar ve tasarimcilarin hayallerini, ozel kesim ve isleme teknikleriyle gercege donusturen butik uretim anlayisi.'),
                ),
                SizedBox(width: isMobile ? 0 : 32, height: isMobile ? 32 : 0),
                Expanded(
                  flex: isMobile ? 0 : 1,
                  child: _buildFeature('Sanatsal Yaklasim', 'Cami sadece yapi malzemesi degil, mekana ruh katan sanatsal bir enstruman olarak ele aliyoruz.'),
                ),
              ],
            ),
          ).animate().fade(delay: 600.ms),
          
          const SiteFooter(),
        ],
      ),
    );
  }
}

class ContactContent extends StatelessWidget {
  const ContactContent({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 800;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.topCenter,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1440),
              padding: EdgeInsets.only(
                left: isMobile ? 32 : 120,
                right: isMobile ? 32 : 120,
                top: 200,
                bottom: 160,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ILETISIM', style: AppTextStyles.labelCaps.copyWith(color: AppColors.accent)).animate().fade().slideY(),
                  const SizedBox(height: 32),
                  Text('Projelerinizi\nKonusalim.', style: AppTextStyles.headlineLg.copyWith(fontSize: isMobile ? 48 : 80, fontWeight: FontWeight.w200))
                    .animate().fade(delay: 200.ms).slideY(),
                  
                  const SizedBox(height: 120),
                  
                  Flex(
                    direction: isMobile ? Axis.vertical : Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Info
                      Expanded(
                        flex: isMobile ? 0 : 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ADRES', style: AppTextStyles.labelCaps),
                            const SizedBox(height: 16),
                            Text('Gunesevler Mahallesi 117.Cadde No:19/A\nArslan Cam Ayna\nAnkara, Turkey 06140', style: AppTextStyles.bodyLg),
                            const SizedBox(height: 64),
                            Text('ILETISIM BILGILERI', style: AppTextStyles.labelCaps),
                            const SizedBox(height: 16),
                            Text('+90 (312) 555 00 00\nhello@arslancamayna.com', style: AppTextStyles.bodyLg),
                          ],
                        ),
                      ).animate().fade(delay: 400.ms),
                      
                      SizedBox(width: isMobile ? 0 : 120, height: isMobile ? 64 : 0),
                      
                      // Form Stub
                      Expanded(
                        flex: isMobile ? 0 : 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              style: AppTextStyles.bodyLg,
                              decoration: InputDecoration(
                                labelText: 'Adiniz Soyadiniz',
                                labelStyle: AppTextStyles.labelCaps.copyWith(color: AppColors.textSecondary),
                                enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.outline)),
                                focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.accent)),
                              ),
                            ),
                            const SizedBox(height: 48),
                            TextField(
                              style: AppTextStyles.bodyLg,
                              decoration: InputDecoration(
                                labelText: 'E-posta Adresiniz',
                                labelStyle: AppTextStyles.labelCaps.copyWith(color: AppColors.textSecondary),
                                enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.outline)),
                                focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.accent)),
                              ),
                            ),
                            const SizedBox(height: 48),
                            TextField(
                              maxLines: 3,
                              style: AppTextStyles.bodyLg,
                              decoration: InputDecoration(
                                labelText: 'Mesajiniz',
                                labelStyle: AppTextStyles.labelCaps.copyWith(color: AppColors.textSecondary),
                                enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.outline)),
                                focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.accent)),
                              ),
                            ),
                            const SizedBox(height: 64),
                            Wrap(
                              spacing: 16,
                              runSpacing: 16,
                              children: [
                                HoverButton(text: 'GONDER', onTap: () {}),
                                HoverButton(
                                  text: 'WHATSAPP',
                                  onTap: () {
                                    launchUrl(
                                      Uri.parse('https://wa.me/905000000000'),
                                      mode: LaunchMode.externalApplication,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ).animate().fade(delay: 600.ms),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SiteFooter(),
        ],
      ),
    );
  }
}



