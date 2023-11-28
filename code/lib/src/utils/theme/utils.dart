String checkQuestionMark(String? text) {
  if (text == null) {
    return '';
  }
  if (text.endsWith('?')) {
    return '';
  }
  return '?';
}
