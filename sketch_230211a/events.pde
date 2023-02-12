class event {
  String dialog;
  int triggerId;
  int nextTrigger;
  event(String dialog_, int triggerId_, int nextTrigger_) {
    dialog = dialog_;
    triggerId = triggerId_;
    nextTrigger = nextTrigger_;
  }
  event(String dialog_, int triggerId_) {
    dialog = dialog_;
    triggerId = triggerId_;
    nextTrigger = -1;
  }
}
