import 'dart:async';
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
  final List<String> imageUrls;
  final List<String> styleTags;
  final String description;
  final BoxFit fit;
  const ProductItem({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.imageUrls,
    this.styleTags = const [],
    this.description = '',
    this.fit = BoxFit.cover,
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
    imageUrls: [
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAaQ2bpUSggNk7TdPNcdAEFHzAjoJ8__rC1VihCtRXv8rjs_2VWuweWxsbLZfmFdD5PQ91x2ax00DdMcfkkYMh_jzoT8SawYEOb93cAEziv6UwcDkUF5_OPKTd8y2nLHKOFrI015wt8xwa-bYY52y0TBZy-h3LSOjs49-7JVHhQBCt_RqbCX1xoyukvtKruiaWNIL03akeUpWnquiet1GstwWXlI4llxbOSSW5focrx49ASNPM9DGke6PW_cMsxTWerwE8H-G1RGYI',
      'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?q=80&w=800',
      'https://images.unsplash.com/photo-1581428982868-e410dd047a90?q=80&w=800',
      'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?q=80&w=800',
    ],
  ),
  const ProductItem(
    id: 'a2',
    title: 'AURA AYDINLATMALI AYNA',
    category: 'Aynalar',
    styleTags: ['Luxury', 'Modern'],
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD0vY5-R_eMzt2s9Lx-7YHe3Io11GvQXVWjK9Z5tsK4ujKzZLDgs4VVr2wwg7UrWBvBFgfD-hU-hN4a-DjZwzayJznGwFJqGYKr-DZ2IrtID_MwqHs1xi1MwK9Py5CqeCXvoNbVoDpJrbYokgt8NkXCsIWCgG24RCBHYhy7BPX1ikoW8YIoMxXAF7DrGQguz7acfRgRPn9LPZ2Pb5G0kzFZyypEgUUAz1FdimLzw3yDdx8GwzsgS8OgD9n61kjZ-p2QEZiRP_8N-qU',
    imageUrls: [
      'https://lh3.googleusercontent.com/aida-public/AB6AXuD0vY5-R_eMzt2s9Lx-7YHe3Io11GvQXVWjK9Z5tsK4ujKzZLDgs4VVr2wwg7UrWBvBFgfD-hU-hN4a-DjZwzayJznGwFJqGYKr-DZ2IrtID_MwqHs1xi1MwK9Py5CqeCXvoNbVoDpJrbYokgt8NkXCsIWCgG24RCBHYhy7BPX1ikoW8YIoMxXAF7DrGQguz7acfRgRPn9LPZ2Pb5G0kzFZyypEgUUAz1FdimLzw3yDdx8GwzsgS8OgD9n61kjZ-p2QEZiRP_8N-qU',
      'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?q=80&w=800',
      'https://images.unsplash.com/photo-1581428982868-e410dd047a90?q=80&w=800',
      'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?q=80&w=800',
    ],
  ),
  const ProductItem(
    id: 'a3',
    title: 'FLUTLU DEKORATIF AYNA',
    category: 'Aynalar',
    styleTags: ['Vintage', 'Classic'],
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDKcyVShv4VHFDlopj7bJfQjD0RvXQktsJpolKZ3ZAGmAksy7Tr8kVWTO5SbcmOVuEB1jBtijPusOAajg0A6PAx7iMwvwFnug-nRWb7NJaVb7z3Z7CUehB5udSTehaQCWFSz0wGHFXTabXprQm6jgswjwtx1Yfv2wmDeLxj9T6UJlT5gJQXbtJgf7qnOXwYAhxQ6Pu2n5Moix61jcarIb3T1_yED5WZYGTj0RaTjYmzK9xd9YX2c0qohFjQYVgalZ2UUAoCSix6_iE',
    imageUrls: [
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDKcyVShv4VHFDlopj7bJfQjD0RvXQktsJpolKZ3ZAGmAksy7Tr8kVWTO5SbcmOVuEB1jBtijPusOAajg0A6PAx7iMwvwFnug-nRWb7NJaVb7z3Z7CUehB5udSTehaQCWFSz0wGHFXTabXprQm6jgswjwtx1Yfv2wmDeLxj9T6UJlT5gJQXbtJgf7qnOXwYAhxQ6Pu2n5Moix61jcarIb3T1_yED5WZYGTj0RaTjYmzK9xd9YX2c0qohFjQYVgalZ2UUAoCSix6_iE',
      'https://images.unsplash.com/photo-1581428982868-e410dd047a90?q=80&w=800',
      'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?q=80&w=800',
      'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?q=80&w=800',
    ],
  ),
  const ProductItem(
    id: 'a4',
    title: 'ELIPS MODERN AYNA',
    category: 'Aynalar',
    styleTags: ['Oval Collection'],
    imageUrl: 'https://picsum.photos/seed/ayna4/600/800',
    imageUrls: [
      'https://picsum.photos/seed/ayna4/600/800',
      'https://images.unsplash.com/photo-1581428982868-e410dd047a90?q=80&w=800',
      'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?q=80&w=800',
      'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?q=80&w=800',
    ],
  ),
  const ProductItem(
    id: 'a5',
    title: 'CERCEVESIZ SALON AYNASI',
    category: 'Aynalar',
    styleTags: ['Minimal'],
    imageUrl: 'https://picsum.photos/seed/ayna5/600/800',
    imageUrls: [
      'https://picsum.photos/seed/ayna5/600/800',
      'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?q=80&w=800',
      'https://images.unsplash.com/photo-1581428982868-e410dd047a90?q=80&w=800',
      'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?q=80&w=800',
    ],
  ),

  // --- TABLOLAR ---
  const ProductItem(
    id: 'c1',
    title: 'YASAM AGACI DEKORATIF TABLO',
    category: 'Tablolar',
    styleTags: ['Sanatsal', 'Renkli', 'Modern'],
    imageUrl: 'assets/images/tablo_1.png',
    imageUrls: [
      'assets/images/tablo_1.png',
      'assets/images/tablo_2.png',
      'assets/images/tablo_3.png',
      'assets/images/tablo_4.png',
    ],
    description: 'Canli renk gecisleri ve koklerden tepeye uzanan kompozisyonuyla yasam enerjisini mekana tasiyan modern dekoratif tablo.',
  ),
  const ProductItem(
    id: 'c2',
    title: 'BEYAZ TAVUS KUSU TABLO',
    category: 'Tablolar',
    styleTags: ['Luks', 'Klasik', 'Elegant', 'Modern'],
    imageUrl: 'assets/images/tablo_2.png',
    imageUrls: [
      'assets/images/tablo_2.png',
      'assets/images/tablo_1.png',
      'assets/images/tablo_3.png',
      'assets/images/tablo_4.png',
    ],
    description: 'Inci beyazi dokular ve mavi detaylarla zenginlesen tavus kusu temasi, salonda odak noktasi olusturan premium bir tasarim sunar.',
  ),
  const ProductItem(
    id: 'c3',
    title: 'KELEBEK VE MAVI GUL TABLO',
    category: 'Tablolar',
    styleTags: ['Romantik', 'Sanatsal', 'Modern'],
    imageUrl: 'assets/images/tablo_3.png',
    imageUrls: [
      'assets/images/tablo_3.png',
      'assets/images/tablo_1.png',
      'assets/images/tablo_2.png',
      'assets/images/tablo_4.png',
    ],
    description: 'Narin kelebek formu ile mavi gul detaylarini birlestiren bu kompozisyon, duvara zarif ve etkileyici bir karakter kazandirir.',
  ),
  const ProductItem(
    id: 'c4',
    title: 'SOYUT ALTIN GEOMETRI TABLO',
    category: 'Tablolar',
    styleTags: ['Soyut', 'Geometrik', 'Luks', 'Modern'],
    imageUrl: 'assets/images/tablo_4.png',
    imageUrls: [
      'assets/images/tablo_4.png',
      'assets/images/tablo_1.png',
      'assets/images/tablo_2.png',
      'assets/images/tablo_3.png',
    ],
    description: 'Altin tonlu geometrik katmanlar ve aydinlik yansimalarla tasarlanan soyut form, modern ic mekanlara derinlik katar.',
  ),
  const ProductItem(
    id: 'c5',
    title: 'METALIK CICEK KOMPOZISYONU',
    category: 'Tablolar',
    styleTags: ['Cicek', 'Zarif', 'Modern'],
    imageUrl: 'assets/images/tablo_5.png',
    imageUrls: [
      'assets/images/tablo_5.png',
      'assets/images/tablo_1.png',
      'assets/images/tablo_2.png',
      'assets/images/tablo_3.png',
    ],
    description: 'Metalik mavi ve gumus gecisleriyle bicimlenen cicek kompozisyonu, rafine bir gorunumu guclu bir sanat diliyle bulusturur.',
  ),
  const ProductItem(
    id: 'c6',
    title: 'GOLD DETAYLI TRIPTIK KELEBEK TABLO',
    category: 'Tablolar',
    styleTags: ['Aynalı Çerçeve', 'Lüks', 'Kelebek', 'Gold Detay', 'Modern'],
    imageUrl: 'assets/images/kelebek_tablo_1.png',
    imageUrls: [
      'assets/images/kelebek_tablo_1.png',
      'assets/images/kelebek_tablo_2.png',
      'assets/images/kelebek_tablo_3.png',
    ],
    description: 'Premium eskitme ayna cerceve icerisinde yer alan, zarif gold konturlere sahip el yapimi kabartmali kelebek formlari ile yasam alanlariniza derinlik ve sonsuz zerafet katan modern triptik (uc parcali) cam tablo tasarimi.',
    fit: BoxFit.contain,
  ),
  const ProductItem(
    id: 'c7',
    title: 'MAVI GULLU VE KELEBEKLI TRIPTIK TABLO',
    category: 'Tablolar',
    styleTags: ['Aynali Cerceve', 'Mavi Gul', 'Luks', 'Kelebek', 'Gold Detay', 'Modern'],
    imageUrl: 'assets/images/kelebek_guller_tablo_1.png',
    imageUrls: [
      'assets/images/kelebek_guller_tablo_1.png',
      'assets/images/kelebek_guller_tablo_2.png',
      'assets/images/kelebek_guller_tablo_3.png',
    ],
    description: 'Zarif ayna cerceve tasarimiyla zenginlesen, goz alici mavi gul detaylari ve altin konturlu kelebek kabartmalariyla yasam alanlariniza modern ve estetik bir derinlik katan premium triptik (uc parcali) cam tablo seti.',
    fit: BoxFit.contain,
  ),
  const ProductItem(
    id: 'c8',
    title: 'RENKLI TUY VE KRISTAL KURE TRIPTIK TABLO',
    category: 'Tablolar',
    styleTags: ['Aynali Cerceve', 'Luks', 'Renkli', 'Kristal', 'Modern'],
    imageUrl: 'assets/images/tuy_kristal_tablo_1.png',
    imageUrls: [
      'assets/images/tuy_kristal_tablo_1.png',
      'assets/images/tuy_kristal_tablo_2.png',
      'assets/images/tuy_kristal_tablo_3.png',
    ],
    description: 'Canli renk gecislerine sahip dekoratif tuy motifleri ve merkezde yer alan altin kristal kure formuyla goz alici bir kontrast sunan, premium ayna cerceveli uc parcali cam tablo seti.',
    fit: BoxFit.contain,
  ),

  // --- DRESUARLAR ---
  const ProductItem(
    id: 'd1',
    title: 'LUKS CAM DRESUAR',
    category: 'Dresuarlar',
    styleTags: ['Luxury', 'Modern'],
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD33_TJUZ2dFUZFiMuWof32yMnpt6S0AIvcvZlB8qkSLi02ApSz00_6ZRfUYedp3_5Oc7CTgp4ACu1uCYl1Sx2cFXIjaRGCQvZesSAsBdOT6aV6gvnr0WW7UMzIcfAxXcr46sG8lvrUDSPgtMTrYrSFjaohhQAO574tmUaEpZGTq710BsPhitfgtCEexFqYvwfJvRjx3usLVlELFc_B1XXOKvUEPj66JHF5cQ9ro26W45Srceu9YE2uj71n8lz50_Z4VhExPEkL54c',
    imageUrls: [
      'https://lh3.googleusercontent.com/aida-public/AB6AXuD33_TJUZ2dFUZFiMuWof32yMnpt6S0AIvcvZlB8qkSLi02ApSz00_6ZRfUYedp3_5Oc7CTgp4ACu1uCYl1Sx2cFXIjaRGCQvZesSAsBdOT6aV6gvnr0WW7UMzIcfAxXcr46sG8lvrUDSPgtMTrYrSFjaohhQAO574tmUaEpZGTq710BsPhitfgtCEexFqYvwfJvRjx3usLVlELFc_B1XXOKvUEPj66JHF5cQ9ro26W45Srceu9YE2uj71n8lz50_Z4VhExPEkL54c',
      'https://images.unsplash.com/photo-1581428982868-e410dd047a90?q=80&w=800',
      'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?q=80&w=800',
      'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?q=80&w=800',
    ],
  ),
  const ProductItem(
    id: 'd2',
    title: 'GOLD AYAKLI CAM DRESUAR',
    category: 'Dresuarlar',
    styleTags: ['Gold Details', 'Luxury'],
    imageUrl: 'https://picsum.photos/seed/dresuar2/600/800',
    imageUrls: [
      'https://picsum.photos/seed/dresuar2/600/800',
      'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?q=80&w=800',
      'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?q=80&w=800',
      'https://images.unsplash.com/photo-1581428982868-e410dd047a90?q=80&w=800',
    ],
  ),
  const ProductItem(
    id: 'd3',
    title: 'SIYAH PROFIL DRESUAR',
    category: 'Dresuarlar',
    styleTags: ['Black Frame', 'Minimal'],
    imageUrl: 'https://picsum.photos/seed/dresuar3/600/800',
    imageUrls: [
      'https://picsum.photos/seed/dresuar3/600/800',
      'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?q=80&w=800',
      'https://images.unsplash.com/photo-1581428982868-e410dd047a90?q=80&w=800',
      'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?q=80&w=800',
    ],
  ),

  // --- SAATLER ---
  const ProductItem(
    id: 's1',
    title: 'AYNALI MODERN DUVAR SAATI',
    category: 'Saatler',
    styleTags: ['Minimal', 'Modern'],
    imageUrl: 'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?q=80&w=800',
    imageUrls: [
      'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?q=80&w=800',
      'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?q=80&w=800',
      'https://images.unsplash.com/photo-1581428982868-e410dd047a90?q=80&w=800',
      'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?q=80&w=800',
    ],
    description: 'Yansitici ayna yuzeyi ve son derece şık minimalist metal akrep-yelkovani ile zamani estetikle bulusturan premium duvar saati.',
  ),
  const ProductItem(
    id: 's2',
    title: 'ALTIN RAKAMLI YUVARLAK SAAT',
    category: 'Saatler',
    styleTags: ['Luxury', 'Classic'],
    imageUrl: 'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?q=80&w=800',
    imageUrls: [
      'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?q=80&w=800',
      'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?q=80&w=800',
      'https://images.unsplash.com/photo-1581428982868-e410dd047a90?q=80&w=800',
      'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?q=80&w=800',
    ],
    description: 'Gold detaylari ve el isciligi eskitme ayna kaplamasiyla klasik ve modern mekanlara luks bir hava katan duvar saati.',
  ),

  // --- SEHPALAR ---
  const ProductItem(
    id: 'se1',
    title: 'GOLD DETAYLI ZARIF ORTA SEHPA',
    category: 'Sehpalar',
    styleTags: ['Luxury', 'Modern'],
    imageUrl: 'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?q=80&w=800',
    imageUrls: [
      'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?q=80&w=800',
      'https://images.unsplash.com/photo-1581428982868-e410dd047a90?q=80&w=800',
      'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?q=80&w=800',
      'https://images.unsplash.com/photo-1581428982868-e410dd047a90?q=80&w=800',
    ],
    description: 'Isigin kirilma acilarini maksimize eden pirinc gold detayli modern cam orta sehpa ile oturma odanizda luks bir odak noktasi.',
  ),
  const ProductItem(
    id: 'se2',
    title: 'MINIMALIST CAM YAN SEHPA',
    category: 'Sehpalar',
    styleTags: ['Minimal', 'Modern'],
    imageUrl: 'https://images.unsplash.com/photo-1581428982868-e410dd047a90?q=80&w=800',
    imageUrls: [
      'https://images.unsplash.com/photo-1581428982868-e410dd047a90?q=80&w=800',
      'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?q=80&w=800',
      'https://images.unsplash.com/photo-1581428982868-e410dd047a90?q=80&w=800',
      'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?q=80&w=800',
    ],
    description: 'Yalın cizgileri ve ultra berrak temperli cam tablası ile hem sehpa hem de sanatsal bir dekoratif stand olarak kullanilabilen minimalist yan sehpa.',
  ),
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
    
    // Extract unique styles dynamically for all categories
    Set<String> allStyles = {'Tum'};
    for (var item in filteredItems) {
      allStyles.addAll(item.styleTags);
    }

    if (_selectedStyle != 'Tum') {
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
              
              const SizedBox(height: 64),
              
              // Style Based Discovery System - Completely dynamic for all categories
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
                                color: _selectedStyle == style
                                    ? AppColors.accent
                                    : Colors.transparent,
                                width: 1,
                              )
                            )
                          ),
                          child: Text(
                            style,
                            style: AppTextStyles.labelCaps.copyWith(
                              color: _selectedStyle == style
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

class _ProductNavArrow extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _ProductNavArrow({required this.icon, required this.onTap});

  @override
  State<_ProductNavArrow> createState() => _ProductNavArrowState();
}

class _ProductNavArrowState extends State<_ProductNavArrow> {
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
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: _isHovered 
                ? AppColors.accent.withValues(alpha: 0.9) 
                : Colors.black.withValues(alpha: 0.5),
            shape: BoxShape.circle,
            border: Border.all(
              color: _isHovered ? AppColors.accent : AppColors.outline,
              width: 1,
            ),
            boxShadow: _isHovered 
                ? [
                    BoxShadow(
                      color: AppColors.accent.withValues(alpha: 0.3),
                      blurRadius: 12,
                      spreadRadius: 2,
                    )
                  ]
                : [],
          ),
          child: Icon(
            widget.icon,
            color: _isHovered ? Colors.black : AppColors.textPrimary,
            size: 28,
          ),
        ),
      ),
    );
  }
}

