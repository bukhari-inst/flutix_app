part of 'pages.dart';

class CheckoutPage extends StatefulWidget {
  final Ticket ticket;

  CheckoutPage(this.ticket);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToSelectSeatPage(widget.ticket));

          return;
        },
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                color: accentColor1,
              ),
              SafeArea(
                  child: Container(
                color: Colors.white,
              )),
              ListView(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      // ! note: BACK BUTTON
                      Row(
                        children: <Widget>[
                          Container(
                            margin:
                                EdgeInsets.only(top: 20, left: defaultMargin),
                            padding: EdgeInsets.all(1),
                            child: GestureDetector(
                              onTap: () {
                                context
                                    .bloc<PageBloc>()
                                    .add(GoToSelectSeatPage(widget.ticket));
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),

                      BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
                        User user = (userState as UserLoaded).user;

                        return Column(
                          children: <Widget>[
                            // ! note: PAGE TITLE
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                "Checkout\nMovie",
                                style: blackTextFont.copyWith(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            // ! note: MOVIE DESCRIPTION
                            Row(
                              children: [
                                Container(
                                  width: 70,
                                  height: 90,
                                  margin: EdgeInsets.only(
                                      left: defaultMargin, right: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: NetworkImage(imageBaseURL +
                                              'w342' +
                                              widget.ticket.movieDetail
                                                  .posterPath),
                                          fit: BoxFit.cover)),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                        //dikasih sizedbox supaya judul tdk tembus kesamping klo jdulnya pnjng
                                        // lbr layar-....70 adlah lebar poster, 20, jrak poster ke judul
                                        width:
                                            MediaQuery.of(context).size.width -
                                                2 * defaultMargin -
                                                70 -
                                                20,
                                        child: Text(
                                          widget.ticket.movieDetail.title,
                                          style: blackTextFont.copyWith(
                                              fontSize: 18),
                                          maxLines: 2,
                                          overflow: TextOverflow.clip,
                                        )),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          2 * defaultMargin -
                                          70 -
                                          20,
                                      margin: EdgeInsets.symmetric(vertical: 6),
                                      child: Text(
                                        widget.ticket.movieDetail
                                            .genresAndLanguage,
                                        style: greyTextFont.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    RatingStars(
                                      voteAverage:
                                          widget.ticket.movieDetail.voteAverage,
                                      color: accentColor3,
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        );
                      })
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
