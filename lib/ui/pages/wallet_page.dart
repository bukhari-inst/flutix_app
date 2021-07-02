part of 'pages.dart';

class WalletPage extends StatelessWidget {
  final PageEvent pageEvent;

  WalletPage(this.pageEvent);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(pageEvent);

        return;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          // note: CONTENT
          Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 0),
              child: ListView(
                children: <Widget>[
                  //stack untuk tnda panah dan judulnya, supaya my wallet bisa terus ditengah
                  Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          context.bloc<PageBloc>().add(pageEvent);
                        },
                        child: Icon(Icons.arrow_back, color: Colors.black),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "My Wallet",
                            style: blackTextFont.copyWith(fontSize: 20),
                          ),
                          // note: ID CARD
                          Container(
                              height: 185,
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xFF382A74),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 10,
                                        spreadRadius: 0,
                                        offset: Offset(0, 5))
                                  ]))
                        ],
                      )
                    ],
                  )
                ],
              )),
          // note: BUTTON
        ]),
      ),
    );
  }
}
