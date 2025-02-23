import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.movie_outlined,
                  color: color.primary
                ),
                SizedBox(width: 10,),
                Text(
                  'Cinemapedia',
                  style: titleStyle,
                ),
              ],
            ),
            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.search)
            )
          ],
        ),
      ),
    );
  }
}
