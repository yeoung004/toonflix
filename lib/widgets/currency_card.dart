// ignore_for_file: file_names
import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String currency;
  final String money;
  final String countryShort;
  final Color bgColor;
  final Color textColor;
  final Color iconColor;
  final IconData moneySymbol;

  const CurrencyCard({
    super.key,
    required this.currency,
    required this.bgColor,
    required this.textColor,
    required this.iconColor,
    required this.moneySymbol,
    required this.money,
    required this.countryShort,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgColor,
      ),
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currency,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    money,
                    style: TextStyle(
                      color: textColor.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "EUR",
                    style: TextStyle(
                      color: textColor.withOpacity(0.5),
                    ),
                  ),
                ],
              )
            ],
          ),
          Transform.scale(
            scale: 2.2,
            child: Transform.translate(
              offset: const Offset(-5, 15),
              child: Icon(
                moneySymbol,
                color: iconColor,
                size: 80,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
