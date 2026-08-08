import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_flutter/l10n/app_localizations.dart';

import '../../../dashboard/presentation/widgets/dashboard_header.dart';
import '../../history_dependencies.dart';
import '../../domain/entities/transaction.dart';
import '../state/history_provider.dart';

class HistoryTransView extends ConsumerStatefulWidget {
  const HistoryTransView({super.key});

  @override
  ConsumerState<HistoryTransView> createState() => _HistoryTransViewState();
}

class _HistoryTransViewState extends ConsumerState<HistoryTransView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(historyProvider.notifier).loadFirstPage());
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.extentAfter < 250) {
      ref.read(historyProvider.notifier).loadNextPage();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(historyProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          DashboardHeader(title: l10n.transactionHistory),
          Expanded(child: _content(state)),
        ],
      ),
    );
  }

  Widget _content(HistoryState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.errorMessage != null && state.transactions.isEmpty) {
      return _Message(
        icon: Icons.cloud_off,
        message: state.errorMessage!,
        action: () => ref.read(historyProvider.notifier).loadFirstPage(),
      );
    }
    if (state.transactions.isEmpty) {
      return _Message(
        icon: Icons.receipt_long_outlined,
        message: 'Aún no tienes transacciones.',
        action: () => ref.read(historyProvider.notifier).loadFirstPage(),
      );
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(historyProvider.notifier).loadFirstPage(),
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: state.transactions.length + 1,
        itemBuilder: (context, index) {
          if (index == state.transactions.length) {
            if (state.isLoadingMore) {
              return const Padding(
                padding: EdgeInsets.all(20),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(state.hasMore ? '' : 'No hay más transacciones'),
              ),
            );
          }
          return _TransactionTile(transaction: state.transactions[index]);
        },
      ),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  const _TransactionTile({required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final income = transaction.isIncome;
    final color = income ? Colors.green : Colors.red;
    final amount = transaction.amountInCents.abs() / 100;
    final money =
        NumberFormat.simpleCurrency(name: transaction.currency).format(amount);
    final date = DateFormat.yMMMd(Localizations.localeOf(context).toString())
        .add_Hm()
        .format(transaction.createdAt);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(income ? Icons.arrow_downward : Icons.arrow_upward,
              color: Colors.white),
        ),
        title: Text(transaction.description),
        subtitle: Text('$date · ${transaction.status}'),
        trailing: Text(
          '${income ? '+' : '-'}$money',
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message(
      {required this.icon, required this.message, required this.action});

  final IconData icon;
  final String message;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 52, color: Colors.grey),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(message, textAlign: TextAlign.center),
            ),
            TextButton(onPressed: action, child: const Text('Reintentar')),
          ],
        ),
      );
}
