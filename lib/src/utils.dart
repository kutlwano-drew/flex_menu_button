void debugLog(String message) {
  assert(() {
    print('[MenuDropdown] $message');
    return true;
  }());
}
