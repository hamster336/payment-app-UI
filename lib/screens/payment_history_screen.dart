import 'package:flutter/material.dart';
import 'package:flutter_assignment/constants/global_variables.dart';
import 'package:flutter_assignment/data/dummy_data.dart';
import 'package:flutter_assignment/widgets/transaction_card.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({super.key});

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  int selectedFilter = 0;
  final List<String> filters = ['All', 'Sent', 'Received'];
  late List<Map<String, dynamic>> filteredTransactions;

  @override
  void initState() {
    super.initState();
    _updateFilteredTransactions();
  }

  void _updateFilteredTransactions() {
    if (selectedFilter == 0) {
      // Show all transactions
      filteredTransactions = transactions;
    } else if (selectedFilter == 1) {
      // Show only sent transactions
      filteredTransactions = transactions
          .where((t) => t['type'] == 'sent')
          .toList();
    } else {
      // Show only received transactions
      filteredTransactions = transactions
          .where((t) => t['type'] == 'received')
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.primaryColor,
        title: Text(
          'Payment History',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Filter chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: size.height * 0.015,
            ),
            child: Row(
              children: List.generate(
                filters.length,
                (index) => Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: FilterChip(
                    checkmarkColor: Colors.white,
                    selected: selectedFilter == index,
                    onSelected: (value) {
                      setState(() {
                        selectedFilter = index;
                        _updateFilteredTransactions();
                      });
                    },
                    label: Text(
                      filters[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: selectedFilter == index
                            ? Colors.white
                            : Color(0xFF5A6478),
                      ),
                    ),
                    backgroundColor: Colors.grey.shade200,
                    selectedColor: GlobalVariables.primaryColor,
                    side: BorderSide.none,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                ),
              ),
            ),
          ),
          // Transaction list
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.02,
                vertical: size.height * 0.01,
              ),
              itemCount: filteredTransactions.length,
              itemBuilder: (context, index) {
                final transaction = filteredTransactions[index];
                return buildTransactionCard(context, transaction, size);
              },
            ),
          ),
        ],
      ),
    );
  }
}
