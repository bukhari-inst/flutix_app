part of 'pages.dart';

class TopUpPage extends StatefulWidget {
  final PageEvent pageEvent;

  TopUpPage(this.pageEvent);

  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  TextEditingController amountController = TextEditingController(text: 'IDR 0');
  int selectedAmount = 0;

  @override
  Widget build(BuildContext context) {
    context.bloc<ThemeBloc>().add(
        ChangeTheme(ThemeData().copyWith(primaryColor: Color(0xFFE4E4E4))));

    //hitung panjang card
    double cardWidth =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 40) / 3;

    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(widget.pageEvent);

        return;
      },
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                // note: BACK ARROW
                SafeArea(
                    child: Container(
                        margin: EdgeInsets.only(top: 20, left: defaultMargin),
                        child: GestureDetector(
                            onTap: () {
                              context.bloc<PageBloc>().add(widget.pageEvent);
                            },
                            child:
                                Icon(Icons.arrow_back, color: Colors.black)))),

                // note: CONTENT
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Column(children: <Widget>[
                    SizedBox(height: 20),
                    Text(
                      "Top Up",
                      style: blackTextFont.copyWith(fontSize: 20),
                    ),
                    SizedBox(height: 30),
                    TextField(
                        onChanged: (text) {
                          String temp = '';

                          for (var i = 0; i < text.length; i++) {
                            temp += text.isDigit(i) ? text[i] : '';
                          }

                          //kalo gagal ksih 0 / diubah dari textfield money card gk nyalagk kepilih
                          setState(() {
                            selectedAmount = int.tryParse(temp) ?? 0;
                          });

                          // convert temp ke format currency
                          amountController.text = NumberFormat.currency(
                                  locale: 'id_ID',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(selectedAmount);

                          // pindah kursor textfield ke paling belakang
                          amountController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: amountController.text.length));
                        },
                        controller: amountController,
                        decoration: InputDecoration(
                          labelStyle: greyTextFont,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: "Amount",
                        )),
                    // choose by template
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 20, bottom: 14),
                        child: Text(
                          "Choose by Template",
                          style: blackTextFont,
                        ),
                      ),
                    ),
                    Wrap(
                      spacing: 20, //jrak horizontal
                      runSpacing: 14,
                      children: <Widget>[
                        makeMoneyCard(amount: 50000, width: cardWidth),
                        makeMoneyCard(amount: 100000, width: cardWidth),
                        makeMoneyCard(amount: 150000, width: cardWidth),
                        makeMoneyCard(amount: 200000, width: cardWidth),
                        makeMoneyCard(amount: 250000, width: cardWidth),
                        makeMoneyCard(amount: 500000, width: cardWidth),
                        makeMoneyCard(amount: 100000, width: cardWidth),
                        makeMoneyCard(amount: 250000, width: cardWidth),
                        makeMoneyCard(amount: 500000, width: cardWidth),
                      ],
                    )
                  ]),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  // note: FUNGSI MONEY CARD
  MoneyCard makeMoneyCard({int amount, double width}) {
    return MoneyCard(
      amount: amount,
      width: width,
      isSelected: amount == selectedAmount,
      onTap: () {
        setState(() {
          if (selectedAmount != amount) {
            selectedAmount = amount;
          } else {
            selectedAmount = 0;
          }

          // pasang amountController dg format currency
          amountController.text = NumberFormat.currency(
                  locale: 'id_ID', decimalDigits: 0, symbol: 'IDR ')
              .format(selectedAmount);

          // pindah cursor
          amountController.selection = TextSelection.fromPosition(
              TextPosition(offset: amountController.text.length));
        });
      },
    );
  }
}