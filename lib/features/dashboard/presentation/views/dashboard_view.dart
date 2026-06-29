import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_flutter/features/dashboard/domain/entities/user_account.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/state/dashboard_provider.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/widgets/card_client.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/widgets/recent_transactions.dart';
import 'package:proyecto_flutter/l10n/app_localizations.dart';

class DashboardView extends StatefulWidget {
  final String userName;
  final String userEmail;

  const DashboardView({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DashboardProvider>().userPerfil(
            widget.userName,
            widget.userEmail,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Consumer<DashboardProvider>(
        builder: (context, dashboard, _) {
          return Column(
            children: [
              DashboardHeader(title: l10n.dashboard),
              Expanded(
                child: _buildContent(context, dashboard),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, DashboardProvider dashboard) {
    if (dashboard.products.isEmpty && dashboard.errorMessage == null) {
      return const Center(
        child: CircularProgressIndicator(
          color: Color(0xFFFF6A6A),
        ),
      );
    }

    if (dashboard.errorMessage != null && dashboard.products.isEmpty) {
      return _DashboardError(
        onRetry: () => dashboard.userPerfil(widget.userName, widget.userEmail),
      );
    }

    return RefreshIndicator(
      color: const Color(0xFFFF6A6A),
      onRefresh: () => dashboard.userPerfil(widget.userName, widget.userEmail),
      child: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          if (dashboard.errorMessage != null)
            const _CacheNotice(),
          if (dashboard.isLoading) const LinearProgressIndicator(minHeight: 2),
          const SizedBox(height: 10),
          const CardClient(),
          const SizedBox(height: 14),
          _ProductsSummary(products: dashboard.products),
          const SizedBox(height: 18),
          const RecentTransactions(),
        ],
      ),
    );
  }
}

class _ProductsSummary extends StatelessWidget {
  final List<UserAccount> products;

  const _ProductsSummary({required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.myProducts,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ...products.map((product) => _ProductTile(product)),
        ],
      ),
    );
  }
}

class _ProductTile extends StatelessWidget {
  final UserAccount product;

  const _ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFFFE4D6),
          child: Icon(
            _iconForProduct(product.card),
            color: const Color(0xFFFF6A6A),
          ),
        ),
        title: Text(
          _productTitle(context, product.card),
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Text(product.accountNumber),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              product.moneda,
              style: const TextStyle(
                color: Color(0xFF777777),
                fontSize: 12,
              ),
            ),
            Text(
              product.balance.toStringAsFixed(2),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _iconForProduct(String productName) {
    if (productName == 'Prestamo') return Icons.request_quote_outlined;
    if (productName == 'Ahorro') return Icons.savings_outlined;
    if (productName == 'Cuenta') return Icons.account_balance_outlined;
    return Icons.credit_card;
  }

  String _productTitle(BuildContext context, String productName) {
    final l10n = AppLocalizations.of(context)!;
    if (productName == 'Prestamo') return l10n.personalLoanProduct;
    if (productName == 'Ahorro') return l10n.savingsAccountProduct;
    if (productName == 'Cuenta') return l10n.checkingAccountProduct;
    return l10n.primaryCardProduct;
  }
}

class _DashboardError extends StatelessWidget {
  final VoidCallback onRetry;

  const _DashboardError({
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline,
              color: Color(0xFFFF6A6A),
              size: 44,
            ),
            const SizedBox(height: 12),
            Text(
              AppLocalizations.of(context)!.dashboardLoadErrorTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 6),
            Text(
              AppLocalizations.of(context)!.dashboardLoadErrorSubtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF777777),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: Text(AppLocalizations.of(context)!.retry),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6A6A),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CacheNotice extends StatelessWidget {
  const _CacheNotice();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3CD),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.info_outline,
            color: Color(0xFF8A6D00),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.dashboardCacheNotice,
              style: const TextStyle(color: Color(0xFF6D5300)),
            ),
          ),
        ],
      ),
    );
  }
}
