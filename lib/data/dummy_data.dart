import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/offer.dart';
import 'package:flutter_assignment/models/payment.dart';

// contacts
List<String> contacts = [
  'Tony Stark',
  'Steve Rogers',
  'Prince J',
  'Thor',
  'Steve Jobs',
  'Jagga Daaku',
  'Jonathan',
];

// offers
final List<Offer> banners = [
  Offer(
    title: '🎉 Cashback Fiesta',
    subtitle: 'Get up to ₹500 on 3 bill payments',
    buttonText: 'Claim',
    bgColor: Color(0xFF4A3CB5),
  ),
  Offer(
    title: '⚡ Recharge Offer',
    subtitle: 'Flat ₹20 off on mobile recharges',
    buttonText: 'Grab',
    bgColor: Color(0xFF0984E3),
  ),
  Offer(
    title: '🛡️ Insurance Deal',
    subtitle: 'Get covered starting ₹99/month',
    buttonText: 'Explore',
    bgColor: Color(0xFF00B894),
  ),
];

// payment and bills
final List<BillSectionItem> billItems = [
  BillSectionItem(emoji: '📱', label: 'Topup'),
  BillSectionItem(emoji: '💧', label: 'Water'),
  BillSectionItem(emoji: '💡', label: 'Electricity'),
  BillSectionItem(emoji: '📺', label: 'TV'),
  BillSectionItem(emoji: '🏠', label: 'Rent'),
  BillSectionItem(emoji: ' 🚌', label: 'Transport'),
  BillSectionItem(emoji: '🛡️', label: 'Insurance'),
  BillSectionItem(emoji: '🏥', label: 'Mdeical'),
];

// transactions
final List<Map<String, dynamic>> transactions = [
    {
      'name': 'Tony Stark',
      'amount': '- ₹450.00',
      'date': 'Today, 2:30 PM',
      'type': 'sent',
      'icon': Icons.arrow_upward_rounded,
      'color': Color(0xFFFF6B6B),
    },
    {
      'name': 'Steve Rogers',
      'amount': '+ ₹1,200.00',
      'date': 'Today, 11:15 AM',
      'type': 'received',
      'icon': Icons.arrow_downward_rounded,
      'color': Color(0xFF00B894),
    },
    {
      'name': 'Prince J',
      'amount': '- ₹320.50',
      'date': 'Yesterday, 5:45 PM',
      'type': 'sent',
      'icon': Icons.arrow_upward_rounded,
      'color': Color(0xFFFF6B6B),
    },
    {
      'name': 'Thor',
      'amount': '+ ₹890.00',
      'date': 'Jun 3, 3:20 PM',
      'type': 'received',
      'icon': Icons.arrow_downward_rounded,
      'color': Color(0xFF00B894),
    },
    {
      'name': 'Steve Jobs',
      'amount': '-\$150.00',
      'date': 'Jun 2, 10:30 AM',
      'type': 'sent',
      'icon': Icons.arrow_upward_rounded,
      'color': Color(0xFFFF6B6B),
    },
    {
      'name': 'Jagga Daaku',
      'amount': '+\$2,500.00',
      'date': 'Jun 1, 9:15 AM',
      'type': 'received',
      'icon': Icons.arrow_downward_rounded,
      'color': Color(0xFF00B894),
    },
  ];
