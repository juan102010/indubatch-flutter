class ExtractProtocol {
  static String removeProtocol(String url) {
    String protocolSecure = "https://";
    String protocolNoSecure = "http://";
    if (url.startsWith(protocolSecure)) {
      return url.substring(protocolSecure.length);
    } else if (url.startsWith(protocolNoSecure)) {
      return url.substring(protocolNoSecure.length);
    } else {
      return url;
    }
  }
}
