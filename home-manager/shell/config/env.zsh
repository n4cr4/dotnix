# Environment variables

# Load Anthropic API key if file exists
if [[ -f "$HOME/.anthropic_api_key" ]]; then
  export ANTHROPIC_API_KEY="$(cat "$HOME/.anthropic_api_key" | tr -d '\n')"
fi
