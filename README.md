This SDK simplifies the process of raising and managing tickets, allowing users to report issues and track their resolutions efficiently.

## Features
    Raise new tickets
    Categorize tickets
    Track ticket status
Getting Started
Installation
Add this to your package's pubspec.yaml file:
``` yaml
dependencies:
  ticket_management_sdk: ^1.0.0
```

Then run:   
``` bash
flutter pub get
```
Usage
```dart
import 'package:ticket_management_sdk/ticket_management_sdk.dart';

void main() {
  TicketManager ticketManager = TicketManager();
  ticketManager.raiseTicket('Issue Title', 'Issue Description');
}
```
Additional Information
For more details, visit our documentation. To contribute or file issues, check our GitHub repo.