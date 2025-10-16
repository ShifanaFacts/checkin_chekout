import 'package:flutter/material.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  final TextEditingController _urlController = TextEditingController();
  String _savedUrl = '';

  void _saveUrl() {
    setState(() {
      _savedUrl = _urlController.text;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('URL saved: $_savedUrl')));
    });
  }

  void _logout() {
    // Implement logout logic here
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Logged out')));
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // 👈 This forces the title to be centered
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add URL',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: 'Enter URL',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.link),
                errorText:
                    _urlController.text.isNotEmpty &&
                        !Uri.parse(_urlController.text).isAbsolute
                    ? 'Please enter a valid URL'
                    : null,
              ),
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveUrl,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Save URL',
                style: TextStyle(color: Colors.white),
              ),
            ),
            if (_savedUrl.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                'Saved URL: $_savedUrl',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
            const Spacer(),
            ElevatedButton(
              onPressed: _logout,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
