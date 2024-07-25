class TokenProviderException implements Exception {
  const TokenProviderException({
    this.details = 'UNKNOWN',
    this.message = 'An unknown exception occurred.',
  });

  /// A human-readable details string about the error.
  ///
  /// Avoid to show this to the user
  final String details;

  /// A human-readable details string about the error.
  ///
  /// This is fine to show it to the user
  final String message;
}
