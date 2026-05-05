import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart'; // For AppColors, AppTextStyles, PageType and shared components

class ProductItem {
  final String title;
  final String category;
  final String imageUrl;
  const ProductItem({required this.title, required this.category, required this.imageUrl});
}

final List<ProductItem> allProducts = [
  // --- AYNALAR (10 Adet) ---
  ProductItem(
    title: 'MİNİMALİST FLOTAL AYNA',
    category: 'Aynalar',
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAaQ2bpUSggNk7TdPNcdAEFHzAjoJ8__rC1VihCtRXv8rjs_2VWuweWxsbLZfmFdD5PQ91x2ax00DdMcfkkYMh_jzoT8SawYEOb93cAEziv6UwcDkUF5_OPKTd8y2nLHKOFrI015wt8xwa-bYY52y0TBZy-h3LSOjs49-7JVHhQBCt_RqbCX1xoyukvtKruiaWNIL03akeUpWnquiet1GstwWXlI4llxbOSSW5focrx49ASNPM9DGke6PW_cMsxTWerwE8H-G1RGYI',
  ),
  ProductItem(
    title: 'AURA AYDINLATMALI AYNA',
    category: 'Aynalar',
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD0vY5-R_eMzt2s9Lx-7YHe3Io11GvQXVWjK9Z5tsK4ujKzZLDgs4VVr2wwg7UrWBvBFgfD-hU-hN4a-DjZwzayJznGwFJqGYKr-DZ2IrtID_MwqHs1xi1MwK9Py5CqeCXvoNbVoDpJrbYokgt8NkXCsIWCgG24RCBHYhy7BPX1ikoW8YIoMxXAF7DrGQguz7acfRgRPn9LPZ2Pb5G0kzFZyypEgUUAz1FdimLzw3yDdx8GwzsgS8OgD9n61kjZ-p2QEZiRP_8N-qU',
  ),
  ProductItem(
    title: 'FLÜTLÜ DEKORATİF AYNA',
    category: 'Aynalar',
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDKcyVShv4VHFDlopj7bJfQjD0RvXQktsJpolKZ3ZAGmAksy7Tr8kVWTO5SbcmOVuEB1jBtijPusOAajg0A6PAx7iMwvwFnug-nRWb7NJaVb7z3Z7CUehB5udSTehaQCWFSz0wGHFXTabXprQm6jgswjwtx1Yfv2wmDeLxj9T6UJlT5gJQXbtJgf7qnOXwYAhxQ6Pu2n5Moix61jcarIb3T1_yED5WZYGTj0RaTjYmzK9xd9YX2c0qohFjQYVgalZ2UUAoCSix6_iE',
  ),
  ProductItem(title: 'ELİPS MODERN AYNA', category: 'Aynalar', imageUrl: 'https://picsum.photos/seed/ayna4/600/800'),
  ProductItem(title: 'ÇERÇEVESİZ SALON AYNASI', category: 'Aynalar', imageUrl: 'https://picsum.photos/seed/ayna5/600/800'),
  ProductItem(title: 'BRONZ DEKORATİF AYNA', category: 'Aynalar', imageUrl: 'https://picsum.photos/seed/ayna6/600/800'),
  ProductItem(title: 'ESKİTME VINTAGE AYNA', category: 'Aynalar', imageUrl: 'https://picsum.photos/seed/ayna7/600/800'),
  ProductItem(title: 'GEOMETRİK PARÇALI AYNA', category: 'Aynalar', imageUrl: 'https://picsum.photos/seed/ayna8/600/800'),
  ProductItem(title: 'LED IŞIKLI MAKYAJ AYNASI', category: 'Aynalar', imageUrl: 'https://picsum.photos/seed/ayna9/600/800'),
  ProductItem(title: 'BOY AYNASI KLASİK', category: 'Aynalar', imageUrl: 'https://picsum.photos/seed/ayna10/600/800'),

  // --- CAMLAR (10 Adet) ---
  ProductItem(
    title: 'KÜBİK BRONZ CAM',
    category: 'Camlar',
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAE4kE71pXXqnY8lsp6TiYnCaGTt9N1SNA1whCBcp3jifqW4Koq75r2KdKcNj6YgmbgDDhiTdZUHmgtr3PCZkExF79vTSc0d023exdnDJeAEgZ5b3olQCjFbPb4bwnG5vTmcTNt76JIGJpa8jdAVTwane9Q8CHXExvyjqAOIHWTTY6JFPqmxfPuHj57we6TENSCpczjoIXdp2dYdKtxbIdUPbmWL2YdpDXO2TVoBj6EzkVEiRsc6tCFWKbInNsS320edQzAkSsXW0A',
  ),
  ProductItem(
    title: 'BUZLU TEMPERLİ CAM',
    category: 'Camlar',
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBgj6ZgUc5V1n3yi3m9-MsM_JSTvuNl4JHvRPIIwQaz9PqEv2xA0uQQSOrpbY86Bzvd8KJgCjGdHJjkns7byStgTrzLzKrlcB0S4TuoauQfABAM74TDvmRZIGYgJfs6RPlfEFFFGezlyFG99KeC0Z__yS2JdDuq-CNmxpa87lbDVFcAINxUKFvkZReGlhQiZyJOwZ11pHBTbQUIfSn625t5IwjOo4p5i5lBnShRR0HtYJTqF82nHG0uCorikY6vo04iQW76f4ELTjs',
  ),
  ProductItem(
    title: 'LAMİNE GÜVENLİK CAMI',
    category: 'Camlar',
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBNkNO84U3QETgYe_acmG5IUvWF4cuPv1_A8O1VLvw6wF-v2fqeNRL8Nsg-hZHcKel4OUfNVaIsdgUFxY3yZK3s5oykMnIipYAhEyUOvwzoBTSqI7DsvV0ESvZG9Xjsbln6KKodGnhPvWLVrWwbW0DB9WgOoFYLhy4JHb50qRymtCpSBkdYfw9aG7RugP4rxHAfe8Zp6wyh-6pNKBaRYBoval5yllNCxN424r8tzjzuJAh6NDK2T16al5noM54UyxyYTqtTIo1zsX4',
  ),
  ProductItem(title: 'ŞEFFAF BÖLME CAMI', category: 'Camlar', imageUrl: 'https://picsum.photos/seed/cam4/600/800'),
  ProductItem(title: 'RENKLİ DEKORATİF CAM', category: 'Camlar', imageUrl: 'https://picsum.photos/seed/cam5/600/800'),
  ProductItem(title: 'AKUSTİK YALITIM CAMI', category: 'Camlar', imageUrl: 'https://picsum.photos/seed/cam6/600/800'),
  ProductItem(title: 'REFLEKTE DIŞ CEPHE CAMI', category: 'Camlar', imageUrl: 'https://picsum.photos/seed/cam7/600/800'),
  ProductItem(title: 'SATİNA MAT CAM', category: 'Camlar', imageUrl: 'https://picsum.photos/seed/cam8/600/800'),
  ProductItem(title: 'TELLİ GÜVENLİK CAMI', category: 'Camlar', imageUrl: 'https://picsum.photos/seed/cam9/600/800'),
  ProductItem(title: 'VİTRAY ÖZEL TASARIM CAM', category: 'Camlar', imageUrl: 'https://picsum.photos/seed/cam10/600/800'),

  // --- DRESUARLAR (10 Adet) ---
  ProductItem(
    title: 'LÜKS CAM DRESUAR',
    category: 'Dresuarlar',
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD33_TJUZ2dFUZFiMuWof32yMnpt6S0AIvcvZlB8qkSLi02ApSz00_6ZRfUYedp3_5Oc7CTgp4ACu1uCYl1Sx2cFXIjaRGCQvZesSAsBdOT6aV6gvnr0WW7UMzIcfAxXcr46sG8lvrUDSPgtMTrYrSFjaohhQAO574tmUaEpZGTq710BsPhitfgtCEexFqYvwfJvRjx3usLVlELFc_B1XXOKvUEPj66JHF5cQ9ro26W45Srceu9YE2uj71n8lz50_Z4VhExPEkL54c',
  ),
  ProductItem(title: 'GOLD AYAKLI CAM DRESUAR', category: 'Dresuarlar', imageUrl: 'https://picsum.photos/seed/dresuar2/600/800'),
  ProductItem(title: 'SİYAH PROFİL DRESUAR', category: 'Dresuarlar', imageUrl: 'https://picsum.photos/seed/dresuar3/600/800'),
  ProductItem(title: 'AHŞAP DETAYLI CAM DRESUAR', category: 'Dresuarlar', imageUrl: 'https://picsum.photos/seed/dresuar4/600/800'),
  ProductItem(title: 'BRONZ CAMLI ANTRE DRESUARI', category: 'Dresuarlar', imageUrl: 'https://picsum.photos/seed/dresuar5/600/800'),
  ProductItem(title: 'KLASİK MERMER DESEN DRESUAR', category: 'Dresuarlar', imageUrl: 'https://picsum.photos/seed/dresuar6/600/800'),
  ProductItem(title: 'MİNİMAL BEYAZ DRESUAR', category: 'Dresuarlar', imageUrl: 'https://picsum.photos/seed/dresuar7/600/800'),
  ProductItem(title: 'FÜME CAM DRESUAR', category: 'Dresuarlar', imageUrl: 'https://picsum.photos/seed/dresuar8/600/800'),
  ProductItem(title: 'ZEMİN AYDINLATMALI DRESUAR', category: 'Dresuarlar', imageUrl: 'https://picsum.photos/seed/dresuar9/600/800'),
  ProductItem(title: 'İKİ KATLI DÜZ DRESUAR', category: 'Dresuarlar', imageUrl: 'https://picsum.photos/seed/dresuar10/600/800'),
];

