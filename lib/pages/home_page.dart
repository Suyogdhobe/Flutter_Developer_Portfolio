import 'package:flutter/material.dart';
import 'package:suyogportfolio/controllers/scroll_controller.dart';
import 'package:suyogportfolio/sections/experience_section.dart';
import '../sections/hero_section.dart';
import '../sections/about_section.dart';
import '../sections/projects_section.dart';
import '../sections/skills_section.dart';
import '../sections/contact_section.dart';
import '../widgets/navbar.dart';

final scrollProvider = ScrollControllerProvider();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollProvider.controller,
            child: Column(
              children: [
                HeroSection(key: scrollProvider.heroKey),
                AboutSection(key: scrollProvider.aboutKey),
                ExperienceSection(key: scrollProvider.experienceKey),
                ProjectsSection(key: scrollProvider.projectsKey),
                SkillsSection(key: scrollProvider.skillsKey),
                ContactSection(key: scrollProvider.contactKey),
              ],
            ),
          ),
          Navbar(scroll: scrollProvider),
        ],
      ),
    );
  }
}
