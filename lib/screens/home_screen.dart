import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/wolfpack_app_bar.dart';
import '../widgets/bento_card.dart';
import '../widgets/section_heading.dart';
import '../widgets/schedule_card.dart';
import '../widgets/wolfpack_footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050505),
      extendBodyBehindAppBar: true,
      appBar: WolfpackAppBar(
        showScheduleButton: true,
        onScheduleTap: () => context.push('/schedule'),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _HeroSection(),
            _WhoWeAreSection(),
            _ScheduleSection(),
            const WolfpackFooter(),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Hero Section
// ─────────────────────────────────────────────
class _HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/images/ss.jpeg',
            fit: BoxFit.cover,
          ),
          // Gradient overlay
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x66050505),
                  Color(0xFF050505),
                ],
              ),
            ),
          ),
          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Headline
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GoogleFonts.outfit(
                        fontSize: _heroFontSize(context),
                        fontWeight: FontWeight.w900,
                        height: 1.0,
                        letterSpacing: -2,
                        color: Colors.white,
                      ),
                      children: const [
                        TextSpan(text: 'KERALA\n'),
                        TextSpan(
                          text: 'WOLFPACK',
                          style: TextStyle(color: Color(0xFFFBBF24)),
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 900.ms, curve: Curves.easeOut)
                      .moveY(begin: 40, end: 0, duration: 900.ms, curve: Curves.easeOut),
                  const SizedBox(height: 20),
                  // Tagline
                  Text(
                    'RISE TOGETHER AS ONE PACK',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.outfit(
                      fontSize: _taglineFontSize(context),
                      color: const Color(0xFF94A3B8),
                      fontWeight: FontWeight.w400,
                      letterSpacing: 4,
                    ),
                  )
                      .animate(delay: 300.ms)
                      .fadeIn(duration: 700.ms)
                      .moveY(begin: 20, end: 0, duration: 700.ms),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _heroFontSize(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    if (w < 400) return 48;
    if (w < 768) return 64;
    return 96;
  }

  double _taglineFontSize(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return w < 400 ? 12 : 16;
  }
}

// ─────────────────────────────────────────────
// Who We Are Section
// ─────────────────────────────────────────────
class _WhoWeAreSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              const SectionHeading(title: 'WHO WE ARE'),
              const SizedBox(height: 40),
              _BentoGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BentoGrid extends StatelessWidget {
  final List<_CardData> _cards = const [
    _CardData(
      title: 'Our Philosophy',
      highlightWord: 'Philosophy',
      body:
          'We believe that rugby is more than a game—it is a way of life. Every player is trained to think, adapt, support one another, and rise together as one pack. Discipline, humility, and hard work form the foundation of everything we do.',
      isLarge: true,
      isAccent: false,
    ),
    _CardData(
      title: 'Our Vision',
      highlightWord: 'Vision',
      body:
          'To create a strong rugby culture in Kerala that nurtures talent, promotes equality, and provides young athletes with opportunities to grow through sport, education, and life skills.',
      isLarge: false,
      isAccent: false,
    ),
    _CardData(
      title: 'Our Mission',
      highlightWord: 'Mission',
      bulletPoints: [
        'Identify, train, and develop rugby talent across Kerala',
        'Provide structured pathways from grassroots to competitive rugby',
        'Empower youth, especially from coastal communities',
        'Promote teamwork, respect, leadership, and perseverance',
      ],
      isLarge: false,
      isAccent: false,
    ),
    _CardData(
      title: 'Community & Impact',
      highlightWord: 'Impact',
      body:
          'Kerala Wolfpack strongly believes in giving back to the community. Along with our broader mission across Kerala, we place special focus on promoting and guiding youth from the coastal regions of Malabar in Kerala.\n\nWe actively encourage and support young players from coastal and underrepresented backgrounds, helping them access better opportunities in sports, education, and personal growth.',
      isLarge: true,
      isAccent: true,
    ),
    _CardData(
      title: 'What We Do',
      highlightWord: 'Do',
      bulletPoints: [
        'Grassroots rugby development',
        'Competitive Sevens & Fifteens training',
        'Physical conditioning & performance',
        'Talent identification & development',
        'Community outreach programs',
      ],
      isLarge: false,
      isAccent: false,
    ),
    _CardData(
      title: 'About Us',
      highlightWord: 'Us',
      body:
          'Built on strength, unity, and opportunity. Founded with a deep passion for the game and a strong sense of purpose, our club is committed to developing rugby across Kerala while shaping confident, disciplined, and resilient individuals on and off the field.',
      isLarge: false,
      isAccent: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    if (isMobile) {
      return Column(
        children: _cards
            .map((card) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: BentoCard(data: card),
                ))
            .toList(),
      );
    }

    // Desktop: wrap layout
    final largeCards = _cards.where((c) => c.isLarge).toList();
    final smallCards = _cards.where((c) => !c.isLarge).toList();

    return Column(
      children: [
        // First large card
        BentoCard(data: largeCards[0]),
        const SizedBox(height: 16),
        // 2 small cards side by side
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: BentoCard(data: smallCards[0])),
            const SizedBox(width: 16),
            Expanded(child: BentoCard(data: smallCards[1])),
          ],
        ),
        const SizedBox(height: 16),
        // Second large card
        BentoCard(data: largeCards[1]),
        const SizedBox(height: 16),
        // Last 2 small cards
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: BentoCard(data: smallCards[2])),
            const SizedBox(width: 16),
            Expanded(child: BentoCard(data: smallCards[3])),
          ],
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// Schedule Section
// ─────────────────────────────────────────────
class _ScheduleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.2,
          colors: [Color(0x0DFBBF24), Colors.transparent],
        ),
      ),
      child: Column(
        children: [
          const SectionHeading(title: 'UPCOMING UPDATES'),
          const SizedBox(height: 40),
          const ScheduleCard(
            label: 'COMING SOON',
            message: 'Stay tuned for our next match and training schedules!',
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Internal data model (re-exported for BentoCard)
// ─────────────────────────────────────────────
class _CardData {
  final String title;
  final String highlightWord;
  final String body;
  final List<String> bulletPoints;
  final bool isLarge;
  final bool isAccent;

  const _CardData({
    required this.title,
    required this.highlightWord,
    this.body = '',
    this.bulletPoints = const [],
    required this.isLarge,
    required this.isAccent,
  });
}
