import 'package:flutter/material.dart';
import 'package:flutter_p2/pages/rating_fill_page.dart';

class ReviewPage extends StatefulWidget {
  final double ratingCount;
  const ReviewPage({super.key, required this.ratingCount});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  late double ratingCount;

  @override
  void initState() {
    super.initState(); 
    ratingCount = widget.ratingCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Reviews and Ratings', style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(51, 51, 51, 1),
          ),),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(18),
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: double.infinity,
              child: TextButton(onPressed: () async {
                final retrunRating = await Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => RatingFillPage()
                  )
                );
                if (retrunRating != null){
                  setState(() {
                    ratingCount = retrunRating;
                  });
                }
              },
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric( vertical: 16)
                ),
                backgroundColor: WidgetStateProperty.all(Color.fromRGBO(95, 27, 231, 1)),
                foregroundColor: WidgetStateProperty.all(Color.fromRGBO(255, 255, 255, 1)),
              ),
              child: Text('Write Review', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
              ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Text(' $ratingCount', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            )
          ],
          
        ),
      ),
    );
  }
}