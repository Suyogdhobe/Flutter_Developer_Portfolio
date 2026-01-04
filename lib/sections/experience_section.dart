import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/gradient_text.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  Widget _buildExperienceCard({
    required String role,
    required String company,
    required String location,
    required String duration,
    required List<String> responsibilities,
    required Color indicatorColor,
  }) {
    return _ExperienceCard(
      role: role,
      company: company,
      location: location,
      duration: duration,
      responsibilities: responsibilities,
      indicatorColor: indicatorColor,
    );
  }

  Widget _buildCredentialCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required List<String> items,
    required Color iconColor,
  }) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(height: 8),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  item,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
              )),
        ],
      ),
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
            'CAREER JOURNEY',
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
                'Work ',
                style: GoogleFonts.inter(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GradientText(
                text: 'Experience',
                style: GoogleFonts.inter(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),

          // Experience timeline
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              children: [
                _buildExperienceCard(
                  role: 'Senior Flutter Developer & Team Lead',
                  company: 'Development Team Lead (US Client)',
                  location: 'Remote',
                  duration: 'Apr 2023 - Present',
                  responsibilities: [
                    'Leading a team of 3-4 Flutter developers with code review & mentoring.',
                    'Designing scalable applications with clean Arch & best practices.',
                    'Produced 10 Flutter, REST APIs, & Firebase apps for iOS.',
                    'Expertise with cloud performance 35+ cells.',
                  ],
                  indicatorColor: const Color(0xFF4F46E5),
                ),
                const SizedBox(height: 24),
                _buildExperienceCard(
                  role: 'Senior Flutter Developer',
                  company: 'TechWave Solutions',
                  location: 'Hyderabad',
                  duration: 'Aug 2022 - Mar 2023',
                  responsibilities: [
                    'Migrated 5-6 Android and IOS apps, worked on both the SDKS.',
                    'Integrated Firebase Auth, Firestore, Timestamp, ThirdR, File, & Chat.',
                    'Integrated Firebase cloud, Firestore, FCM.',
                    'Enhanced performance, dynamics, and flows for iOS.',
                  ],
                  indicatorColor: const Color(0xFF06B6D4),
                ),
                const SizedBox(height: 24),
                _buildExperienceCard(
                  role: 'Flutter Developer',
                  company: 'Teamlead LLC & Former Wheazen Pvt. Ltd.',
                  location: 'Hyderabad',
                  duration: 'May 2021 - July 2022',
                  responsibilities: [
                    'Delivered 8 apps covering trading, app using Flutter & Dart.',
                    'Utilized Firebase for cloud-backend, push tests / chat functionality.',
                    'Contributed in Flutter-Architect, push tests with build notifications.',
                    'Identified & Dart templates with Dart & build architecture.',
                  ],
                  indicatorColor: const Color(0xFFF59E0B),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),

          // Education & Certification
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _buildCredentialCard(
                icon: Icons.school,
                title: 'Education',
                subtitle: 'B.Sc in Computer science',
                items: [
                  'RGUKT, Nizgar',
                  '2018 - 2021',
                ],
                iconColor: const Color(0xFF4F46E5),
              ),
              _buildCredentialCard(
                icon: Icons.verified,
                title: 'Certification',
                subtitle: 'Full-Stack Web Developer',
                items: [
                  'Udemy Teacher - Maximilian',
                  'Issued Dec - 2020',
                ],
                iconColor: const Color(0xFF10B981),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  final String role;
  final String company;
  final String location;
  final String duration;
  final List<String> responsibilities;
  final Color indicatorColor;

  const _ExperienceCard({
    required this.role,
    required this.company,
    required this.location,
    required this.duration,
    required this.responsibilities,
    required this.indicatorColor,
  });

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..translate(isHovered ? 8.0 : 0.0, 0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline indicator
            Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: isHovered ? widget.indicatorColor : Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: widget.indicatorColor,
                      width: 3,
                    ),
                  ),
                ),
                Container(
                  width: 2,
                  height: 100,
                  color: widget.indicatorColor.withOpacity(0.2),
                ),
              ],
            ),
            const SizedBox(width: 24),

            // Content
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isHovered
                        ? widget.indicatorColor.withOpacity(0.3)
                        : Colors.grey.shade200,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: isHovered
                          ? widget.indicatorColor.withOpacity(0.1)
                          : Colors.black.withOpacity(0.05),
                      blurRadius: isHovered ? 20 : 10,
                      offset: Offset(0, isHovered ? 8 : 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.role,
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          widget.duration,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          widget.company,
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: widget.indicatorColor,
                          ),
                        ),
                        Text(
                          ' • ${widget.location}',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ...widget.responsibilities.map((resp) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '• ',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  resp,
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color: Colors.grey.shade700,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
