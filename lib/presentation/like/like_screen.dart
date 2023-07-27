import 'package:flutter/material.dart';
import 'package:passionshower/presentation/like/like_view_model.dart';
import 'package:provider/provider.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final likeViewModel = context.watch<LikeScreenViewModel>();
    final likedQuotes = likeViewModel.likedQuotes;

    return ListView.builder(
      itemCount: likedQuotes.length,
      itemBuilder: (context, index) {
        final quote = likedQuotes[index];
        return ListTile(
          title: Text(
            quote.message,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                quote.author,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 4),
              Text(
                quote.job,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              likeViewModel.unlikeQuote(quote);
            },
          ),
        );
      },
    );
  }
}
