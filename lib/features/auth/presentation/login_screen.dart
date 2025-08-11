import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_controller.dart';
import '../../../core/utils/logo_utils.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authControllerProvider);
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo
              Center(
                child: Image.asset(
                  LogoUtils.getLogo(
                      isDarkMode: true,
                      isHorizontal: true
                  ),
                  height: 120,
                ),
              ),
              const SizedBox(height: 48),
              
              // Welcome text
              const Text(
                'Welcome to Sinful Delights',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              
              const Text(
                'Sign in to access your private chef experience',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              
              // Google Sign-In Button
              ElevatedButton.icon(
                onPressed: authController.isLoading 
                    ? null 
                    : () => ref.read(authControllerProvider.notifier).signInWithGoogle(),
                icon: authController.isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Image.asset(
                        'assets/icons/google_logo.png',
                        height: 20,
                        width: 20,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.login,
                            color: Colors.white,
                          );
                        },
                      ),
                label: Text(
                  authController.isLoading ? 'Signing in...' : 'Continue with Google',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B0000), // Sinful Delights red
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 2,
                ),
              ),
              
              // Error handling
              if (authController.hasError) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
                  ),
                  child: Text(
                    'Sign in failed. Please try again.',
                    style: TextStyle(
                      color: Colors.red[400],
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
              
              const SizedBox(height: 48),
              
              // Privacy notice
              Text(
                'By continuing, you agree to our Terms of Service and Privacy Policy.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}