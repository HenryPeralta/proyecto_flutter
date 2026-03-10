import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:proyecto_flutter/features/history/presentation/widgets/app_baner.dart';
import 'package:proyecto_flutter/features/history/presentation/state/history_provider.dart';
import 'package:proyecto_flutter/features/history/presentation/widgets/card_client_trans.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/widgets/dashboard_header.dart';

class HistoryTransView extends StatefulWidget {
  const HistoryTransView({super.key});

  @override
  State<HistoryTransView> createState() => _HistoryTransViewState();
}

class _HistoryTransViewState extends State<HistoryTransView> {
  @override
  void initState() {
    super.initState();
    context.read<HistoryProvider>().userPerfil(
      'Byron Toledo',
      'byron.toledo',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          DashboardHeader(
            title: "Historial de Transacciones"
          ),
          const SizedBox(height: 10),
          CardClientTrans(),
          ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.arrow_downward, color: Colors.white),
                ),
                title: Text('Transferencia a Juan Pérez'),
                subtitle: Text('10 de junio de 2024'),
                trailing: Text('-\$50.00', style: TextStyle(color: Colors.red)),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.arrow_upward, color: Colors.white),
                ),
                title: Text('Pago recibido de María López'),
                subtitle: Text('9 de junio de 2024'),
                trailing: Text(
                  '+\$100.00',
                  style: TextStyle(color: Colors.green),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.arrow_downward, color: Colors.white),
                ),
                title: Text('Transferencia a Carlos Gómez'),
                subtitle: Text('8 de junio de 2024'),
                trailing: Text('-\$30.00', style: TextStyle(color: Colors.red)),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.arrow_upward, color: Colors.white),
                ),
                title: Text('Pago recibido de Ana Martínez'),
                subtitle: Text('7 de junio de 2024'),
                trailing: Text(
                  '+\$75.00',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
