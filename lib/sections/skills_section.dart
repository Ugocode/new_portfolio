import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../widgets/glass_container.dart';
import '../widgets/section_title.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  IconData _getSkillIcon(String iconName) {
    switch (iconName.toLowerCase()) {
      case 'flutter':
        return FontAwesomeIcons.flutter;
      case 'code':
        return FontAwesomeIcons.code;
      case 'python':
        return FontAwesomeIcons.python;
      case 'html5':
        return FontAwesomeIcons.html5;
      case 'css3':
        return FontAwesomeIcons.css3;
      case 'js':
        return FontAwesomeIcons.js;
      case 'fire':
        return FontAwesomeIcons.fire;
      case 'git':
        return FontAwesomeIcons.git;
      case 'figma':
        return FontAwesomeIcons.figma;
      case 'api':
        return FontAwesomeIcons.plug;
      default:
        return FontAwesomeIcons.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final crossAxisCount = isMobile ? 2 : (screenWidth < 1024 ? 3 : 5);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: 100,
      ),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1,
          colors: [
            const Color(0xFF1E1B4B).withValues(alpha: 0.3),
            Colors.transparent,
          ],
        ),
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: 'Skills & Technologies',
            subtitle: 'Tools and technologies I work with',
          ),
          const SizedBox(height: 60),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: PortfolioData.skills.length,
            itemBuilder: (context, index) {
              final skill = PortfolioData.skills[index];
              return _SkillCard(
                name: skill['name'],
                icon: _getSkillIcon(skill['icon']),
                category: skill['category'],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final String name;
  final IconData icon;
  final String category;

  const _SkillCard({
    required this.name,
    required this.icon,
    required this.category,
  });

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -5.0 : 0.0),
        child: GlassContainer(
          padding: const EdgeInsets.all(20),
          backgroundColor: _isHovered
              ? const Color(0xFF7C3AED).withValues(alpha: 0.15)
              : const Color(0xFF0F172A).withValues(alpha: 0.4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: _isHovered
                      ? const LinearGradient(
                          colors: [Color(0xFF7C3AED), Color(0xFF2563EB)],
                        )
                      : null,
                  color: _isHovered
                      ? null
                      : Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  widget.icon,
                  color: _isHovered ? Colors.white : const Color(0xFF7C3AED),
                  size: 28,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.name,
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                widget.category,
                style: GoogleFonts.dmSans(
                  fontSize: 12,
                  color: const Color(0xFF64748B),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
