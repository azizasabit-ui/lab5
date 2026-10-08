import 'package:flutter/material.dart';

import 'home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() =>
      _RegistrationScreenState();
}

class _RegistrationScreenState
    extends State<RegistrationScreen> {
  // GlobalKey for the Form
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>();

  // Controllers
  final TextEditingController _nameController =
      TextEditingController();

  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // State variables
  bool _acceptTerms = false;

  String _selectedRole = 'Student';

  bool _showTermsError = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }
void _register() {
  final bool isFormValid =
      _formKey.currentState?.validate() ?? false;

  setState(() {
    _showTermsError = !_acceptTerms;
  });

  if (!isFormValid || !_acceptTerms) {
    return;
  }

  print('===== LUMI REGISTRATION =====');
  print('Full Name: ${_nameController.text}');
  print('Email: ${_emailController.text}');
  print('Password: ${_passwordController.text}');
  print(
    'Confirm Password: ${_confirmPasswordController.text}',
  );
  print('Role: $_selectedRole');
  print('Terms accepted: $_acceptTerms');
  print('==============================');

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        'Registration successful! Welcome to LUMI ✨',
      ),
      duration: Duration(seconds: 1),
    ),
  );

  Future.delayed(const Duration(seconds: 1), () {
    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 600,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),

                    const Text(
                      'Create your LUMI account ✨',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Set up your profile to start exploring '
                      'beauty and skincare products.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 28),

                    // FULL NAME
                    const Text(
                      'Full Name',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextFormField(
                      controller: _nameController,
                      autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: 'Enter your full name',
                        prefixIcon:
                            const Icon(Icons.person_outline),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(14),
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty) {
                          return 'Full Name is required';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 18),

                    // EMAIL
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextFormField(
                      controller: _emailController,
                      keyboardType:
                          TextInputType.emailAddress,
                      autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: 'name@example.com',
                        prefixIcon:
                            const Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(14),
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty) {
                          return 'Email is required';
                        }

                        if (!value.contains('@') ||
                            !value.contains('.')) {
                          return 'Email must contain @ and .';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 18),

                    // PASSWORD
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: 'Minimum 6 characters',
                        prefixIcon:
                            const Icon(Icons.lock_outline),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(14),
                        ),
                      ),
                      onChanged: (_) {
                        // Rebuild so confirm password
                        // reacts in real time.
                        setState(() {});
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty) {
                          return 'Password is required';
                        }

                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 18),

                    // CONFIRM PASSWORD
                    const Text(
                      'Confirm Password',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextFormField(
                      controller:
                          _confirmPasswordController,
                      obscureText: true,
                      autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: 'Repeat your password',
                        prefixIcon:
                            const Icon(Icons.lock_reset),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(14),
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty) {
                          return 'Please confirm your password';
                        }

                        if (value !=
                            _passwordController.text) {
                          return 'Passwords do not match';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 18),

                    // ROLE
                    const Text(
                      'Role',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

                    DropdownButtonFormField<String>(
                      value: _selectedRole,
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.badge_outlined),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(14),
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'Student',
                          child: Text('Student'),
                        ),
                        DropdownMenuItem(
                          value: 'Teacher',
                          child: Text('Teacher'),
                        ),
                        DropdownMenuItem(
                          value: 'Developer',
                          child: Text('Developer'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }

                        setState(() {
                          _selectedRole = value;
                        });
                      },
                    ),

                    const SizedBox(height: 12),

                    // TERMS AND CONDITIONS
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      value: _acceptTerms,
                      controlAffinity:
                          ListTileControlAffinity.leading,
                      title: const Text(
                        'I accept the Terms and Conditions',
                      ),
                      onChanged: (value) {
                        setState(() {
                          _acceptTerms = value ?? false;

                          if (_acceptTerms) {
                            _showTermsError = false;
                          }
                        });
                      },
                    ),

                    if (_showTermsError)
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 12,
                          bottom: 8,
                        ),
                        child: Text(
                          'You must accept the Terms and Conditions',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),

                    const SizedBox(height: 18),

                    // REGISTER BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: _register,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}