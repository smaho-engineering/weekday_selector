#!/usr/bin/env bash

pub global activate test_coverage

pub global run test_coverage

bash <(curl -s https://codecov.io/bash)
