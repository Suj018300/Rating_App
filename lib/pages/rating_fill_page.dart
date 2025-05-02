import 'package:flutter/material.dart';
import 'package:flutter_p2/pages/review_page.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingFillPage extends StatefulWidget {
  const RatingFillPage({super.key});

  @override
  State<RatingFillPage> createState() => _RatingFillPageState();
}

class _RatingFillPageState extends State<RatingFillPage> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Rate the product',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(51, 51, 51, 1),
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(18),
        child: Column(
          children: [
            Text('Help us improve our tool to best suit your needs by rating us here!', style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(53, 66, 89, 1),
            ),
            ),
            SizedBox(height: 16),
            Text('Rating $rating'),
            Center(
              child: RatingBar.builder(
                minRating: 1,
                allowHalfRating: false,
                itemBuilder: (context, _) => Icon(Icons.star_rounded, color: Colors.yellow,), 
                onRatingUpdate: (ratingValue) => setState(() {
                  rating = ratingValue;
                },
                ),
              )
            ),
            ElevatedButton(onPressed: () { Navigator.pop(
              context, rating,
            );
            }, 
            child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}