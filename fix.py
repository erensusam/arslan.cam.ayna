import os

file_path = 'lib/main.dart'
with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# I will recreate the CollectionsSection correctly and the CollectionCard class
correct_code = """             ),
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
                  onTap: () => context.go('/katalog/aynalar'),
                  child: const CollectionCard(
                    title: 'AYNALAR',
                    subtitle: 'KLASİK VE MODERN TASARIMLAR',
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDaESMoJz85E10Mp-6S6sU--AAkA3j6naA9PJ2pobT-o9KuPGkfUxUDGAHtfnB5M68TaIW1NuuWsUrnNTi38vZYAssOa-KBLYmQOZSLsYJqC4A02CghHl3axme375PHVYPjzMgtQnKUWn8gTaHwVudSryNBIz2XvlTudaEB9gzgon21v7Ecn7ITIunxfxwrqTFLnOU6vF4K1MS8wjbz2gOJwdRQOVwq4RbzbMpw-f3AnmscK5V6U5IY3By2a7WBPDppf9FzbL6Njps',
                  ),
                ),
              ).animate().fade(delay: 400.ms).slideY(begin: 0.1),
              SizedBox(width: isMobile ? 0 : 48, height: isMobile ? 64 : 0),
              Flexible(
                flex: isMobile ? 0 : 1,
                fit: isMobile ? FlexFit.loose : FlexFit.tight,
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
              Flexible(
                flex: isMobile ? 0 : 1,
                fit: isMobile ? FlexFit.loose : FlexFit.tight,
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
                child: Image.network(widget.imageUrl, fit: BoxFit.cover),
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
                    child: imageWidget,
                  ),
                )
              else
                SizedBox(
                  width: double.infinity,
                  height: 280.0,
                  child: imageWidget,
                ),
              const SizedBox(height: 20),
              Text(
                widget.title,"""

broken_str = """                maxLines: 2,
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
}"""

content = content.replace(broken_str, correct_code + "\n" + broken_str)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Fixed!")
