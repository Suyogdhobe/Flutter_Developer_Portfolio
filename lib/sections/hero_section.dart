import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/gradient_text.dart';
import '../widgets/gradient_button.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  bool animate = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100),
        () => setState(() => animate = true));
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Widget _buildSocialButton(IconData icon, String url, Color color) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchUrl(url),
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Icon(icon, size: 20, color: color),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    final secondaryTextColor =
        isDark ? Colors.grey.shade400 : Colors.grey.shade700;

    return Container(
      constraints: BoxConstraints(minHeight: size.height - 70),
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      child: AnimatedOpacity(
        opacity: animate ? 1 : 0,
        duration: const Duration(milliseconds: 700),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Available badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFECFDF5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFF10B981),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Available for opportunities',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: const Color(0xFF10B981),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Main heading with gradient name
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Hi, I'm ",
                    style: GoogleFonts.inter(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                      height: 1.2,
                    ),
                  ),
                  GradientText(
                    text: 'Suyog Dhobe',
                    style: GoogleFonts.inter(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4F46E5), Color(0xFF06B6D4)],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Subtitle
              Text(
                'Mobile App Developer',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  color: secondaryTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),

              // Description
              Container(
                constraints: const BoxConstraints(maxWidth: 700),
                child: Text(
                  '3.5+ years crafting Flutter, Android & iOS apps. Building beautiful,\nhigh-performance mobile experiences.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: secondaryTextColor,
                    height: 1.6,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // CTA Buttons
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  GradientButton(
                    text: 'View My Work',
                    onPressed: () {
                      // Scroll to projects section
                      // You can implement scroll logic here
                    },
                    type: GradientButtonType.filled,
                  ),
                  GradientButton(
                    text: 'Get In Touch',
                    onPressed: () {
                      // Scroll to contact section
                      // You can implement scroll logic here
                    },
                    type: GradientButtonType.outlined,
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Social Media Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(
                    FontAwesomeIcons.github,
                    'https://github.com/yourusername', // Update with your URL
                    Colors.black87,
                  ),
                  const SizedBox(width: 12),
                  _buildSocialButton(
                    FontAwesomeIcons.linkedin,
                    'https://linkedin.com/in/yourusername', // Update with your URL
                    const Color(0xFF0A66C2),
                  ),
                  const SizedBox(width: 12),
                  _buildSocialButton(
                    Icons.email,
                    'mailto:your.email@example.com', // Update with your email
                    const Color(0xFFEA4335),
                  ),
                ],
              ),
              const SizedBox(height: 60),

              // Scroll indicator
              AnimatedOpacity(
                opacity: animate ? 0.5 : 0,
                duration: const Duration(milliseconds: 1000),
                child: const Column(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 32,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
