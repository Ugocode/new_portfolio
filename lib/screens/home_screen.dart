import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../sections/hero_section.dart';
import '../sections/about_section.dart';
import '../sections/skills_section.dart';
import '../sections/projects_section.dart';
import '../sections/experience_section.dart';
import '../sections/certifications_section.dart';
import '../sections/contact_section.dart';
import '../sections/footer_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  String _currentSection = 'home';

  // Section keys for scrolling
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _certificationsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Update current section based on scroll position
    final sections = [
      ('home', _homeKey),
      ('about', _aboutKey),
      ('skills', _skillsKey),
      ('projects', _projectsKey),
      ('experience', _experienceKey),
      ('certifications', _certificationsKey),
      ('contact', _contactKey),
    ];

    for (var i = sections.length - 1; i >= 0; i--) {
      final key = sections[i].$2;
      if (key.currentContext != null) {
        final box = key.currentContext!.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero);
        if (position.dy <= 150) {
          if (_currentSection != sections[i].$1) {
            setState(() => _currentSection = sections[i].$1);
          }
          break;
        }
      }
    }
  }

  void _scrollToSection(String sectionId) {
    GlobalKey? targetKey;

    switch (sectionId) {
      case 'home':
        targetKey = _homeKey;
        break;
      case 'about':
        targetKey = _aboutKey;
        break;
      case 'skills':
        targetKey = _skillsKey;
        break;
      case 'projects':
        targetKey = _projectsKey;
        break;
      case 'experience':
        targetKey = _experienceKey;
        break;
      case 'certifications':
        targetKey = _certificationsKey;
        break;
      case 'contact':
        targetKey = _contactKey;
        break;
    }

    if (targetKey?.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey!.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      body: Stack(
        children: [
          // Main content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Hero Section
                Container(
                  key: _homeKey,
                  child: HeroSection(
                    onViewWorkPressed: () => _scrollToSection('projects'),
                    onContactPressed: () => _scrollToSection('contact'),
                  ),
                ),

                // About Section
                Container(
                  key: _aboutKey,
                  child: const AboutSection(),
                ),

                // Skills Section
                Container(
                  key: _skillsKey,
                  child: const SkillsSection(),
                ),

                // Projects Section
                Container(
                  key: _projectsKey,
                  child: const ProjectsSection(),
                ),

                // Experience Section
                Container(
                  key: _experienceKey,
                  child: const ExperienceSection(),
                ),

                // Certifications Section
                Container(
                  key: _certificationsKey,
                  child: const CertificationsSection(),
                ),

                // Contact Section
                Container(
                  key: _contactKey,
                  child: const ContactSection(),
                ),

                // Footer
                const FooterSection(),
              ],
            ),
          ),

          // Fixed Navbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(
              onNavItemTap: _scrollToSection,
              currentSection: _currentSection,
            ),
          ),
        ],
      ),
    );
  }
}
