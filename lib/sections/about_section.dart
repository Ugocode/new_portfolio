import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../widgets/glass_container.dart';
import '../widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: 100,
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: 'About Me',
            subtitle: 'Get to know me better',
          ),
          const SizedBox(height: 60),
          isMobile
              ? Column(
                  children: [
                    _buildImageSection(),
                    const SizedBox(height: 32),
                    _buildContentSection(isMobile),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildImageSection()),
                    const SizedBox(width: 48),
                    Expanded(flex: 2, child: _buildContentSection(isMobile)),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return GlassContainer(
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF7C3AED).withValues(alpha: 0.3),
                    const Color(0xFF2563EB).withValues(alpha: 0.3),
                  ],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF7C3AED), Color(0xFF2563EB)],
                        ),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: const Center(
                        // add an image here insted of the U
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('images/ugo.jpeg'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      PortfolioData.name,
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      PortfolioData.jobTitle,
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        color: const Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSection(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello! I'm ${PortfolioData.name}",
          style: GoogleFonts.spaceGrotesk(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          PortfolioData.aboutBio,
          style: GoogleFonts.dmSans(
            fontSize: 16,
            color: const Color(0xFF94A3B8),
            height: 1.8,
          ),
        ),
        const SizedBox(height: 32),

        // Quick info
        const Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _InfoChip(
              icon: Icons.location_on_outlined,
              text: PortfolioData.location,
            ),
            _InfoChip(icon: Icons.email_outlined, text: PortfolioData.email),
          ],
        ),
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.white.withValues(alpha: .05)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFF7C3AED), size: 18),
          const SizedBox(width: 8),
          Text(
            text,
            style: GoogleFonts.dmSans(
              color: const Color(0xFF94A3B8),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
