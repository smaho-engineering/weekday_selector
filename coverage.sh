#!/usr/bin/env bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html

echo 'Run the following command to open the coverage report in your browser'
echo '> open coverage/html/index.html'