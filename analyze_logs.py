# analyze_logs.py
import os
import openai

def analyze_logs(file_path):
    openai.api_key = os.getenv('OPENAI_API_KEY')

    with open(file_path, 'r') as file:
        log_text = file.read()

    response = openai.Completion.create(
        engine="text-davinci-002",
        prompt="Analyze this log and summarize the errors: \n" + log_text,
        max_tokens=150
    )

    return response.choices[0].text.strip()

if __name__ == "__main__":
    import sys
    log_file_path = sys.argv[1]  # Erwartet den Pfad zur Logdatei als erstes Argument
    print(analyze_logs(log_file_path))
