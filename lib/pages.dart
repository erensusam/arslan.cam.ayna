import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'main.dart'; // For AppColors, AppTextStyles and shared components

class ProductItem {
  final String id;
  final String title;
  final String category;
  final String imageUrl;
  final List<String> styleTags;
  const ProductItem({required this.id, required this.title, required this.category, required this.imageUrl, this.styleTags = const []});
}

final List<ProductItem> allProducts = [
  // --- AYNALAR ---
  const ProductItem(
    id: 'a1',
    title: 'MİNİMALİST FLOTAL AYNA',
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
    title: 'FLÜTLÜ DEKORATİF AYNA',
    category: 'Aynalar',
    styleTags: ['Vintage', 'Classic'],
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDKcyVShv4VHFDlopj7bJfQjD0RvXQktsJpolKZ3ZAGmAksy7Tr8kVWTO5SbcmOVuEB1jBtijPusOAajg0A6PAx7iMwvwFnug-nRWb7NJaVb7z3Z7CUehB5udSTehaQCWFSz0wGHFXTabXprQm6jgswjwtx1Yfv2wmDeLxj9T6UJlT5gJQXbtJgf7qnOXwYAhxQ6Pu2n5Moix61jcarIb3T1_yED5WZYGTj0RaTjYmzK9xd9YX2c0qohFjQYVgalZ2UUAoCSix6_iE',
  ),
  const ProductItem(id: 'a4', title: 'ELİPS MODERN AYNA', category: 'Aynalar', styleTags: ['Oval Collection'], imageUrl: 'https://picsum.photos/seed/ayna4/600/800'),
  const ProductItem(id: 'a5', title: 'ÇERÇEVESİZ SALON AYNASI', category: 'Aynalar', styleTags: ['Minimal'], imageUrl: 'https://picsum.photos/seed/ayna5/600/800'),

  // --- CAMLAR ---
  const ProductItem(
    id: 'c1',
    title: 'KÜBİK BRONZ CAM',
    category: 'Camlar',
    styleTags: ['Gold Details', 'Luxury'],
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAE4kE71pXXqnY8lsp6TiYnCaGTt9N1SNA1whCBcp3jifqW4Koq75r2KdKcNj6YgmbgDDhiTdZUHmgtr3PCZkExF79vTSc0d023exdnDJeAEgZ5b3olQCjFbPb4bwnG5vTmcTNt76JIGJpa8jdAVTwane9Q8CHXExvyjqAOIHWTTY6JFPqmxfPuHj57we6TENSCpczjoIXdp2dYdKtxbIdUPbmWL2YdpDXO2TVoBj6EzkVEiRsc6tCFWKbInNsS320edQzAkSsXW0A',
  ),
  const ProductItem(
    id: 'c2',
    title: 'BUZLU TEMPERLİ CAM',
    category: 'Camlar',
    styleTags: ['Minimal'],
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBgj6ZgUc5V1n3yi3m9-MsM_JSTvuNl4JHvRPIIwQaz9PqEv2xA0uQQSOrpbY86Bzvd8KJgCjGdHJjkns7byStgTrzLzKrlcB0S4TuoauQfABAM74TDvmRZIGYgJfs6RPlfEFFFGezlyFG99KeC0Z__yS2JdDuq-CNmxpa87lbDVFcAINxUKFvkZReGlhQiZyJOwZ11pHBTbQUIfSn625t5IwjOo4p5i5lBnShRR0HtYJTqF82nHG0uCorikY6vo04iQW76f4ELTjs',
  ),
  const ProductItem(id: 'c3', title: 'LAMİNE GÜVENLİK CAMI', category: 'Camlar', styleTags: ['Modern'], imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBNkNO84U3QETgYe_acmG5IUvWF4cuPv1_A8O1VLvw6wF-v2fqeNRL8Nsg-hZHcKel4OUfNVaIsdgUFxY3yZK3s5oykMnIipYAhEyUOvwzoBTSqI7DsvV0ESvZG9Xjsbln6KKodGnhPvWLVrWwbW0DB9WgOoFYLhy4JHb50qRymtCpSBkdYfw9aG7RugP4rxHAfe8Zp6wyh-6pNKBaRYBoval5yllNCxN424r8tzjzuJAh6NDK2T16al5noM54UyxyYTqtTIo1zsX4'),
  
  // --- DRESUARLAR ---
  const ProductItem(
    id: 'd1',
    title: 'LÜKS CAM DRESUAR',
    category: 'Dresuarlar',
    styleTags: ['Luxury', 'Modern'],
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD33_TJUZ2dFUZFiMuWof32yMnpt6S0AIvcvZlB8qkSLi02ApSz00_6ZRfUYedp3_5Oc7CTgp4ACu1uCYl1Sx2cFXIjaRGCQvZesSAsBdOT6aV6gvnr0WW7UMzIcfAxXcr46sG8lvrUDSPgtMTrYrSFjaohhQAO574tmUaEpZGTq710BsPhitfgtCEexFqYvwfJvRjx3usLVlELFc_B1XXOKvUEPj66JHF5cQ9ro26W45Srceu9YE2uj71n8lz50_Z4VhExPEkL54c',
  ),
  const ProductItem(id: 'd2', title: 'GOLD AYAKLI CAM DRESUAR', category: 'Dresuarlar', styleTags: ['Gold Details', 'Luxury'], imageUrl: 'https://picsum.photos/seed/dresuar2/600/800'),
  const ProductItem(id: 'd3', title: 'SİYAH PROFİL DRESUAR', category: 'Dresuarlar', styleTags: ['Black Frame', 'Minimal'], imageUrl: 'https://picsum.photos/seed/dresuar3/600/800'),
];

class CatalogContent extends StatefulWidget {
  final String category;
  const CatalogContent({super.key, required this.category});

  @override
  State<CatalogContent> createState() => _CatalogContentState();
}

class _CatalogContentState extends State<CatalogContent> {
  String _selectedStyle = 'Tümü';

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    
    // Title capitalization fix based on category
    final categoryMap = {'aynalar': 'Aynalar', 'camlar': 'Camlar', 'dresuarlar': 'Dresuarlar'};
    final displayCategory = categoryMap[widget.category.toLowerCase()] ?? widget.category;

    var filteredItems = allProducts.where((p) => p.category.toLowerCase() == widget.category.toLowerCase()).toList();
    
    // Extract unique styles
    Set<String> allStyles = {'Tümü'};
    for(var item in filteredItems) {
      allStyles.addAll(item.styleTags);
    }

    if (_selectedStyle != 'Tümü') {
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
              Text('KOLEKSİYON / ${displayCategory.toUpperCase()}', style: AppTextStyles.labelCaps.copyWith(color: AppColors.accent))
                .animate().fade().slideY(begin: 0.3),
              const SizedBox(height: 24),
              Text(displayCategory, style: AppTextStyles.headlineLg.copyWith(fontSize: isMobile ? 48 : 80, fontWeight: FontWeight.w200))
                .animate().fade(delay: 200.ms).slideY(begin: 0.2),
              
              const SizedBox(height: 64),
              
              // Style Based Discovery System
              if (allStyles.length > 1)
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
                                color: _selectedStyle == style ? AppColors.accent : Colors.transparent,
                                width: 1,
                              )
                            )
                          ),
                          child: Text(
                            style,
                            style: AppTextStyles.labelCaps.copyWith(
                              color: _selectedStyle == style ? AppColors.accent : AppColors.textSecondary,
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
                Text('Bu stilde ürün bulunmuyor.', style: AppTextStyles.bodyLg)
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
                        subtitle: item.styleTags.join(' • ').toUpperCase(),
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
                        Text('KOLEKSİYONLAR > ${product.category.toUpperCase()}', style: AppTextStyles.labelCaps.copyWith(color: AppColors.accent))
                          .animate().fade().slideY(),
                        const SizedBox(height: 32),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(border: Border.all(color: AppColors.outline)),
                          child: Image.network(product.imageUrl, fit: BoxFit.cover, height: isMobile ? 320 : 460),
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
                            'Geleneksel cam işleme sanatının modern mimariyle buluştuğu nokta. Bu seri, şeffaflığın ve yansımanın en saf halini yaşam alanlarınıza taşıyor. El işçiliğiyle hazırlanan kenar detayları ve üstün cam kalitesiyle zamansız bir parça.',
                            style: AppTextStyles.bodyLg,
                          ).animate().fade(delay: 400.ms),
                          const SizedBox(height: 80),
                          
                          Text('TEKNİK ÖZELLİKLER', style: AppTextStyles.labelCaps.copyWith(color: AppColors.textPrimary)),
                          const SizedBox(height: 16),
                          Container(height: 1, color: AppColors.outline),
                          _buildTechRow('MALZEME', 'Ekstra Berrak Flotal Ayna').animate().fade(delay: 500.ms),
                          _buildTechRow('STANDART BOYUT', '120cm x 40cm x 85cm').animate().fade(delay: 550.ms),
                          _buildTechRow('YÜZEY İŞLEMİ', 'Bizote & Polisaj').animate().fade(delay: 600.ms),
                          _buildTechRow('TAŞIMA KAPASİTESİ', '45 kg').animate().fade(delay: 650.ms),
                          
                          const SizedBox(height: 80),
                          HoverButton(text: 'İLETİŞİME GEÇ', onTap: () {
                            context.go('/iletisim');
                          }).animate().fade(delay: 700.ms),
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
                  'Yarım Asırlık Ustalık,\nModern Çizgiler.',
                  style: AppTextStyles.headlineLg.copyWith(fontSize: isMobile ? 48 : 80, fontWeight: FontWeight.w200),
                ).animate().fade(delay: 200.ms).slideY(),
                const SizedBox(height: 64),
                Container(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Text(
                    '1970\'den beri camın şeffaflığını ve aynanın derinliğini sanatla buluşturuyoruz. Geleneksel zanaat tekniklerini, modern mimari trendlerle harmanlayarak mekanlarınıza değer katıyoruz.',
                    style: AppTextStyles.bodyLg,
                  ),
                ).animate().fade(delay: 400.ms),
              ],
            ),
          ),
          
          // Image Break
          SizedBox(
            height: 600,
            width: double.infinity,
            child: Image.network(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuBi5GXOZBAnOWl-1INnxIUBxT9AcvLxOvp1wkCb-fRFlrnyRjFVPYW2qaYgdDiFkV6NwWtVx-YctVuCeiYPMmAR81RgCFdYtwQBg5OwXoKvpey7jPzv34WNaRSPTCRqN-vi_2zN6lP0R02CwtGGJdMYDpIJ6aNyBm2ZSL2k-DSDLLaFgpjr0WIqeCO08hyiKoS_psiVcG0dnAmpiYpp-kFCA3FDdTGxgv2T5IYiZ_z_0QAWlq9uRjdmPug5sRFuQ_jYgddEneJspDM',
              fit: BoxFit.cover,
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
                  child: _buildFeature('Üstün Kalite', 'Uluslararası standartlarda sertifikalı cam ve ayna panelleri ile ömür boyu dayanıklılık garantisi sunuyoruz.'),
                ),
                SizedBox(width: isMobile ? 0 : 32, height: isMobile ? 32 : 0),
                Expanded(
                  flex: isMobile ? 0 : 1,
                  child: _buildFeature('Özel Tasarım', 'Mimar ve tasarımcıların hayallerini, özel kesim ve işleme teknikleriyle gerçeğe dönüştüren butik üretim anlayışı.'),
                ),
                SizedBox(width: isMobile ? 0 : 32, height: isMobile ? 32 : 0),
                Expanded(
                  flex: isMobile ? 0 : 1,
                  child: _buildFeature('Sanatsal Yaklaşım', 'Camı sadece yapı malzemesi değil, mekana ruh katan sanatsal bir enstrüman olarak ele alıyoruz.'),
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
                  Text('İLETİŞİM', style: AppTextStyles.labelCaps.copyWith(color: AppColors.accent)).animate().fade().slideY(),
                  const SizedBox(height: 32),
                  Text('Projelerinizi\nKonuşalım.', style: AppTextStyles.headlineLg.copyWith(fontSize: isMobile ? 48 : 80, fontWeight: FontWeight.w200))
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
                            Text('Güneşevler Mahallesi 117.Cadde No:19/A\nArslan Cam Ayna\nAnkara, Turkey 06140', style: AppTextStyles.bodyLg),
                            const SizedBox(height: 64),
                            Text('İLETİŞİM BİLGİLERİ', style: AppTextStyles.labelCaps),
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
                                labelText: 'Adınız Soyadınız',
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
                                labelText: 'Mesajınız',
                                labelStyle: AppTextStyles.labelCaps.copyWith(color: AppColors.textSecondary),
                                enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.outline)),
                                focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.accent)),
                              ),
                            ),
                            const SizedBox(height: 64),
                            HoverButton(text: 'GÖNDER', onTap: () {}, isLight: true),
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
