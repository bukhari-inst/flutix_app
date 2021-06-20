part of 'pages.dart';

class SelectSeatPage extends StatefulWidget {
  final Ticket ticket;

  SelectSeatPage(this.ticket);

  @override
  _SelectSeatPageState createState() => _SelectSeatPageState();
}

class _SelectSeatPageState extends State<SelectSeatPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context
              .bloc<PageBloc>()
              .add(GoToSelectSchedulePage(widget.ticket.movieDetail));

          return;
        },
        child: Scaffold(
          body: Stack(children: <Widget>[
            Container(color: accentColor1),
            SafeArea(child: Container(color: Colors.white)),
            ListView(
              children: <Widget>[
                Column(children: <Widget>[
                  // ! note: Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 20, left: defaultMargin),
                        padding: EdgeInsets.all(1),
                        child: GestureDetector(
                          onTap: () {
                            context.bloc<PageBloc>().add(GoToSelectSchedulePage(
                                widget.ticket.movieDetail));
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      // Poster Title
                      Padding(
                        padding: EdgeInsets.only(top: 20, right: defaultMargin),
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: MediaQuery.of(context).size.width *
                                    0.5, // posisi text stengah layar
                                child: Text(
                                  widget.ticket.movieDetail.title,
                                )),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: NetworkImage(imageBaseURL +
                                          'w154' +
                                          widget.ticket.movieDetail.posterPath),
                                      fit: BoxFit.cover)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ])
              ],
            )
          ]),
        ));
  }
}
