// login_page.dart
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false; // New state variable for password visibility

 
  void _login() {
    // In a real application, you would validate credentials here
    // For this example, we'll just navigate to the main page
    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');

    // Navigate to the main page and replace the current route
    Navigator.pushReplacementNamed(context, '/main');
  }

  void _signInWithGoogle() {
    // Placeholder for Google Sign-In logic
    print('Attempting to sign in with Google...');
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/main');
    });
  }

  void _signInWithApple() {
    // Placeholder for Apple Sign-In logic
    print('Attempting to sign in with Apple...');
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/main');
    });
  }

  void _signInWithFacebook() {
    // Placeholder for Facebook Sign-In logic
    print('Attempting to sign in with Facebook...');
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/main');
    });
  }

  void _signInWithPhone() {
    // Placeholder for Phone Sign-In logic
    print('Attempting to sign in with Phone Number...');
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/main');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background to black
      appBar: AppBar(
        title: const Text(
          'Login Page',
          style: TextStyle(color: Colors.white), // AppBar title color
        ),
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0,
        foregroundColor: Colors.white, // Icons and back button color
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Welcome Back!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color for black background
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Sign in to continue',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70, // Slightly transparent white
                ),
              ),
              const SizedBox(height: 40),
              // Email Input
              _buildGlassyTextField(
                controller: _emailController,
                labelText: 'Email',
                hintText: 'Enter your email',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              // Password Input
              _buildGlassyTextField(
                controller: _passwordController,
                labelText: 'Password',
                hintText: 'Enter your password',
                icon: Icons.lock,
                obscureText: !_isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.white70,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              const SizedBox(height: 30),
              // Login Button
              _buildGlassyElevatedButton(
                onPressed: _login,
                text: 'Login',
                backgroundColor: Colors.white, // White button
                foregroundColor: Colors.black, // Black text
              ),
              const SizedBox(height: 30),
              const Text(
                'Or connect with',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              const SizedBox(height: 20),
              // Login with Phone Button
              _buildGlassyElevatedButton(
                onPressed: _signInWithPhone,
                text: 'Login with Phone',
                icon: Icons.phone,
                backgroundColor: Colors.white, // White button
                foregroundColor: Colors.black, // Black text
              ),
              const SizedBox(height: 15),
              // Google Login Button
              _buildGlassyOutlinedButton(
                onPressed: _signInWithGoogle,
                text: 'Login with Google',
                imageUrl:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png',
              ),
              const SizedBox(height: 15),
              // Apple Login Button
              _buildGlassyOutlinedButton(
                onPressed: _signInWithApple,
                text: 'Login with Apple',
                imageUrl:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/1000px-Apple_logo_black.svg.png',
                imageColor: Colors.black, // Apple logo is often black
              ),
              const SizedBox(height: 15),
              // Facebook Login Button
              _buildGlassyOutlinedButton(
                onPressed: _signInWithFacebook,
                text: 'Login with Facebook',
                imageUrl:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Facebook_f_logo_%282019%29.svg/1024px-Facebook_f_logo_%282019%29.svg.png',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build glossy text fields
  Widget _buildGlassyTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(
          0.1,
        ), // Semi-transparent white for glass effect
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.05), // Subtle inner shadow
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 0),
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.1), // Outer glow effect
            blurRadius: 15,
            spreadRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white), // Text input color
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          labelStyle: const TextStyle(color: Colors.white70),
          hintStyle: const TextStyle(color: Colors.white54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(icon, color: Colors.white70),
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 16,
          ),
        ),
      ),
    );
  }

  // Helper method to build glossy elevated buttons
  Widget _buildGlassyElevatedButton({
    required VoidCallback onPressed,
    required String text,
    IconData? icon,
    Color backgroundColor = Colors.white,
    Color foregroundColor = Colors.black,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style:
          ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            elevation: 0, // Remove default elevation for custom shadow
            shadowColor: Colors.transparent, // Remove default shadow color
          ).copyWith(
            // Custom overlay color for tap effect (glowing)
            overlayColor: MaterialStateProperty.resolveWith<Color?>((
              Set<MaterialState> states,
            ) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.white.withOpacity(0.2); // Glow on press
              }
              return null; // Defer to the widget's default.
            }),
            // Custom shadow for glow effect
            shadowColor: MaterialStateProperty.resolveWith<Color?>((
              Set<MaterialState> states,
            ) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.white.withOpacity(0.5); // Stronger glow on press
              }
              return Colors.white.withOpacity(0.2); // Subtle glow normally
            }),
            elevation: MaterialStateProperty.resolveWith<double?>((
              Set<MaterialState> states,
            ) {
              if (states.contains(MaterialState.pressed)) {
                return 10; // More elevation on press
              }
              return 5; // Default elevation
            }),
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (icon != null) Icon(icon, color: foregroundColor),
          if (icon != null) const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: foregroundColor,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build glossy outlined buttons
  Widget _buildGlassyOutlinedButton({
    required VoidCallback onPressed,
    required String text,
    String? imageUrl,
    Color? imageColor,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      style:
          OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            side: BorderSide(
              color: Colors.white.withOpacity(0.3),
              width: 1,
            ), // Semi-transparent border
            backgroundColor: Colors.white.withOpacity(
              0.1,
            ), // Semi-transparent white for glass effect
            foregroundColor: Colors.white, // Text color
            elevation: 0, // Remove default elevation for custom shadow
            shadowColor: Colors.transparent, // Remove default shadow color
          ).copyWith(
            // Custom overlay color for tap effect (glowing)
            overlayColor: MaterialStateProperty.resolveWith<Color?>((
              Set<MaterialState> states,
            ) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.white.withOpacity(0.2); // Glow on press
              }
              return null; // Defer to the widget's default.
            }),
            // Custom shadow for glow effect
            shadowColor: MaterialStateProperty.resolveWith<Color?>((
              Set<MaterialState> states,
            ) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.white.withOpacity(0.5); // Stronger glow on press
              }
              return Colors.white.withOpacity(0.2); // Subtle glow normally
            }),
            elevation: MaterialStateProperty.resolveWith<double?>((
              Set<MaterialState> states,
            ) {
              if (states.contains(MaterialState.pressed)) {
                return 10; // More elevation on press
              }
              return 5; // Default elevation
            }),
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (imageUrl != null)
            Image.network(
              imageUrl,
              height: 24.0,
              color:
                  imageColor, // Apply color if specified (e.g., for Apple logo)
            ),
          if (imageUrl != null) const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    );
  }
}
