class DomainInfo {
  final String baseUrl;
  final String logoUrl;

  DomainInfo(this.baseUrl, this.logoUrl);

  @override
  String toString() {
    return 'DomainInfo{baseUrl: $baseUrl, logoUrl: $logoUrl}';
  }
}
