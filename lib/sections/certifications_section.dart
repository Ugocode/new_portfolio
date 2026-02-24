import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_data.dart';
import '../widgets/glass_container.dart';
import '../widgets/section_title.dart';

class CertificationsSection extends StatelessWidget {
  const CertificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    // Filter visible certifications
    final visibleCerts = PortfolioData.certifications
        .where((cert) => cert['visible'] == true)
        .toList();

    if (visibleCerts.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: 100,
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: 'Certifications',
            subtitle: 'Professional credentials and achievements',
          ),
          const SizedBox(height: 60),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 2,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: isMobile ? 2.5 : 2.8,
            ),
            itemCount: visibleCerts.length,
            itemBuilder: (context, index) {
              final cert = visibleCerts[index];
              return _CertificationCard(
                title: cert['title'],
                issuer: cert['issuer'],
                date: cert['date'],
                credentialUrl: cert['credentialUrl'],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CertificationCard extends StatefulWidget {
  final String title;
  final String issuer;
  final String date;
  final String? credentialUrl;

  const _CertificationCard({
    required this.title,
    required this.issuer,
    required this.date,
    this.credentialUrl,
  });

  @override
  State<_CertificationCard> createState() => _CertificationCardState();
}

class _CertificationCardState extends State<_CertificationCard> {
  bool _isHovered = false;

  Future<void> _launchUrl() async {
    if (widget.credentialUrl != null) {
      final uri = Uri.parse(widget.credentialUrl!);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: _launchUrl,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()
            ..translate(0.0, _isHovered ? -5.0 : 0.0),

          child: GlassContainer(
            backgroundColor: _isHovered
                ? const Color(0xFF7C3AED).withValues(alpha: 0.15)
                : const Color(0xFF0F172A).withValues(alpha: .04),
            child: Row(
              children: [
                // Icon
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF7C3AED), Color(0xFF2563EB)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    FontAwesomeIcons.certificate,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 20),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.issuer,
                        style: GoogleFonts.dmSans(
                          fontSize: 14,
                          color: const Color(0xFF7C3AED),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.date,
                        style: GoogleFonts.dmSans(
                          fontSize: 12,
                          color: const Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),

                // Link icon
                if (widget.credentialUrl != null)
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _isHovered ? 1.0 : 0.5,
                    child: const Icon(
                      FontAwesomeIcons.arrowUpRightFromSquare,
                      color: Color(0xFF7C3AED),
                      size: 16,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
