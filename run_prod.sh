#!/bin/bash
flutter run \
  --dart-define=FLAVOR=prod \
  --dart-define=BASE_URL=https://api.example.com \
  --dart-define=APP_NAME="Demo"
