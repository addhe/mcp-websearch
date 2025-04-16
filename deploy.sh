#!/bin/bash

# Exit on error
set -e

echo "🚀 Starting deployment process..."

# Check if SERPER_API_KEY is set
if [ -z "$SERPER_API_KEY" ]; then
    echo "❌ Error: SERPER_API_KEY environment variable is not set"
    echo "Please set it first:"
    echo "export SERPER_API_KEY=your_api_key_here"
    exit 1
fi

# Enable required APIs
echo "📡 Enabling required Google Cloud APIs..."
gcloud services enable cloudfunctions.googleapis.com
gcloud services enable cloudbuild.googleapis.com

# Deploy the function
echo "🔄 Deploying function to Google Cloud..."
gcloud functions deploy websearch \
    --runtime python311 \
    --trigger-http \
    --entry-point cloud_function_handler \
    --allow-unauthenticated \
    --set-env-vars SERPER_API_KEY=$SERPER_API_KEY

echo "✅ Deployment completed successfully!"
echo "Your function is now deployed and ready to use."