class CatalogContent extends StatelessWidget {
  final ValueChanged<PageType> onNavigate;
  final String category;
  
  const CatalogContent({super.key, required this.onNavigate, required this.category});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    
    final filteredItems = allProducts.where((p) => p.category == category).toList();

    return Container(
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1440),
        padding: EdgeInsets.only(
          left: isMobile ? 32 : 64,
          right: isMobile ? 32 : 64,
          top: 160,
          bottom: 80,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ÜRÜN KATALOĞU / ${category.toUpperCase()}', style: AppTextStyles.labelCaps.copyWith(color: AppColors.textSecondary)),
            const SizedBox(height: 16),
            Text('KOLEKSİYONLARIMIZ', style: AppTextStyles.headlineLg.copyWith(fontSize: isMobile ? 32 : 40)),
            const SizedBox(height: 64),
            if (filteredItems.isEmpty)
              const Text('Bu kategoride henüz ürün bulunmuyor.')
            else
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 1 : 3,
                  crossAxisSpacing: 32,
                  mainAxisSpacing: 48,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  return GestureDetector(
                    onTap: () => onNavigate(PageType.productDetail),
                    child: CollectionCard(
                      title: item.title,
                      subtitle: 'Kategori: ${item.category}',
                      imageUrl: item.imageUrl,
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailContent extends StatelessWidget {
  final ValueChanged<PageType>? onNavigate;
  const ProductDetailContent({super.key, this.onNavigate});

  Widget _buildTechRow(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.outline, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(label, style: AppTextStyles.labelCaps.copyWith(color: AppColors.textSecondary))),
          Text(value, style: AppTextStyles.bodyMd.copyWith(color: AppColors.charcoal, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 800;
    
    final mainImage = 'https://lh3.googleusercontent.com/aida-public/AB6AXuDWDDL_X3trpafeJ3-62wWrY_n1V8DqyZ0Qz44qnKSFYZS9lzkLJdvlt2CKdW-1VUWROi5xeLSSP51iz7EGh6ZweErvWGQdoa5U3iEmHp2y9LTc1x1flfJqJkch6KstjhlzCeY3IfibbCW_cMyr0XHfpF_EmkvBbC2-S7UGeeVkRkuREX54TmKnl1fhnov2LOYhjTPPEyuzOk1dzQ-_fdn2xJvBfbmgcXvFn5eW4bqjCLaLypMr-KRQc1GJsX5S-cXT6i6zcDTcCwc';
    final thumbnails = [
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDkLv0NU_jmUfGygDpn1iAENZLyyDwY08VQzl7GxBqn1Uo-DfCLTFa2U9N3DniE9Re90hecQbFmpevf7XqFfvmZtcvlQvIvUWgq8Sf25inY1NOTiPKU0m0ryKKkaF73LGriutiNyhznBgr0NjG4LYfj2g8kyuq-q9rS1nKqoKQLsG4BV2Gdw5kri4v9lWXqVnJDuuPn4_WvKz7mJGi8wTrTf-v7uqcJdUj1iLDEyfUmrmRUiGFgTXA7HHS_UbUHAtqv_1MDosINU6c',
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAXUiNkuy4QU_AjM9wR5Xs4_nxsNvpXk-P009M28mHfGbXhhjEm_Quhtu-WmZqgr_m6LG4P0kuq9p67MoqSjmNyOZ9C_2ryrgEk6vr7FaoDJvN1C4nMz9JvmSQwGcnSusEGaxfk7dhvWaOZQ3fBpAFbynbMDT4yccQdiHNM27VNJoi5-XIJQPGxtvHWnME5sTvqIQkeUbKuZOg2rdSDzZ57LhSMxvHHKkGBCPaM6XmvBhYE1WCInXHGFucezsWZOYsREPb4mXuB5wI',
      'https://lh3.googleusercontent.com/aida-public/AB6AXuBLiDLXPPF8b-dBgXZFQpItZ-Ha7VQPCaUJW9pp7LWVzM4xk0PWqbFnmzBp376sEq8D7of5pcYflJOSW13RCjiVSoSdbDTKwE3uU9vhhGw9B1vaAAh2ZkXBMVWkkI2B_wcj51MQSZuPlW3K51lxmDzM8Ujc6ik5Z0SeJJIHFPmRsdDWq_W-1M60DNjmp2TbhIyREYdcUySs8UARdZo31HEwoaZiGr2Eh5EVbyV5pq2VTQW8IDDfI9GWjSujZFdwyWvia-SghYa7Sq8',
    ];

    final workshopImage = 'https://lh3.googleusercontent.com/aida-public/AB6AXuBbAF675t9XVCrk67uXOk33MSB7ZIWQFDI2rwDqZy85LSR83M7YOiGK73L97PrFDog1MsLlvz386RfiCPWjAD85oSnAjVCx0go6_D8EPaLOgIi79p58y6Y50Of95vWbkkfS8qozPjAysQc6qhBAyoT5Mlad0_lWQ-HBM5dKg22dyb-ECkUY6DtzdKYMVVkTWThHZtQzRJmnYus3ArE05d3noaOkSUPpa2TZGeSqAQAeGU-alAbtS9T8FLE9xC3DOiRVTzX_Wa4uqfE';

    return Container(
      width: double.infinity,
      color: const Color(0xFFF9F9F9), // Light background to match design
      alignment: Alignment.topCenter,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1440),
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 32 : 120, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TOP SECTION: Images & Details
            Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LEFT COLUMN: Images
                Expanded(
                  flex: isMobile ? 0 : 5,
                  child: Column(
                    children: [
                      // Main Image with Badge
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(border: Border.all(color: AppColors.outline)),
                            child: Image.network(mainImage, fit: BoxFit.cover, height: isMobile ? 400 : 700),
                          ),
                          Container(
                            margin: const EdgeInsets.all(24),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            color: Colors.white.withValues(alpha: 0.9),
                            child: Text(
                              'MODEL: VND01-2024',
                              style: AppTextStyles.labelCaps.copyWith(color: AppColors.textSecondary, fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Thumbnails
                      Row(
                        children: thumbnails.map((url) => Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: url == thumbnails.last ? 0 : 16),
                            child: Container(
                              height: isMobile ? 80 : 140,
                              decoration: BoxDecoration(border: Border.all(color: AppColors.outline)),
                              child: Image.network(url, fit: BoxFit.cover),
                            ),
                          ),
                        )).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: isMobile ? 0 : 80, height: isMobile ? 48 : 0),
                
                // RIGHT COLUMN: Details
                Expanded(
                  flex: isMobile ? 0 : 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('KOLEKSİYONLAR > VENEDİK SERİSİ', style: AppTextStyles.labelCaps.copyWith(color: AppColors.textSecondary)),
                      const SizedBox(height: 24),
                      Text('Venedik Serisi\nDresuar', style: AppTextStyles.headlineLg.copyWith(color: AppColors.charcoal, fontSize: isMobile ? 40 : 64, height: 1.1)),
                      const SizedBox(height: 32),
                      Text(
                        'Geleneksel cam işleme sanatının modern mimariyle buluştuğu nokta. Venedik Serisi, şeffaflığın ve yansımanın en saf halini yaşam alanlarınıza taşıyor. El işçiliğiyle hazırlanan kenar detayları ve üstün cam kalitesiyle zamansız bir parça.',
                        style: AppTextStyles.bodyLg.copyWith(color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 64),
                      Text('TEKNİK ÖZELLİKLER', style: AppTextStyles.labelCaps.copyWith(color: AppColors.charcoal)),
                      const SizedBox(height: 8),
                      Container(height: 1, color: AppColors.outline),
                      _buildTechRow('MALZEME', 'Ekstra Berrak Flotal Ayna'),
                      _buildTechRow('STANDART BOYUT', '120cm x 40cm x 85cm'),
                      _buildTechRow('YÜZEY İŞLEMİ', 'Bizote & Polisaj'),
                      _buildTechRow('TAŞIMA KAPASİTESİ', '45 kg'),
                      const SizedBox(height: 48),
                      // Special Measure Box
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: AppColors.outline),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.architecture, color: AppColors.charcoal, size: 24),
                                const SizedBox(width: 16),
                                Text('Özel Ölçü Seçeneği', style: AppTextStyles.headlineMd.copyWith(color: AppColors.charcoal)),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Projelerinize uygun özel boyut ve cam rengi seçenekleri için uzman ekibimizle iletişime geçebilirsiniz.',
                              style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 48),
                      // Buttons
                      Flex(
                        direction: isMobile ? Axis.vertical : Axis.horizontal,
                        children: [
                          Expanded(
                            flex: isMobile ? 0 : 1,
                            child: HoverButtonDarkWithIcon(text: 'WHATSAPP İLE BİLGİ AL', icon: Icons.chat_bubble_outline, onTap: () {}),
                          ),
                          SizedBox(width: isMobile ? 0 : 16, height: isMobile ? 16 : 0),
                          Expanded(
                            flex: isMobile ? 0 : 1,
                            child: HoverButtonOutline(text: 'İLETİŞİME GEÇ', onTap: () {
                              if (onNavigate != null) onNavigate!(PageType.contact);
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 160),
            
            // BOTTOM SECTION: Zanaat ve Teknoloji
            Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: isMobile ? 0 : 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Zanaat ve Teknoloji', style: AppTextStyles.headlineMd.copyWith(color: AppColors.charcoal, fontSize: 24)),
                      const SizedBox(height: 32),
                      Text(
                        'Her bir parça, İstanbul\'daki atölyemizde usta zanaatkarlarımız tarafından titizlikle işlenir. Arslan Cam Ayna olarak, 40 yılı aşkın tecrübemizi modern CNC kesim teknolojileriyle birleştiriyoruz.',
                        style: AppTextStyles.bodyLg.copyWith(color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Venedik serisinde kullanılan aynalar, yüksek korozyon direnci ve berraklığıyla bilinen dünya standartlarında üretim yapan cam tesislerinden tedarik edilmektedir.',
                        style: AppTextStyles.bodyLg.copyWith(color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 48),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.check_circle_outline, color: AppColors.charcoal, size: 24),
                          const SizedBox(width: 16),
                          Expanded(child: Text('Kurşun içermeyen çevre dostu üretim süreçleri.', style: AppTextStyles.bodyLg.copyWith(color: AppColors.charcoal))),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.check_circle_outline, color: AppColors.charcoal, size: 24),
                          const SizedBox(width: 16),
                          Expanded(child: Text('Mimari projelere özel teknik destek ve montaj.', style: AppTextStyles.bodyLg.copyWith(color: AppColors.charcoal))),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: isMobile ? 0 : 80, height: isMobile ? 64 : 0),
                Expanded(
                  flex: isMobile ? 0 : 1,
                  child: Container(
                    width: double.infinity,
                    height: isMobile ? 300 : 450,
                    decoration: BoxDecoration(border: Border.all(color: AppColors.outline)),
                    child: Image.network(workshopImage, fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HoverButtonDarkWithIcon extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  const HoverButtonDarkWithIcon({super.key, required this.text, required this.icon, required this.onTap});

  @override
  State<HoverButtonDarkWithIcon> createState() => _HoverButtonDarkWithIconState();
}

class _HoverButtonDarkWithIconState extends State<HoverButtonDarkWithIcon> {
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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.charcoal.withValues(alpha: 0.8) : AppColors.charcoal,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  widget.text,
                  style: AppTextStyles.labelCaps.copyWith(color: Colors.white, letterSpacing: 2),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HoverButtonOutline extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  const HoverButtonOutline({super.key, required this.text, required this.onTap});

  @override
  State<HoverButtonOutline> createState() => _HoverButtonOutlineState();
}

class _HoverButtonOutlineState extends State<HoverButtonOutline> {
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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _isHovered ? Colors.grey[100] : Colors.transparent,
            border: Border.all(color: AppColors.charcoal, width: 1),
          ),
          child: Text(
            widget.text,
            style: AppTextStyles.labelCaps.copyWith(color: AppColors.charcoal, letterSpacing: 2),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

class AboutContent extends StatelessWidget {
  final ValueChanged<PageType>? onNavigate;
  const AboutContent({super.key, this.onNavigate});

  Widget _buildFeature(IconData icon, String title, String desc) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.charcoal, size: 32),
          const SizedBox(height: 24),
          Text(title, style: AppTextStyles.headlineMd.copyWith(color: AppColors.charcoal)),
          const SizedBox(height: 16),
          Text(desc, style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildTechRow(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.outline, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(label, style: AppTextStyles.labelCaps.copyWith(color: AppColors.charcoal))),
          Text(value, style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 800;

    return Container(
      width: double.infinity,
      color: const Color(0xFFF9F9F9), // Light background for About page
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          // 1. HERO SECTION
          SizedBox(
            height: isMobile ? 400 : 600,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuBbAF675t9XVCrk67uXOk33MSB7ZIWQFDI2rwDqZy85LSR83M7YOiGK73L97PrFDog1MsLlvz386RfiCPWjAD85oSnAjVCx0go6_D8EPaLOgIi79p58y6Y50Of95vWbkkfS8qozPjAysQc6qhBAyoT5Mlad0_lWQ-HBM5dKg22dyb-ECkUY6DtzdKYMVVkTWThHZtQzRJmnYus3ArE05d3noaOkSUPpa2TZGeSqAQAeGU-alAbtS9T8FLE9xC3DOiRVTzX_Wa4uqfE',
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: isMobile ? 24 : 120,
                      right: isMobile ? 24 : w * 0.4,
                    ),
                    child: Container(
                      color: Colors.white.withValues(alpha: 0.85),
                      padding: EdgeInsets.all(isMobile ? 32 : 64),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Yarım Asırlık\nUstalık, Modern\nÇizgiler',
                            style: AppTextStyles.headlineLg.copyWith(color: AppColors.charcoal, fontSize: isMobile ? 32 : 56, height: 1.1),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            '1970\'den beri camın şeffaflığını ve aynanın derinliğini sanatla buluşturuyoruz. Geleneksel zanaat tekniklerini, modern mimari trendlerle harmanlayarak mekanlarınıza değer katıyoruz.',
                            style: AppTextStyles.bodyLg.copyWith(color: AppColors.textSecondary),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // 2. HİKAYEMİZ
          Container(
            constraints: const BoxConstraints(maxWidth: 1440),
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 32 : 120, vertical: 120),
            child: Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: isMobile ? 0 : 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('HİKAYEMİZ', style: AppTextStyles.labelCaps.copyWith(color: AppColors.textSecondary)),
                      const SizedBox(height: 24),
                      Text(
                        'Şeffaflık ve\nDürüstlükle Geçen 50 Yıl',
                        style: AppTextStyles.headlineLg.copyWith(color: AppColors.charcoal, fontSize: isMobile ? 32 : 48),
                      ),
                      const SizedBox(height: 48),
                      Text(
                        'Arslan Cam Ayna, küçük bir atölyede başlayan cam tutkusunu bugün Türkiye\'nin seçkin mimari projelerine çözüm sunan bir marka haline getirdi. Her kesimde bir hikaye, her yansımada bir titizlik barındırıyoruz.',
                        style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Kaliteye olan bağlılığımız, yalnızca kullandığımız ham maddede değil, aynı zamanda müşterilerimizle kurduğumuz güven esaslı ilişkilerde yatmaktadır. Camın kırılganlığını zarafete, aynanın düzlüğünü derinliğe dönüştürmek bizim için bir işten öte, bir zanaat disiplinidir.',
                        style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: isMobile ? 0 : 80, height: isMobile ? 64 : 0),
                Expanded(
                  flex: isMobile ? 0 : 1,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Image.network(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuBi5GXOZBAnOWl-1INnxIUBxT9AcvLxOvp1wkCb-fRFlrnyRjFVPYW2qaYgdDiFkV6NwWtVx-YctVuCeiYPMmAR81RgCFdYtwQBg5OwXoKvpey7jPzv34WNaRSPTCRqN-vi_2zN6lP0R02CwtGGJdMYDpIJ6aNyBm2ZSL2k-DSDLLaFgpjr0WIqeCO08hyiKoS_psiVcG0dnAmpiYpp-kFCA3FDdTGxgv2T5IYiZ_z_0QAWlq9uRjdmPug5sRFuQ_jYgddEneJspDM',
                        fit: BoxFit.cover,
                      ),
                      Container(
                        color: AppColors.background,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        child: Text(
                          'ESTETİK VE TEKNOLOJİ BİR ARADA',
                          style: AppTextStyles.labelCaps.copyWith(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 3. DNA
          Container(
            constraints: const BoxConstraints(maxWidth: 1440),
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 32 : 120, vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('DEĞERLERİMİZ', style: AppTextStyles.labelCaps.copyWith(color: AppColors.textSecondary)),
                        const SizedBox(height: 16),
                        Text('Kurumsal DNA\'mız', style: AppTextStyles.headlineLg.copyWith(color: AppColors.charcoal, fontSize: isMobile ? 32 : 40)),
                      ],
                    ),
                    if (!isMobile)
                      Container(width: 120, height: 1, color: AppColors.outline),
                  ],
                ),
                const SizedBox(height: 64),
                Flex(
                  direction: isMobile ? Axis.vertical : Axis.horizontal,
                  children: [
                    Expanded(
                      flex: isMobile ? 0 : 1,
                      child: _buildFeature(Icons.emoji_events_outlined, 'Üstün Kalite', 'Uluslararası standartlarda sertifikalı cam ve ayna panelleri ile ömür boyu dayanıklılık garantisi sunuyoruz.'),
                    ),
                    SizedBox(width: isMobile ? 0 : 32, height: isMobile ? 32 : 0),
                    Expanded(
                      flex: isMobile ? 0 : 1,
                      child: _buildFeature(Icons.architecture, 'Özel Tasarım', 'Mimar ve tasarımcıların hayallerini, özel kesim ve işleme teknikleriyle gerçeğe dönüştüren butik üretim anlayışı.'),
                    ),
                    SizedBox(width: isMobile ? 0 : 32, height: isMobile ? 32 : 0),
                    Expanded(
                      flex: isMobile ? 0 : 1,
                      child: _buildFeature(Icons.brush_outlined, 'Sanatsal Yaklaşım', 'Camı sadece yapı malzemesi değil, mekana ruh katan sanatsal bir enstrüman olarak ele alıyoruz.'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 4. TEKNİK
          Container(
            constraints: const BoxConstraints(maxWidth: 1440),
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 32 : 120, vertical: 80),
            child: Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: isMobile ? 0 : 1,
                  child: Text(
                    'Teknik\nMükemmeliyet',
                    style: AppTextStyles.headlineLg.copyWith(color: AppColors.charcoal, fontSize: isMobile ? 32 : 40),
                  ),
                ),
                SizedBox(width: isMobile ? 0 : 80, height: isMobile ? 48 : 0),
                Expanded(
                  flex: isMobile ? 0 : 2,
                  child: Column(
                    children: [
                      _buildTechRow('MİN KESİM HASSASİYETİ', '+/- 0.1 mm'),
                      _buildTechRow('TEMPERLEME KAPASİTESİ', '4mm - 19mm Arası'),
                      _buildTechRow('AYNA PARLAKLIK DERECESİ', 'Ultra High Reflectivity'),
                      _buildTechRow('RENK SEÇENEKLERİ', 'Bronz, Füme, Antik, Pembe Gold'),
                      _buildTechRow('UYGULAMA ALANLARI', 'Rezidans, Otel, Ticari Mekan'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 5. CTA
          Container(
            constraints: const BoxConstraints(maxWidth: 1440),
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 32 : 120, vertical: 80),
            child: Container(
              width: double.infinity,
              color: AppColors.charcoal,
              padding: EdgeInsets.symmetric(vertical: 80, horizontal: isMobile ? 32 : 64),
              child: Column(
                children: [
                  Text(
                    'Projenizi Bir Üst Seviyeye Taşıyın',
                    style: AppTextStyles.headlineLg.copyWith(color: Colors.white, fontSize: isMobile ? 32 : 48),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Uzman ekibimizle detaylı görüşmek, planlarınızı ve vizyonunuzu hayata geçirmek için iletişime geçin.',
                    style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  HoverButtonLight(text: 'İLETİŞİME GEÇİN', onTap: () {
                    if (onNavigate != null) onNavigate!(PageType.contact);
                  }),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 120),
        ],
      ),
    );
  }
}

class HoverButtonLight extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  const HoverButtonLight({super.key, required this.text, required this.onTap});

  @override
  State<HoverButtonLight> createState() => _HoverButtonLightState();
}

class _HoverButtonLightState extends State<HoverButtonLight> {
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
            color: _isHovered ? Colors.grey[200] : Colors.white,
          ),
          child: Text(
            widget.text,
            style: AppTextStyles.labelCaps.copyWith(color: AppColors.charcoal, letterSpacing: 3),
          ),
        ),
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
    
    final mapImage = 'https://static-maps.yandex.ru/1.x/?lang=tr_TR&ll=32.8890964,39.9678273&size=650,450&scale=2&z=16&l=map&pt=32.8890964,39.9678273,pm2rdm';

    return Container(
      width: double.infinity,
      color: const Color(0xFFF9F9F9),
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
            // Top Section
            Text('Bizimle İletişime Geçin', style: AppTextStyles.headlineLg.copyWith(fontSize: isMobile ? 40 : 64, color: AppColors.charcoal, height: 1.1)),
            const SizedBox(height: 24),
            Text(
              'Mimari projeleriniz veya özel cam tasarımlarınız için uzman ekibimizle tanışın.\nSize en kısa sürede dönüş yapacağız.',
              style: AppTextStyles.bodyLg.copyWith(color: AppColors.textSecondary, height: 1.6),
            ),
            const SizedBox(height: 80),
            
            // Flex Columns
            Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LEFT COLUMN: Form
                Expanded(
                  flex: isMobile ? 0 : 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: const _LineField(label: 'İSİM SOYİSİM', hint: 'Ahmet Yılmaz')),
                          const SizedBox(width: 32),
                          Expanded(child: const _LineField(label: 'E-POSTA', hint: 'ahmet@email.com')),
                        ],
                      ),
                      const SizedBox(height: 48),
                      const _LineField(label: 'KONU', hint: 'Özel Cam Siparişi', icon: Icons.keyboard_arrow_down),
                      const SizedBox(height: 48),
                      const _LineField(label: 'MESAJINIZ', hint: 'Projeniz hakkında detaylı bilgi verin...', isMultiline: true),
                      const SizedBox(height: 64),
                      HoverButtonDark(text: 'GÖNDER', onTap: () {}),
                    ],
                  ),
                ),
                
                SizedBox(width: isMobile ? 0 : 120, height: isMobile ? 80 : 0),
                
                // RIGHT COLUMN: Contact Info
                Expanded(
                  flex: isMobile ? 0 : 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('İLETİŞİM KANALLARI', style: AppTextStyles.labelCaps.copyWith(color: AppColors.textSecondary, letterSpacing: 2)),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          const Icon(Icons.phone_outlined, color: AppColors.charcoal, size: 20),
                          const SizedBox(width: 16),
                          Text('+90 (212) 555 00 00', style: AppTextStyles.bodyLg.copyWith(color: AppColors.charcoal)),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          const Icon(Icons.chat_bubble_outline, color: AppColors.charcoal, size: 20),
                          const SizedBox(width: 16),
                          Text('WhatsApp ile Yazın', style: AppTextStyles.bodyLg.copyWith(color: AppColors.charcoal)),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          const Icon(Icons.alternate_email, color: AppColors.charcoal, size: 20),
                          const SizedBox(width: 16),
                          Text('@arslan_cam_ayna', style: AppTextStyles.bodyLg.copyWith(color: AppColors.charcoal)),
                        ],
                      ),
                      const SizedBox(height: 48),
                      Text('MERKEZ OFİS & ATÖLYE', style: AppTextStyles.labelCaps.copyWith(color: AppColors.textSecondary, letterSpacing: 2)),
                      const SizedBox(height: 24),
                      Text(
                        'Güneşevler Mahallesi, 117. Cadde,\nNo: 19A, Altındağ / Ankara',
                        style: AppTextStyles.bodyLg.copyWith(color: AppColors.charcoal, height: 1.6),
                      ),
                      const SizedBox(height: 48),
                      // Map Box
                      InteractiveMapBox(mapImage: mapImage),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LineField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? icon;
  final bool isMultiline;

  const _LineField({
    required this.label,
    required this.hint,
    this.icon,
    this.isMultiline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.labelCaps.copyWith(color: AppColors.textSecondary, letterSpacing: 2)),
        const SizedBox(height: 16),
        TextField(
          maxLines: isMultiline ? 4 : 1,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.bodyMd.copyWith(color: AppColors.outline),
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.outline)),
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.charcoal, width: 2)),
            suffixIcon: icon != null ? Icon(icon, color: AppColors.outline) : null,
          ),
          style: AppTextStyles.bodyMd.copyWith(color: AppColors.charcoal),
        ),
      ],
    );
  }
}

class HoverButtonDark extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  const HoverButtonDark({super.key, required this.text, required this.onTap});

  @override
  State<HoverButtonDark> createState() => _HoverButtonDarkState();
}

class _HoverButtonDarkState extends State<HoverButtonDark> {
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
            color: _isHovered ? AppColors.charcoal.withValues(alpha: 0.8) : AppColors.charcoal,
          ),
          child: Text(
            widget.text,
            style: AppTextStyles.labelCaps.copyWith(color: Colors.white, letterSpacing: 3),
          ),
        ),
      ),
    );
  }
}

class InteractiveMapBox extends StatelessWidget {
  final String mapImage;
  const InteractiveMapBox({super.key, required this.mapImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: double.infinity,
          height: 300,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(border: Border.all(color: AppColors.outline)),
          child: Image.network(
            mapImage,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        // Google Maps Link Button
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: GestureDetector(
            onTap: () async {
              final uri = Uri.parse('https://maps.app.goo.gl/qzCuh78JdLn4Su8z9');
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: const BoxDecoration(
                color: AppColors.charcoal,
              ),
              child: Text(
                'HARİTADA GÖR',
                style: AppTextStyles.labelCaps.copyWith(color: Colors.white, letterSpacing: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
