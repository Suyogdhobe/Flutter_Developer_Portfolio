import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/gradient_text.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  Widget _buildSkillCard(String name, IconData icon, Color iconColor) {
    return _SkillCard(
      name: name,
      icon: icon,
      iconColor: iconColor,
    );
  }

  Widget _buildCategorySection(
      String title, List<String> items, Color dotColor) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
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
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: items.map((item) => _buildTag(item)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 13,
          color: Colors.grey.shade700,
        ),
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
            'MY EXPERTISE',
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
                'Skills & ',
                style: GoogleFonts.inter(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GradientText(
                text: 'Technologies',
                style: GoogleFonts.inter(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),

          // Top row skill cards
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildSkillCard(
                  'Flutter', Icons.phone_android, const Color(0xFF4F46E5)),
              _buildSkillCard('Dart', Icons.layers, const Color(0xFF06B6D4)),
              _buildSkillCard('Firebase', Icons.local_fire_department,
                  const Color(0xFFF59E0B)),
              _buildSkillCard(
                  'REST APIs', Icons.language, const Color(0xFF10B981)),
              _buildSkillCard(
                  'State Mgmt', Icons.settings, const Color(0xFF8B5CF6)),
              _buildSkillCard(
                  'Deployment', Icons.rocket_launch, const Color(0xFFEC4899)),
            ],
          ),
          const SizedBox(height: 40),

          // Category sections
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                SizedBox(
                  width: 280,
                  child: _buildCategorySection(
                    'State Management',
                    ['Provider', 'GetX', 'Riverpod', 'BLoC'],
                    const Color(0xFF8B5CF6),
                  ),
                ),
                SizedBox(
                  width: 280,
                  child: _buildCategorySection(
                    'Firebase',
                    ['Auth', 'Firestore', 'FCM', 'Storage'],
                    const Color(0xFFF59E0B),
                  ),
                ),
                SizedBox(
                  width: 280,
                  child: _buildCategorySection(
                    'Tools',
                    ['Git', 'GitHub', 'Postman', 'VS Code'],
                    const Color(0xFF06B6D4),
                  ),
                ),
                SizedBox(
                  width: 280,
                  child: _buildCategorySection(
                    'Platforms',
                    ['Android Studio', 'Xcode', 'Play Store', 'App Store'],
                    const Color(0xFF10B981),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          // Bottom tags
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              _buildTag('Google Maps'),
              _buildTag('Razorpay'),
              _buildTag('SharedPreferences'),
              _buildTag('Clean Architecture'),
              _buildTag('MVC'),
              _buildTag('MVVM'),
            ],
          ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final String name;
  final IconData icon;
  final Color iconColor;

  const _SkillCard({
    required this.name,
    required this.icon,
    required this.iconColor,
  });

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _elevationAnimation = Tween<double>(begin: 2.0, end: 8.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: 160,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isHovered
                      ? widget.iconColor.withOpacity(0.3)
                      : Colors.grey.shade200,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isHovered
                        ? widget.iconColor.withOpacity(0.2)
                        : Colors.black.withOpacity(0.05),
                    blurRadius: _elevationAnimation.value * 2,
                    offset: Offset(0, _elevationAnimation.value),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isHovered
                          ? widget.iconColor.withOpacity(0.1)
                          : Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      widget.icon,
                      size: 36,
                      color: widget.iconColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.name,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
