import 'package:flutter/material.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patient App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Map<String, String> doctorCredentials = {
    'gokul@gmail.com': 'Gokul123',
    'kashmeera@gmail.com': 'Kashmeera@123',
    'nivin@gmail.com': 'Nivin123',
  };

  Map<String, String> patientCredentials = {
    'patient123': 'Patient@123',
  };

  void _login(String role) {
    String enteredUsername = usernameController.text.trim();
    String enteredPassword = passwordController.text.trim();

    if (role == 'doctor') {
      if (doctorCredentials.containsKey(enteredUsername) &&
          doctorCredentials[enteredUsername] == enteredPassword) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DoctorMenuPage()),
        );
      } else {
        _showErrorDialog();
      }
    } else if (role == 'patient') {
      if (patientCredentials.containsKey(enteredUsername) &&
          patientCredentials[enteredUsername] == enteredPassword) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PatientMenuPage()),
        );
      } else {
        _showErrorDialog();
      }
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Invalid username or password'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _login('doctor');
              },
              child: Text('Login as Doctor'),
            ),
            ElevatedButton(
              onPressed: () {
                _login('patient');
              },
              child: Text('Login as Patient'),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPatientPage()),
                );
              },
              child: Text('Add a new patient'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to add diagnosis page
              },
              child: Text('Add diagnosis to a patient'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to view and update patient details page
              },
              child: Text('View and update patient details'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to send messages page
              },
              child: Text('Write and send messages to patients'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddPatientPage extends StatelessWidget {
  final TextEditingController patientNumberController = TextEditingController();
  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController diagnosisController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Patient'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: patientNumberController,
              decoration: InputDecoration(labelText: 'Patient Number'),
            ),
            TextFormField(
              controller: patientNameController,
              decoration: InputDecoration(labelText: 'Patient Name'),
            ),
            TextFormField(
              controller: diagnosisController,
              decoration: InputDecoration(labelText: 'Diagnosis'),
            ),
            TextFormField(
              controller: dobController,
              decoration: InputDecoration(labelText: 'Date of Birth'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add logic to save patient data
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class PatientMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to view personal information page
              },
              child: Text('View Personal Information'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to view diagnosis page
              },
              child: Text('View Diagnosis'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to view messages page
              },
              child: Text('View Messages and Reply'),
            ),
          ],
        ),
      ),
    );
  }
}
