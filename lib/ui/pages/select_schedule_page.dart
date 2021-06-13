part of 'pages.dart';

class SelectSchedulePage extends StatefulWidget {
  final MovieDetail movieDetail;

  SelectSchedulePage(this.movieDetail);

  @override
  _SelectSchedulePageState createState() => _SelectSchedulePageState();
}

class _SelectSchedulePageState extends State<SelectSchedulePage> {
  List<DateTime> dates;
  DateTime selectedDate;

  @override
  void initState() {
    super.initState();

    // datenya dibuat slama 7 hari kedepan
    dates =
        List.generate(7, (index) => DateTime.now().add(Duration(days: index)));
    selectedDate = dates[0];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // kembali ke halaman sebelumnya
        context.bloc<PageBloc>().add(GoToMovieDetailPage(widget.movieDetail));

        return;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          Container(
            color: accentColor1,
          ),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          ListView(
            children: <Widget>[
              // note: BACK ICON
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, left: defaultMargin),
                    padding: EdgeInsets.all(1),
                    child: GestureDetector(
                      onTap: () {
                        context
                            .bloc<PageBloc>()
                            .add(GoToMovieDetailPage(widget.movieDetail));
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              // note: CHOOSE DATE
              Container(
                  // atas bawah: default margin, atas: 20, bawah: 16
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 16),
                  child: Text(
                    "Choose Date",
                    style: blackTextFont.copyWith(fontSize: 20),
                  )),
              Container(
                margin: EdgeInsets.only(bottom: 24),
                height: 90, // 90 dari tinggi date_card
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dates.length,
                    itemBuilder: (_, index) => Container(
                          margin: EdgeInsets.only(
                              left: (index == 0) ? defaultMargin : 0,
                              right: (index < dates.length - 1)
                                  ? 16
                                  : defaultMargin),
                          child: DateCard(dates[index],
                              isSelected: selectedDate == dates[index],
                              onTap: () {
                            setState(() {
                              selectedDate = dates[index];
                            });
                          }),
                        )),
              )
            ],
          )
        ]),
      ),
    );
  }
}
