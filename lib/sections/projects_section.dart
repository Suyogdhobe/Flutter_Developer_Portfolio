import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/gradient_text.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  Widget _buildProjectCard({
    required String title,
    required String description,
    required List<String> tags,
    required IconData icon,
    required Color topBorderColor,
    required String codeUrl,
    required String demoUrl,
  }) {
    return _ProjectCard(
      title: title,
      description: description,
      tags: tags,
      icon: icon,
      topBorderColor: topBorderColor,
      codeUrl: codeUrl,
      demoUrl: demoUrl,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Column(
        children: [
          // Header
          Text(
            'PORTFOLIO',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF4F46E5),
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Featured ',
                style: GoogleFonts.inter(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GradientText(
                text: 'Projects',
                style: GoogleFonts.inter(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),

          // Projects Grid
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: [
                _buildProjectCard(
                  title: 'Hare Krishna Community App',
                  description:
                      'Spiritual community app with real-time chat, E) messaging, group chats, live video streaming, social feed, and payment gateway.',
                  tags: ['Flutter', 'Firebase', 'Video Streaming', 'Payments'],
                  icon: Icons.chat_bubble_outline,
                  topBorderColor: const Color(0xFFF59E0B),
                  codeUrl: 'https://github.com/yourusername',
                  demoUrl: 'https://demo.com',
                ),
                _buildProjectCard(
                  title: 'Allsatin Ice',
                  description:
                      'Multi-module delivery app with Order Vendor, and Driver modules. Real-time inventory tracking and geolocation delivery.',
                  tags: ['Flutter', 'Firebase', 'Google Maps', 'Delivery'],
                  icon: Icons.shopping_cart_outlined,
                  topBorderColor: const Color(0xFF06B6D4),
                  codeUrl: 'https://github.com/yourusername',
                  demoUrl: 'https://demo.com',
                ),
                _buildProjectCard(
                  title: 'School Management App',
                  description:
                      'Comprehensive school app with Attendance, Homework, Timetable, Announcements, Fees & fee App-Chat modules.',
                  tags: ['Flutter', 'Firebase Auth', 'Firestore', 'FCM'],
                  icon: Icons.school_outlined,
                  topBorderColor: const Color(0xFF10B981),
                  codeUrl: 'https://github.com/yourusername',
                  demoUrl: 'https://demo.com',
                ),
                _buildProjectCard(
                  title: 'Food Delivery Platform',
                  description:
                      'Complete food delivery ecosystem with User, Vendor, and Driver modules including order management and live tracking.',
                  tags: ['Flutter', 'REST APIs', 'Derkt', 'State Management'],
                  icon: Icons.restaurant_outlined,
                  topBorderColor: const Color(0xFFEC4899),
                  codeUrl: 'https://github.com/yourusername',
                  demoUrl: 'https://demo.com',
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),

          // Get in Touch Button
          Text(
            'GET IN TOUCH',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF4F46E5),
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> tags;
  final IconData icon;
  final Color topBorderColor;
  final String codeUrl;
  final String demoUrl;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.tags,
    required this.icon,
    required this.topBorderColor,
    required this.codeUrl,
    required this.demoUrl,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool isHovered = false;

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 560,
        transform: Matrix4.identity()..translate(0.0, isHovered ? -8.0 : 0.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: isHovered
                  ? widget.topBorderColor.withOpacity(0.15)
                  : Colors.black.withOpacity(0.05),
              blurRadius: isHovered ? 20 : 10,
              offset: Offset(0, isHovered ? 12 : 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top colored border
            Container(
              height: 4,
              decoration: BoxDecoration(
                color: widget.topBorderColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: widget.topBorderColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      widget.icon,
                      color: widget.topBorderColor,
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Title
                  Text(
                    widget.title,
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Description
                  Text(
                    widget.description,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Tags
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.tags
                        .map((tag) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Text(
                                tag,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 20),

                  // Buttons
                  Row(
                    children: [
                      // Code button
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => _launchUrl(widget.codeUrl),
                          icon: const Icon(Icons.code, size: 18),
                          label: Text(
                            'Code',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.grey.shade700,
                            side: BorderSide(color: Colors.grey.shade300),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Demo button
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                widget.topBorderColor,
                                widget.topBorderColor.withOpacity(0.7),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ElevatedButton.icon(
                            onPressed: () => _launchUrl(widget.demoUrl),
                            icon: const Icon(Icons.open_in_new, size: 18),
                            label: Text(
                              'Demo',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
