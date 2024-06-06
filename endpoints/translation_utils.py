from googletrans import Translator

def translate_text(text, src='auto', dest='en'):
    translator = Translator()
    translated = translator.translate(text, src=src, dest=dest)
    return translated.text
