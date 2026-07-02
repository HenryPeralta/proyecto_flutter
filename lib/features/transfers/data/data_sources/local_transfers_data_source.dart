import 'package:proyecto_flutter/features/transfers/domain/entities/transfer_account.dart';

class LocalTransfersDataSource {
  List<TransferAccount> getSourceAccounts() {
    return const [
      TransferAccount(value: '35278485', label: 'Num. Cuenta: 35278485'),
      TransferAccount(value: '84739201', label: 'Num. Cuenta: 84739201'),
      TransferAccount(
        value: 'Visa: 4782 4567 7896 3456',
        label: 'Visa: **** **** **** 3456',
      ),
      TransferAccount(
        value: '4896 1234 8745 0012',
        label: 'Visa:  **** **** **** 0012',
      ),
    ];
  }

  List<TransferAccount> getDestinationAccounts() {
    return const [
      TransferAccount(
        value: '35278485',
        label: 'Carlos Lopez - 35278485 - BI',
      ),
      TransferAccount(
        value: '84739201',
        label: 'Maria Reyes -  84739201 - BAM',
      ),
      TransferAccount(
        value: 'Visa: 4782 4567 7896 3456',
        label: 'Karla Hernandez - 578556881 - BANCO PROMERICA',
      ),
      TransferAccount(
        value: '4896 1234 8745 0012',
        label: 'Cristina Medina - 85525885 - BI',
      ),
    ];
  }

  List<String> getTransferTypes() {
    return const [
      'A mis cuentas',
      'A otros bancos',
      'A tarjetas',
      'A otros usuarios',
    ];
  }
}
