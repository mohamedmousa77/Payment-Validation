import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({Key? key}) : super(key: key);

  @override
  State<CreditCardScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CreditCardScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromRGBO(34, 53, 53, 1),
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: const Text('Credit Card View'),
      // ),
      resizeToAvoidBottomInset: true,
      body: Container(
        margin: EdgeInsets.only(top: 150),
        child: Column(
          children: [
            CreditCardWidget(
              backgroundImage: 'asset/Mastercard.png',
              customCardTypeIcons: [
                CustomCardTypeIcon(
                    cardType: CardType.mastercard,
                    cardImage: Image.asset('asset/visa.png',
                      height: 48,
                      width: 48,
                    ))
              ],
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: onCreditCardWidgetChange,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              glassmorphismConfig: Glassmorphism(
                blurX: 10.0,
                blurY: 10.0,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.grey.withAlpha(20),
                    Colors.grey.withAlpha(20),
                  ],
                  stops: const <double>[
                    0.3,
                    0,
                  ],
                ),
              ),
              // isChipVisible: true,
              // isSwipeGestureEnabled: true,

            ),
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CreditCardForm(
                        obscureCvv: true,
                        obscureNumber: true,
                        isHolderNameVisible: true,
                        isCardNumberVisible: true,
                        isExpiryDateVisible: true,
                        cardNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                        onCreditCardModelChange: onCreditCardModelChange,
                        themeColor: Colors.blue,
                        formKey: formKey,
                        cardNumberDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Number',
                            hintText: 'xxxx xxxx xxxx xxxx'
                        ),
                        expiryDateDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Expiry Date',
                            hintText: 'xx/xx'
                        ),
                        cvvCodeDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Cvv',
                            hintText: 'xxx'
                        ),
                        cardHolderDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Card Holder',
                        ),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              debugPrint('validate');
                            }
                            else {
                              debugPrint('inValidate');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ), // RoundedRectangle Border
                              primary: Color.fromRGBO(210, 140, 84, 1)
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(left: 15,top: 10),
                            height: 50,
                            width: 150,
                            child: const Text(
                              'validate',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'halter',
                                fontSize: 20,
                                package: 'flutter_credit_card',
                              ), // TextStyle
                            ), // Text
                          )

                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  void onCreditCardWidgetChange(CreditCardBrand) {}

}
