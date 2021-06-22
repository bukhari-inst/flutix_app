part of 'pages.dart';

class SuccessPage extends StatelessWidget {
  final Ticket ticket;
  final MovieidTransaction transaction;

  SuccessPage(this.ticket, this.transaction);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return;
        },
        child: Scaffold(
          body: FutureBuilder(
              future: ticket != null
                  ? processingTicketOrder(context)
                  : processingTopUp(),
              builder: (_, snapshot) =>
                  (snapshot.connectionState == ConnectionState.done)
                      ? Center(
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            onPressed: () {
                              context.bloc<PageBloc>().add(GoToMainPage());
                            },
                          ),
                        )
                      : Center(
                          child: SpinKitFadingCircle(
                            color: mainColor,
                            size: 50,
                          ),
                        )),
        ));
  }

  Future<void> processingTicketOrder(BuildContext context) async {
    context.bloc<UserBloc>().add(Purchase(ticket.totalPrice));
    context.bloc<TicketBloc>().add(BuyTicket(ticket, transaction.userID));

    await MovieidTransactionServices.saveTransaction(transaction);
  }

  Future<void> processingTopUp() async {}
}
