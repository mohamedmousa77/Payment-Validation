import 'package:flutter/material.dart';
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
      backgroundColor:Colors.black,
      resizeToAvoidBottomInset: true,
      body: Container(
        margin: const EdgeInsets.only(top: 150),
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
                    )
                )
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
                            labelText: 'Card Number',
                            hintText: 'xxxx xxxx xxxx xxxx',
                          labelStyle: TextStyle(color: Colors.white),
                           hintStyle:  TextStyle(color: Colors.white38),

                        ),
                        expiryDateDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Expiry Date',
                            hintText: 'xx/xx',
                            labelStyle: TextStyle(color: Colors.white),
                          hintStyle:  TextStyle(color: Colors.white38),
                        ),
                        cvvCodeDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CVV',
                            hintText: 'xxx',
                            labelStyle: TextStyle(color: Colors.white),
                          hintStyle:  TextStyle(color: Colors.white38),
                        ),
                        cardHolderDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Card Holder',
                            labelStyle: TextStyle(color: Colors.white),
                          hintStyle:  TextStyle(color: Colors.white38),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                      GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            debugPrint('validate');
                          }
                          else {
                            debugPrint('inValidate');
                          }
                        },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:  BorderRadius.circular(8.0),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment(0.8, 1),
                              colors: [
                                Color.fromRGBO(63,94,251,1),
                                Color.fromRGBO(252,70,107,1)
                              ]
                              )
                            ),
                            height: MediaQuery.of(context).size.height * 0.07,
                            width:  MediaQuery.of(context).size.width *0.9,
                            child: const Center(
                              child:  Text(
                                'Validate',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'poppins',
                                  fontSize: 20,
                                  package: 'flutter_credit_card',
                                ), // TextStyle
                              ),
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
