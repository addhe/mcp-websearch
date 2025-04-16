curl -X POST \
  https://us-central1-awanmasterpiece.cloudfunctions.net/websearch \
  -H "Content-Type: application/json" \
  -d '{
    "name": "get_docs",
    "parameters": {
      "query": "berita terkini",
      "library": "detik"
    }
  }'