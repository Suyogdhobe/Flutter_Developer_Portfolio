import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/scroll_controller.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class Navbar extends StatefulWidget {
  final ScrollControllerProvider scroll;

  const Navbar({super.key, required this.scroll});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  String active = "Home";

  void setActive(String value) {
    setState(() => active = value);
  }

  Widget navItem(String title, GlobalKey key) {
    final isActive = active == title;
    final isDark = context.watch<ThemeProvider>().isDark;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TextButton(
        onPressed: () {
          setActive(title);
          widget.scroll.scrollTo(key);
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        child: Text(
          title,
          style: GoogleFonts.inter(
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            fontSize: 15,
            color: isActive
                ? const Color(0xFF4F46E5)
                : (isDark ? Colors.grey.shade300 : Colors.grey.shade700),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().isDark;

    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.grey.shade900.withOpacity(0.95)
            : Colors.white.withOpacity(0.95),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Text(
            "Suyog.",
            style: GoogleFonts.inter(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),

          // Navigation Items
          Row(
            children: [
              navItem("About", widget.scroll.aboutKey),
              navItem("Skills", widget.scroll.skillsKey),
              navItem("Experience", widget.scroll.experienceKey),
              navItem("Projects", widget.scroll.projectsKey),
              navItem("Contact", widget.scroll.contactKey),

              const SizedBox(width: 12),

              // Theme toggle
              IconButton(
                tooltip: "Toggle theme",
                icon: Icon(
                  isDark ? Icons.light_mode : Icons.dark_mode,
                  color: isDark ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  context.read<ThemeProvider>().toggleTheme();
                },
              ),
              const SizedBox(width: 8),

              // Hire Me button
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4F46E5), Color(0xFF06B6D4)],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    setActive("Contact");
                    widget.scroll.scrollTo(widget.scroll.contactKey);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Hire Me',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
