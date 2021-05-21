part of 'widgets.dart';

class PromoCard extends StatelessWidget {
  final Promo promo;

  PromoCard(this.promo);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            height: 80,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: mainColor, borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(promo.title, style: whiteTextFont),
                    Text(promo.subtitle,
                        style: whiteTextFont.copyWith(
                            fontSize: 11, fontWeight: FontWeight.w300))
                  ],
                ),
                Row(children: <Widget>[
                  Text("OFF ",
                      style: yellowNumberTextFont.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w600)),
                  Text("${promo.discount}%",
                      style: yellowNumberTextFont.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w600)),
                ])
              ],
            ))
      ],
    );
  }
}
