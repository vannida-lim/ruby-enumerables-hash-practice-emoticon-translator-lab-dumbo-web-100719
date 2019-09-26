# require modules here
require "yaml" 

def load_library(filepath)
  # code goes here
  emoticons = YAML.load_file(filepath)

  result = {}
  result[:get_meaning] = {}
  result[:get_emoticon] = {}
  emoticons.each do |meaning, array_emojis|
    english_emojis = array_emojis[0]
    japanese_emojis = array_emojis[1]
    result[:get_meaning][japanese_emojis] = meaning
    result[:get_emoticon][english_emojis] = japanese_emojis 
  end
  return result
end

def get_japanese_emoticon(filepath, english_emoticon_to_translate)
  # code goes here
  result = load_library(filepath)
  result[:get_emoticon].each do |key, value|
    if key == english_emoticon_to_translate
      return value
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(filepath, japanese_emoticon_to_translate)
  # code goes here
  result = load_library(filepath)
  result[:get_meaning].each do |key, value|
    if key == japanese_emoticon_to_translate
      return value
    end
  end
  return "Sorry, that emoticon was not found"
end

