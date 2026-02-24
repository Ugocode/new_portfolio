// ignore: dangling_library_doc_comments
/// ============================================
/// PORTFOLIO DATA - EDIT THIS FILE TO UPDATE YOUR PORTFOLIO
/// ============================================

class PortfolioData {
  // ==========================================
  // PERSONAL INFORMATION
  // ==========================================
  static const String name = "Ugochukwu Obioha";
  static const String nickname = "Ugocode";
  static const String jobTitle = "Mobile & Web Developer";
  static const String email = "obiohaugo1@example.com"; // UPDATE THIS
  static const String phone = "+1234567890"; // UPDATE THIS
  static const String location = "Berlin, Germany"; // UPDATE THIS

  // Hero Section
  static const String heroHeadline =
      "Building Digital Experiences That Matter.";
  static const String heroSubheadline =
      "I'm $name ($nickname). A Mobile & Web Developer specializing in Flutter and Python.";

  // About Section - UPDATE THIS WITH YOUR BIO
  static const String aboutBio = '''
I'm a passionate Mobile and Web Developer with expertise in creating beautiful, functional, and user-friendly applications.

My journey in tech started with a curiosity about how things work, and it has evolved into a career focused on building digital experiences that make a difference.

I specialize in Flutter for cross-platform mobile development and Python for backend solutions. I believe in writing clean, maintainable code and creating pixel-perfect designs.

When I'm not coding, you can find me exploring new technologies, contributing to open-source projects, or sharing knowledge with the developer community.
''';

  // ==========================================
  // SOCIAL LINKS - UPDATE THESE
  // ==========================================
  static const Map<String, String> socialLinks = {
    'github': 'https://github.com/ugocode', // UPDATE THIS
    'linkedin': 'https://www.linkedin.com/in/ugochuwku-obioha/', // UPDATE THIS
    'twitter': 'https://twitter.com/ugo_starboi', // UPDATE THIS
    'instagram': 'https://instagram.com/ugocode', // UPDATE THIS
  };

  // ==========================================
  // SKILLS / TECH STACK
  // ==========================================
  static const List<Map<String, dynamic>> skills = [
    {'name': 'Flutter', 'icon': 'flutter', 'category': 'Mobile'},
    {'name': 'Dart', 'icon': 'code', 'category': 'Mobile'},
    {'name': 'Python', 'icon': 'python', 'category': 'Backend'},
    {'name': 'HTML', 'icon': 'html5', 'category': 'Web'},
    {'name': 'CSS', 'icon': 'css3', 'category': 'Web'},
    {'name': 'JavaScript', 'icon': 'js', 'category': 'Web'},
    {'name': 'Firebase', 'icon': 'fire', 'category': 'Backend'},
    {'name': 'Git', 'icon': 'git', 'category': 'Tools'},
    {'name': 'Figma', 'icon': 'figma', 'category': 'Design'},
    {'name': 'REST APIs', 'icon': 'api', 'category': 'Backend'},
  ];

  // ==========================================
  // PROJECTS - ADD/REMOVE/UPDATE AS NEEDED
  // ==========================================
  static const List<Map<String, dynamic>> projects = [
    {
      'title': 'E-Commerce Mobile App',
      'description':
          'A full-featured e-commerce application built with Flutter featuring product browsing, cart management, and secure payments.',
      'image': 'assets/images/gslm.png',
      // 'https://images.unsplash.com/photo-1563013544-824ae1b704d3?w=800',
      'tags': ['Flutter', 'Firebase', 'Stripe'],
      'github': 'https://github.com/yourusername/project1',
      'live': 'https://play.google.com/store/apps/details?id=com.example',
      'featured': true,
    },
    {
      'title': 'Task Management Dashboard',
      'description':
          'A responsive web dashboard for managing tasks and team collaboration with real-time updates.',
      'image':
          'https://images.unsplash.com/photo-1611224923853-80b023f02d71?w=800',
      'tags': ['Python', 'FastAPI', 'React'],
      'github': 'https://github.com/yourusername/project2',
      'live': 'https://your-project-demo.com',
      'featured': true,
    },
    {
      'title': 'Fitness Tracking App',
      'description':
          'A health and fitness app that tracks workouts, nutrition, and provides personalized recommendations.',
      'image':
          'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?w=800',
      'tags': ['Flutter', 'Dart', 'Health API'],
      'github': 'https://github.com/yourusername/project3',
      'live': null,
      'featured': false,
    },
    {
      'title': 'Weather Application',
      'description':
          'A beautiful weather app with animations, forecasts, and location-based weather updates.',
      'image':
          'https://images.unsplash.com/photo-1592210454359-9043f067919b?w=800',
      'tags': ['Flutter', 'OpenWeather API'],
      'github': 'https://github.com/yourusername/project4',
      'live': null,
      'featured': false,
    },
  ];

  // ==========================================
  // CERTIFICATIONS - ADD/REMOVE AS NEEDED
  // Set 'visible' to false to hide a certification
  // ==========================================
  static const List<Map<String, dynamic>> certifications = [
    {
      'title': 'Flutter Development Bootcamp',
      'issuer': 'Udemy - Angela Yu',
      'date': 'January 2024',
      'credentialUrl': 'https://udemy.com/certificate/xxxxx',
      'visible': true, // Set to false to hide
    },
    {
      'title': 'Python for Data Science',
      'issuer': 'Coursera - IBM',
      'date': 'March 2023',
      'credentialUrl': 'https://coursera.org/verify/xxxxx',
      'visible': true,
    },
    {
      'title': 'Google Mobile Web Specialist',
      'issuer': 'Google',
      'date': 'November 2023',
      'credentialUrl': 'https://google.com/credential/xxxxx',
      'visible': true,
    },
    {
      'title': 'AWS Cloud Practitioner',
      'issuer': 'Amazon Web Services',
      'date': 'August 2023',
      'credentialUrl': 'https://aws.amazon.com/verify/xxxxx',
      'visible': true,
    },
  ];

  // ==========================================
  // WORK EXPERIENCE - ADD/REMOVE AS NEEDED
  // ==========================================
  static const List<Map<String, dynamic>> experience = [
    {
      'role': 'Senior Mobile Developer',
      'company': 'Tech Company Name',
      'duration': 'Jan 2023 - Present',
      'description':
          'Leading mobile development team, architecting Flutter applications, and mentoring junior developers.',
      'technologies': ['Flutter', 'Firebase', 'CI/CD'],
    },
    {
      'role': 'Full Stack Developer',
      'company': 'Another Company',
      'duration': 'Jun 2021 - Dec 2022',
      'description':
          'Developed and maintained web applications using Python and modern frontend frameworks.',
      'technologies': ['Python', 'Django', 'React'],
    },
    {
      'role': 'Junior Developer',
      'company': 'Startup Inc.',
      'duration': 'Jan 2020 - May 2021',
      'description':
          'Started my development journey building web interfaces and learning mobile development.',
      'technologies': ['HTML', 'CSS', 'JavaScript'],
    },
  ];

  // ==========================================
  // NAVIGATION LINKS
  // ==========================================
  static const List<Map<String, String>> navLinks = [
    {'title': 'Home', 'id': 'home'},
    {'title': 'About', 'id': 'about'},
    {'title': 'Skills', 'id': 'skills'},
    {'title': 'Projects', 'id': 'projects'},
    {'title': 'Experience', 'id': 'experience'},
    {'title': 'Certifications', 'id': 'certifications'},
    {'title': 'Contact', 'id': 'contact'},
  ];
}
