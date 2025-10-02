#!/bin/bash

if [ ! -f .env ]; then
    echo "Error: .env file not found!"
    echo "Please copy .env.example to .env and ask your team lead for the API key"
    exit 1
fi

API_KEY=$(grep OPENAI_API_KEY .env | cut -d '=' -f2)

echo "Translating to Serbian..."
dart run slang_gpt apply --source=en --target=sr --api-key=$API_KEY

echo "Generating Dart files..."
dart run slang

echo "Done!"