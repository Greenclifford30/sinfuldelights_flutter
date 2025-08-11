class LogoUtils {
  // Horizontal Logo Paths
  static  String horizontalLogoDark = _getPlatformPath('SinfulDelights_HorizontalLogo-black.png');
  static  String horizontalLogoLight = _getPlatformPath('SinfulDelights_HorizontalLogo-white.png');

  // Stacked Logo Paths
  static String stackedLogoDark = _getPlatformPath('SinfulDelights_StackedLogo-black.png');
  static  String stackedLogoLight = _getPlatformPath('SinfulDelights_StackedLogo-white.png');

  // Platform-specific path resolver
  static String _getPlatformPath(String fileName) {
    // Determine the correct path based on platform
    const bool isWeb = identical(0, 0.0);
    return isWeb ? 'assets/logo/$fileName' : 'assets/logo/$fileName';
  }

  /// Get the appropriate logo based on theme and logo type
  static String getLogo({
    required bool isDarkMode, 
    bool isHorizontal = true,
  }) {
    if (isHorizontal) {
      return isDarkMode ? horizontalLogoLight : horizontalLogoDark;
    } else {
      return isDarkMode ? stackedLogoLight : stackedLogoDark;
    }
  }
}