class ProductDetailContent extends StatefulWidget {
  final String productId;
  const ProductDetailContent({super.key, required this.productId});

  @override
  State<ProductDetailContent> createState() => _ProductDetailContentState();
}

class _ProductDetailContentState extends State<ProductDetailContent> {
  int _activeImageIndex = 0;
  bool _isHovering = false;
  Offset _hoverPos = Offset.zero;
  Timer? _hoverTimer;

  @override
  void initState() {
    super.initState();
    _initActiveImage();
  }

  @override
  void didUpdateWidget(covariant ProductDetailContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.productId != widget.productId) {
      _initActiveImage();
    }
  }

  @override
  void dispose() {
    _hoverTimer?.cancel();
    super.dispose();
  }

  void _initActiveImage() {
    final product = allProducts.firstWhere((p) => p.id == widget.productId, orElse: () => allProducts.first);
    final displayImages = product.imageUrls.take(3).toList();
    if (displayImages.isEmpty) {
      displayImages.add(product.imageUrl);
    }
    final index = displayImages.indexOf(product.imageUrl);
    setState(() {
      _activeImageIndex = index != -1 ? index : 0;
    });
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
    final product = allProducts.firstWhere((p) => p.id == widget.productId, orElse: () => allProducts.first);

    // Get up to 3 images from product.imageUrls
    final displayImages = product.imageUrls.take(3).toList();
    if (displayImages.isEmpty) {
      displayImages.add(product.imageUrl);
    }

    final int activeIndex = _activeImageIndex.clamp(0, displayImages.length - 1);
    final String activeImageUrl = displayImages[activeIndex];

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
              LayoutBuilder(
                builder: (context, constraints) {
                  final double totalWidth = constraints.maxWidth;
                  final double containerWidth = isMobile ? totalWidth : (totalWidth - 80) * 6 / 11;
                  
                  const double arrowWidth = 54.0;
                  const double arrowSpacing = 16.0;
                  final double totalArrowsSpace = (!isMobile && displayImages.length > 1) ? (arrowWidth + arrowSpacing) * 2 : 0.0;
                  final double imageContainerWidth = containerWidth - totalArrowsSpace;
                  
                  final double containerHeight = isMobile ? 360 : 540;
                  const double lensSize = 150.0;
                  const double zoomBoxSize = 450.0;
                  const double scale = zoomBoxSize / lensSize;

                  double maxLeft = (imageContainerWidth - lensSize).clamp(0.0, double.infinity);
                  double maxTop = (containerHeight - lensSize).clamp(0.0, double.infinity);
                  double lensLeft = (_hoverPos.dx - lensSize / 2).clamp(0.0, maxLeft);
                  double lensTop = (_hoverPos.dy - lensSize / 2).clamp(0.0, maxTop);

                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
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
                                isMobile
                                    ? Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(border: Border.all(color: AppColors.outline)),
                                            child: SizedBox(
                                              height: containerHeight,
                                              child: activeImageUrl.startsWith('http')
                                                  ? Image.network(activeImageUrl, fit: product.fit)
                                                  : Image.asset(activeImageUrl, fit: product.fit),
                                            ),
                                          ).animate().fade(delay: 200.ms),
                                          // Left Arrow Button overlaid on mobile
                                          if (displayImages.length > 1)
                                            Positioned(
                                              left: 16,
                                              child: _ProductNavArrow(
                                                icon: Icons.chevron_left,
                                                onTap: () {
                                                  _hoverTimer?.cancel();
                                                  setState(() {
                                                    _activeImageIndex = (_activeImageIndex - 1 + displayImages.length) % displayImages.length;
                                                    _isHovering = false;
                                                  });
                                                },
                                              ),
                                            ),
                                          // Right Arrow Button overlaid on mobile
                                          if (displayImages.length > 1)
                                            Positioned(
                                              right: 16,
                                              child: _ProductNavArrow(
                                                icon: Icons.chevron_right,
                                                onTap: () {
                                                  _hoverTimer?.cancel();
                                                  setState(() {
                                                    _activeImageIndex = (_activeImageIndex + 1) % displayImages.length;
                                                    _isHovering = false;
                                                  });
                                                },
                                              ),
                                            ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          // Left Arrow Button outside main image
                                          if (displayImages.length > 1) ...[
                                            _ProductNavArrow(
                                              icon: Icons.chevron_left,
                                              onTap: () {
                                                _hoverTimer?.cancel();
                                                setState(() {
                                                  _activeImageIndex = (_activeImageIndex - 1 + displayImages.length) % displayImages.length;
                                                  _isHovering = false;
                                                });
                                              },
                                            ),
                                            const SizedBox(width: 16),
                                          ],
                                          // Main Image with Hover Zoom
                                          Expanded(
                                            child: MouseRegion(
                                              key: const ValueKey('product_image_mouse_region'),
                                              onEnter: (_) {
                                                _hoverTimer?.cancel();
                                                _hoverTimer = Timer(const Duration(milliseconds: 250), () {
                                                  if (mounted) {
                                                    setState(() {
                                                      _isHovering = true;
                                                    });
                                                  }
                                                });
                                              },
                                              onExit: (_) {
                                                _hoverTimer?.cancel();
                                                if (_isHovering) {
                                                  setState(() {
                                                    _isHovering = false;
                                                  });
                                                }
                                              },
                                              onHover: (event) {
                                                if (_isHovering) {
                                                  setState(() {
                                                    _hoverPos = event.localPosition;
                                                  });
                                                } else {
                                                  _hoverPos = event.localPosition;
                                                }
                                              },
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(border: Border.all(color: AppColors.outline)),
                                                    child: SizedBox(
                                                      height: containerHeight,
                                                      child: activeImageUrl.startsWith('http')
                                                          ? Image.network(activeImageUrl, fit: product.fit)
                                                          : Image.asset(activeImageUrl, fit: product.fit),
                                                    ),
                                                  ).animate().fade(delay: 200.ms),
                                                  // Zoom Lens overlay
                                                  if (_isHovering)
                                                    Positioned(
                                                      left: lensLeft,
                                                      top: lensTop,
                                                      child: Container(
                                                        width: lensSize,
                                                        height: lensSize,
                                                        decoration: BoxDecoration(
                                                          color: Colors.black.withValues(alpha: 0.3),
                                                          border: Border.all(color: Colors.white, width: 1.0),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // Right Arrow Button outside main image
                                          if (displayImages.length > 1) ...[
                                            const SizedBox(width: 16),
                                            _ProductNavArrow(
                                              icon: Icons.chevron_right,
                                              onTap: () {
                                                _hoverTimer?.cancel();
                                                setState(() {
                                                  _activeImageIndex = (_activeImageIndex + 1) % displayImages.length;
                                                  _isHovering = false;
                                                });
                                              },
                                            ),
                                          ],
                                        ],
                                      ),
                                const SizedBox(height: 24),
                                // 3 Proportional Square thumbnails below the main image
                                if (displayImages.length > 1)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: displayImages.asMap().entries.map((entry) {
                                      final int index = entry.key;
                                      final String url = entry.value;
                                      final bool isActive = index == activeIndex;

                                      return Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: index == 0 ? 0 : 8,
                                            right: index == displayImages.length - 1 ? 0 : 8,
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              _hoverTimer?.cancel();
                                              setState(() {
                                                _activeImageIndex = index;
                                                _isHovering = false;
                                              });
                                            },
                                            child: AspectRatio(
                                              aspectRatio: 1.0,
                                              child: AnimatedContainer(
                                                duration: const Duration(milliseconds: 300),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: isActive ? AppColors.accent : AppColors.outline,
                                                    width: isActive ? 2.0 : 1.0,
                                                  ),
                                                  boxShadow: isActive
                                                      ? [
                                                          BoxShadow(
                                                            color: AppColors.accent.withValues(alpha: 0.2),
                                                            blurRadius: 8,
                                                            spreadRadius: 1,
                                                          )
                                                        ]
                                                      : [],
                                                ),
                                                child: Stack(
                                                  fit: StackFit.expand,
                                                  children: [
                                                    url.startsWith('http')
                                                        ? Image.network(url, fit: product.fit)
                                                        : Image.asset(url, fit: product.fit),
                                                    AnimatedOpacity(
                                                      duration: const Duration(milliseconds: 300),
                                                      opacity: isActive ? 0.0 : 0.4,
                                                      child: Container(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ).animate().fade(delay: 300.ms),
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
                      // Floating Zoom Box on desktop
                      if (!isMobile && _isHovering)
                        Positioned(
                          left: containerWidth + 40, // 40px right of main image container
                          top: 48, // Align perfectly with the top edge of the main image MouseRegion
                          child: RepaintBoundary(
                            child: Container(
                              width: zoomBoxSize,
                              height: zoomBoxSize,
                              decoration: BoxDecoration(
                                color: AppColors.background, // Match solid dark luxury background
                                border: Border.all(color: AppColors.outline),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.8),
                                    blurRadius: 32,
                                    spreadRadius: 8,
                                  ),
                                ],
                              ),
                              child: ClipRect(
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: -lensLeft * scale,
                                      top: -lensTop * scale,
                                      width: imageContainerWidth * scale,
                                      height: containerHeight * scale,
                                      child: activeImageUrl.startsWith('http')
                                          ? Image.network(activeImageUrl, fit: product.fit)
                                          : Image.asset(activeImageUrl, fit: product.fit),
                                    ),
                                  ],
                                ),
                              ),
                            ).animate().fade(duration: 150.ms),
                          ),
                        ),
                    ],
                  );
                },
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
                      child: Image.network('https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?q=80&w=800', fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: isMobile ? 0 : 24, height: isMobile ? 24 : 0),
                  Expanded(
                    flex: isMobile ? 0 : 2,
                    child: Container(
                      height: isMobile ? 220 : 300,
                      decoration: BoxDecoration(border: Border.all(color: AppColors.outline)),
                      child: Image.network('https://images.unsplash.com/photo-1581428982868-e410dd047a90?q=80&w=800', fit: BoxFit.cover),
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



