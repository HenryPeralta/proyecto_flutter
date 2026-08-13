import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_flutter/l10n/app_localizations.dart';

import '../../../dashboard/presentation/widgets/dashboard_header.dart';
import '../../domain/entities/transaction.dart';
import '../../history_dependencies.dart';
import '../state/history_provider.dart';

class HistoryTransView extends ConsumerStatefulWidget {
  const HistoryTransView({super.key});

  @override
  ConsumerState<HistoryTransView> createState() => _HistoryTransViewState();
}

class _HistoryTransViewState extends ConsumerState<HistoryTransView> {
  static const _pageSize = 15;
  final _scrollController = ScrollController();
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(historyProvider.notifier).loadFirstPage());
  }

  Future<void> _refresh() async {
    setState(() => _pageIndex = 0);
    await ref.read(historyProvider.notifier).loadFirstPage();
  }

  Future<void> _nextPage(HistoryState state) async {
    final nextPageStart = (_pageIndex + 1) * _pageSize;
    if (nextPageStart >= state.transactions.length && state.hasMore) {
      await ref.read(historyProvider.notifier).loadNextPage();
    }
    if (!mounted) return;
    final updated = ref.read(historyProvider);
    if (nextPageStart < updated.transactions.length) {
      setState(() => _pageIndex++);
      _scrollController.jumpTo(0);
    }
  }

  void _previousPage() {
    if (_pageIndex == 0) return;
    setState(() => _pageIndex--);
    _scrollController.jumpTo(0);
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
        action: _refresh,
      );
    }
    if (state.transactions.isEmpty) {
      return _Message(
        icon: Icons.receipt_long_outlined,
        message: 'Aún no tienes transacciones.',
        action: _refresh,
      );
    }

    final start = _pageIndex * _pageSize;
    final safeStart = start < state.transactions.length ? start : 0;
    final proposedEnd = safeStart + _pageSize;
    final end = proposedEnd < state.transactions.length
        ? proposedEnd
        : state.transactions.length;
    final pageItems = state.transactions.sublist(safeStart, end);
    final canGoNext = end < state.transactions.length || state.hasMore;

    return RefreshIndicator(
      onRefresh: _refresh,
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: pageItems.length + 1,
        itemBuilder: (context, index) {
          if (index == pageItems.length) {
            return _PaginationControls(
              pageNumber: _pageIndex + 1,
              itemCount: pageItems.length,
              isLoading: state.isLoadingMore,
              canGoPrevious: _pageIndex > 0,
              canGoNext: canGoNext,
              onPrevious: _previousPage,
              onNext: () => _nextPage(state),
            );
          }
          return _TransactionTile(transaction: pageItems[index]);
        },
      ),
    );
  }
}

class _PaginationControls extends StatelessWidget {
  const _PaginationControls({
    required this.pageNumber,
    required this.itemCount,
    required this.isLoading,
    required this.canGoPrevious,
    required this.canGoNext,
    required this.onPrevious,
    required this.onNext,
  });

  final int pageNumber;
  final int itemCount;
  final bool isLoading;
  final bool canGoPrevious;
  final bool canGoNext;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Página $pageNumber · $itemCount transacciones'),
            const SizedBox(height: 10),
            if (isLoading)
              const Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 8),
                  Text('Cargando siguiente página...'),
                ],
              )
            else
              Wrap(
                spacing: 10,
                children: [
                  if (canGoPrevious)
                    OutlinedButton.icon(
                      onPressed: onPrevious,
                      icon: const Icon(Icons.chevron_left),
                      label: const Text('Página anterior'),
                    ),
                  if (canGoNext)
                    FilledButton.icon(
                      onPressed: onNext,
                      icon: const Icon(Icons.chevron_right),
                      label: const Text('Siguiente página'),
                    ),
                ],
              ),
            if (!canGoNext) ...[
              const SizedBox(height: 4),
              const Text('No hay más transacciones'),
            ],
          ],
        ),
      );
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
          child: Icon(
            income ? Icons.arrow_downward : Icons.arrow_upward,
            color: Colors.white,
          ),
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
  const _Message({
    required this.icon,
    required this.message,
    required this.action,
  });

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
