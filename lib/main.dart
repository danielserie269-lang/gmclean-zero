import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";

void main() => runApp(const GmcleanApp());

class GmcleanApp extends StatelessWidget {
  const GmcleanApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seed = Color(0xFF1E88E5);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gmclean",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.light),
        scaffoldBackgroundColor: const Color(0xFFF6F8FB),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.dark),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    Widget card(IconData icon, String title, String sub, int i) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cs.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: cs.outlineVariant),
        ),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 4),
                  Text(sub, style: TextStyle(color: cs.onSurfaceVariant)),
                ],
              ),
            ),
          ],
        ),
      ).animate().fadeIn(delay: (80 * i).ms, duration: 220.ms).slideY(begin: .06);
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Gmclean"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cs.primaryContainer,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Icon(Icons.auto_delete_outlined, color: cs.onPrimaryContainer),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Limpeza rápida da caixa de entrada",
                      style: TextStyle(color: cs.onPrimaryContainer, fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(duration: 250.ms).slideY(begin: .10),

            const SizedBox(height: 14),
            card(Icons.local_offer_outlined, "Promoções", "Arquivar em massa e reduzir ruído", 1),
            const SizedBox(height: 10),
            card(Icons.newspaper_outlined, "Newsletters", "Cancelar inscrições com 1 toque", 2),
            const SizedBox(height: 10),
            card(Icons.query_stats_outlined, "Resumo", "Stats e top remetentes", 3),

            const Spacer(),
            FilledButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Base pronta. Próximo passo: integrar Gmail (OAuth).")),
                );
              },
              icon: const Icon(Icons.link),
              label: const Text("Conectar Gmail (em seguida)"),
            ).animate().fadeIn(delay: 200.ms).slideY(begin: .10),
          ],
        ),
      ),
    );
  }
}
