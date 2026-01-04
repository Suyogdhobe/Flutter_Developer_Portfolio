import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/gradient_text.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  Widget _buildStatItem(
      IconData icon, String number, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 28, color: color),
        ),
        const SizedBox(height: 12),
        Text(
          number,
          style: GoogleFonts.inter(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ABOUT ME',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF4F46E5),
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Passionate about building',
          style: GoogleFonts.inter(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            height: 1.2,
          ),
        ),
        Row(
          children: [
            GradientText(
              text: 'exceptional',
              style: GoogleFonts.inter(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            Text(
              ' ',
              style: GoogleFonts.inter(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            GradientText(
              text: 'apps',
              style: GoogleFonts.inter(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
              gradient: const LinearGradient(
                colors: [Color(0xFF06B6D4), Color(0xFF10B981)],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Mobile App Developer with 3.5+ years of experience in Flutter, Android, and iOS development. Experienced in building scalable, high-performance mobile apps, integrating third-party services, leading teams, and collaborating with clients.',
          style: GoogleFonts.inter(
            fontSize: 16,
            color: Colors.grey.shade700,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Proficient in Firebase, REST APIs, iOS/Android app release processes, state management, UI/UX design, and full app deployment.',
          style: GoogleFonts.inter(
            fontSize: 16,
            color: Colors.grey.shade700,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 40),
        // Stats
        Wrap(
          spacing: 40,
          runSpacing: 24,
          children: [
            _buildStatItem(
              Icons.code,
              '3.5+',
              'Years Experience',
              const Color(0xFF4F46E5),
            ),
            _buildStatItem(
              Icons.phone_android,
              '20+',
              'Apps Built',
              const Color(0xFF06B6D4),
            ),
            _buildStatItem(
              Icons.people,
              '15+',
              'Happy Clients',
              const Color(0xFFF59E0B),
            ),
            _buildStatItem(
              Icons.trending_up,
              '30%',
              'Performance Boost',
              const Color(0xFF10B981),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCodeSnippet() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tab header
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Color(0xFFEF4444),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Color(0xFFF59E0B),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Color(0xFF10B981),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                'developer.dart',
                style: GoogleFonts.firaCode(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Code content
          RichText(
            text: TextSpan(
              style: GoogleFonts.firaCode(
                fontSize: 13,
                height: 1.5,
              ),
              children: [
                TextSpan(
                  text: 'class',
                  style: TextStyle(color: Colors.purple.shade700),
                ),
                TextSpan(
                  text: ' SuyogDhobe {\n',
                  style: TextStyle(color: Colors.grey.shade800),
                ),
                TextSpan(
                  text: '  final',
                  style: TextStyle(color: Colors.purple.shade700),
                ),
                TextSpan(
                  text: ' String role = ',
                  style: TextStyle(color: Colors.grey.shade800),
                ),
                const TextSpan(
                  text: '"Senior Flutter Dev"',
                  style: TextStyle(color: Color(0xFF10B981)),
                ),
                const TextSpan(
                  text: ';\n',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: '  final',
                  style: TextStyle(color: Colors.purple.shade700),
                ),
                TextSpan(
                  text: ' String location = ',
                  style: TextStyle(color: Colors.grey.shade800),
                ),
                const TextSpan(
                  text: '"Hyderabad, India"',
                  style: TextStyle(color: Color(0xFF10B981)),
                ),
                const TextSpan(
                  text: ';\n\n',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: '  final',
                  style: TextStyle(color: Colors.purple.shade700),
                ),
                TextSpan(
                  text: ' List skills = [\n',
                  style: TextStyle(color: Colors.grey.shade800),
                ),
                const TextSpan(
                  text: '    "Flutter"',
                  style: TextStyle(color: Color(0xFF10B981)),
                ),
                const TextSpan(
                  text: ', ',
                  style: TextStyle(color: Colors.black),
                ),
                const TextSpan(
                  text: '"Dart"',
                  style: TextStyle(color: Color(0xFF10B981)),
                ),
                const TextSpan(
                  text: ', ',
                  style: TextStyle(color: Colors.black),
                ),
                const TextSpan(
                  text: '"Firebase"',
                  style: TextStyle(color: Color(0xFF10B981)),
                ),
                const TextSpan(
                  text: ',\n',
                  style: TextStyle(color: Colors.black),
                ),
                const TextSpan(
                  text: '    "REST APIs"',
                  style: TextStyle(color: Color(0xFF10B981)),
                ),
                const TextSpan(
                  text: ', ',
                  style: TextStyle(color: Colors.black),
                ),
                const TextSpan(
                  text: '"Clean Architecture"',
                  style: TextStyle(color: Color(0xFF10B981)),
                ),
                const TextSpan(
                  text: '\n  ];\n\n',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: '  void',
                  style: TextStyle(color: Colors.purple.shade700),
                ),
                TextSpan(
                  text: ' buildAwesomeApps() {\n',
                  style: TextStyle(color: Colors.grey.shade800),
                ),
                TextSpan(
                  text: '    // 3.5+ years of experience ✨\n',
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                const TextSpan(
                  text: '  }\n',
                  style: TextStyle(color: Colors.black),
                ),
                const TextSpan(
                  text: '}',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 900;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: isSmallScreen
          ? Column(
              children: [
                _buildTextContent(),
                const SizedBox(height: 40),
                _buildCodeSnippet(),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: _buildTextContent()),
                const SizedBox(width: 40),
                Expanded(flex: 1, child: _buildCodeSnippet()),
              ],
            ),
    );
  }
}
