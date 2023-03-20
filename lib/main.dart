import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF13191D),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.menu_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Hey, Selena",
                          style: TextStyle(
                            color: Color(0xFFF9F9F9),
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Welcome back",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Total Balance",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "\$ 5 194 482",
                  style: TextStyle(
                    fontSize: 35,
                    color: Color(0xFFF9F9F9),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Button(
                      text: "Transfer",
                      bgColor: Color(0xFFEC932C),
                      textColor: Color(0xFF200700),
                    ),
                    Button(
                      text: "Request",
                      bgColor: Color(0xFF1D2529),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Wallets",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFF9F9F9),
                      ),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const CurrencyCard(
                  currency: "Euro",
                  money: "6 428",
                  countryShort: "EUR",
                  bgColor: Color(0xFF1D2529),
                  textColor: Color(0xFFF9F9F9),
                  iconColor: Colors.white,
                  moneySymbol: Icons.euro_symbol,
                ),
                Transform.translate(
                  offset: const Offset(0, -20),
                  child: const CurrencyCard(
                    currency: "Dollar",
                    money: "55 622",
                    countryShort: "USD",
                    bgColor: Color(0xFFF9F9F9),
                    textColor: Color(0xFF1D2529),
                    iconColor: Colors.black,
                    moneySymbol: Icons.attach_money,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -40),
                  child: const CurrencyCard(
                    currency: "Rupee",
                    money: "28 981",
                    countryShort: "INR",
                    bgColor: Color(0xFF1D2529),
                    textColor: Color(0xFFF9F9F9),
                    iconColor: Colors.white,
                    moneySymbol: Icons.currency_rupee,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
