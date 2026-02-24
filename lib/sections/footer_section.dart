import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_data.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final year = DateTime.now().year;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: 40,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
        ),
      ),
      child: isMobile
          ? Column(
              children: [
                _buildLogo(),
                const SizedBox(height: 24),
                _buildSocialLinks(),
                const SizedBox(height: 24),
                _buildCopyright(year),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLogo(),
                _buildSocialLinks(),
                _buildCopyright(year),
              ],
            ),
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF7C3AED), Color(0xFF2563EB)],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            FontAwesomeIcons.code,
            color: Colors.white,
            size: 14,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          PortfolioData.nickname,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLinks() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _FooterSocialIcon(
          icon: FontAwesomeIcons.github,
          url: PortfolioData.socialLinks['github']!,
        ),
        const SizedBox(width: 16),
        _FooterSocialIcon(
          icon: FontAwesomeIcons.linkedin,
          url: PortfolioData.socialLinks['linkedin']!,
        ),
        const SizedBox(width: 16),
        _FooterSocialIcon(
          icon: FontAwesomeIcons.twitter,
          url: PortfolioData.socialLinks['twitter']!,
        ),
      ],
    );
  }

  Widget _buildCopyright(int year) {
    return Text(
      '© $year ${PortfolioData.name}. All rights reserved.',
      style: GoogleFonts.dmSans(fontSize: 14, color: const Color(0xFF64748B)),
    );
  }
}

class _FooterSocialIcon extends StatefulWidget {
  final IconData icon;
  final String url;

  const _FooterSocialIcon({required this.icon, required this.url});

  @override
  State<_FooterSocialIcon> createState() => _FooterSocialIconState();
}

class _FooterSocialIconState extends State<_FooterSocialIcon> {
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
        child: Icon(
          widget.icon,
          color: _isHovered ? const Color(0xFF7C3AED) : const Color(0xFF64748B),
          size: 18,
        ),
      ),
    );
  }
}
