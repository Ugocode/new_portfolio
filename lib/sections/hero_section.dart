import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../widgets/glass_container.dart';
import '../widgets/gradient_button.dart';
// import '../widgets/section_title.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewWorkPressed;
  final VoidCallback onContactPressed;

  const HeroSection({
    super.key,
    required this.onViewWorkPressed,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topRight,
          radius: 1.5,
          colors: [Color(0xFF1E1B4B), Color(0xFF020617)],
        ),
      ),
      child: Stack(
        children: [
          // Background gradient orbs
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF7C3AED).withValues(alpha: 0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF2563EB).withValues(alpha: 0.2),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Content
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 48,
                vertical: 120,
              ),
              child: isMobile
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildTextContent(context, isMobile),
                        const SizedBox(height: 48),
                        _buildVisual(context, isMobile),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: _buildTextContent(context, isMobile)),
                        const SizedBox(width: 48),
                        Expanded(child: _buildVisual(context, isMobile)),
                      ],
                    ),
            ),
          ),

          // Scroll indicator
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Scroll Down',
                    style: GoogleFonts.dmSans(
                      color: const Color(0xFF64748B),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Icon(
                    FontAwesomeIcons.chevronDown,
                    color: Color(0xFF64748B),
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextContent(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Greeting badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF7C3AED).withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: const Color(0xFF7C3AED).withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF7C3AED),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Available for work',
                style: GoogleFonts.dmSans(
                  color: const Color(0xFFA78BFA),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Main headline
        Text(
          PortfolioData.heroHeadline,
          style: GoogleFonts.spaceGrotesk(
            fontSize: isMobile ? 40 : 64,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.1,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 24),

        // Subheadline
        Container(
          constraints: BoxConstraints(
            maxWidth: isMobile ? double.infinity : 500,
          ),
          child: Text(
            PortfolioData.heroSubheadline,
            style: GoogleFonts.dmSans(
              fontSize: isMobile ? 16 : 18,
              color: const Color(0xFF94A3B8),
              height: 1.6,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),
        ),
        const SizedBox(height: 40),

        // CTAs
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            GradientButton(
              text: 'View My Work',
              onPressed: onViewWorkPressed,
              icon: FontAwesomeIcons.arrowRight,
            ),
            GradientButton(
              text: 'Get In Touch',
              onPressed: onContactPressed,
              isPrimary: false,
              icon: FontAwesomeIcons.envelope,
            ),
          ],
        ),
        const SizedBox(height: 48),

        // Social links
        Row(
          mainAxisAlignment: isMobile
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            _SocialIcon(
              icon: FontAwesomeIcons.github,
              url: PortfolioData.socialLinks['github']!,
            ),
            const SizedBox(width: 16),
            _SocialIcon(
              icon: FontAwesomeIcons.linkedin,
              url: PortfolioData.socialLinks['linkedin']!,
            ),
            const SizedBox(width: 16),
            _SocialIcon(
              icon: FontAwesomeIcons.twitter,
              url: PortfolioData.socialLinks['twitter']!,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVisual(BuildContext context, bool isMobile) {
    return GlassContainer(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Color(0xFFEF4444),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Color(0xFFFBBF24),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Color(0xFF22C55E),
                  shape: BoxShape.circle,
                ),
              ),
              const Spacer(),
              Text(
                'main.dart',
                style: GoogleFonts.jetBrainsMono(
                  color: const Color(0xFF64748B),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildCodeLine('class', ' ${PortfolioData.nickname}', ' {'),
          _buildCodeLine(
            '  String',
            ' role',
            ' = "${PortfolioData.jobTitle}";',
          ),
          _buildCodeLine('  List<String>', ' skills', ' = ['),
          ...PortfolioData.skills
              .take(4)
              .map(
                (skill) => _buildCodeLine('    ', '"${skill['name']}"', ','),
              ),
          _buildCodeLine('  ', ']', ';'),
          _buildCodeLine('', '}', ''),
        ],
      ),
    );
  }

  Widget _buildCodeLine(String keyword, String variable, String syntax) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.jetBrainsMono(fontSize: 14),
          children: [
            TextSpan(
              text: keyword,
              style: const TextStyle(color: Color(0xFFC084FC)),
            ),
            TextSpan(
              text: variable,
              style: const TextStyle(color: Color(0xFF60A5FA)),
            ),
            TextSpan(
              text: syntax,
              style: const TextStyle(color: Color(0xFFE2E8F0)),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String url;

  const _SocialIcon({required this.icon, required this.url});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(widget.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: _isHovered
                ? const Color(0xFF7C3AED).withValues(alpha: 0.2)
                : Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered
                  ? const Color(0xFF7C3AED).withValues(alpha: 0.5)
                  : Colors.white.withValues(alpha: 0.1),
            ),
          ),
          child: Icon(
            widget.icon,
            color: _isHovered
                ? const Color(0xFFA78BFA)
                : const Color(0xFF94A3B8),
            size: 20,
          ),
        ),
      ),
    );
  }
}
