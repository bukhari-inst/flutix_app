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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                margin: EdgeInsets.only(right: 16),
                                width: MediaQuery.of(context).size.width *
                                    0.5, // posisi text stengah layar
                                child: Text(
                                  widget.ticket.movieDetail.title,
                                  style: blackTextFont.copyWith(fontSize: 20),
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.end,
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

                  // ! note: CINEMA SCREEN
                  Container(
                      margin: EdgeInsets.only(top: 30),
                      width: 277,
                      height: 84,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/screen.png")))),

                  // ! note: SEATS
                  generateSeats()
                ])
              ],
            )
          ]),
        ));
  }

  // fungsi generate seats
  Column generateSeats() {
    List<int> numberofSeats = [3, 5, 5, 5, 5];
    List<Widget> widgets = [];

    for (int i = 0; i < numberofSeats.length; i++) {
      widgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            numberofSeats[i],
            (index) => Padding(
                  padding: EdgeInsets.only(
                      right: index < numberofSeats[i] - 1 ? 16 : 0, bottom: 16),
                  child: SelectableBox(
                    "A",
                    width: 40,
                    height: 40,
                  ),
                )),
      ));
    }

    return Column(children: widgets);
  }
}
