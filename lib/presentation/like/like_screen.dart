import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passionshower/presentation/like/like_view_model.dart';
import 'package:provider/provider.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({Key? key}) : super(key: key);

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    final likeViewModel = context.watch<LikeScreenViewModel>();
    final likedQuotes = likeViewModel.likedQuotes;

    return ListView.builder(
      itemCount: likedQuotes.length,
      itemBuilder: (context, index) {
        final quote = likedQuotes[index];
        return Dismissible(
          key: UniqueKey(),
          background: Container(
            color:
                Colors.red, // Set the background color when swiping to delete
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 16),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            likeViewModel.unlikeQuote(quote);
          },
          child: Card(
            elevation: 2, // Add some elevation to the card for a shadow effect
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    quote.message,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nanumPenScript(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  )
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    quote.author,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    quote.job,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ), // Add a drag handle icon
            ), // Add a drag handle icon
          ),
        );
      },
    );
  }
}
