#!/bin/bash
flutter run \
  --dart-define=FLAVOR=uat \
  --dart-define=BASE_URL=https://api-uat.example.com \
  --dart-define=APP_NAME="Demo UAT"
