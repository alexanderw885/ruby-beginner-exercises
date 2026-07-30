def substrings(str, dict)
  dict.reduce(Hash.new()) do |hash, word|
    num_matches = str.downcase.scan(word).length
    hash[word] = num_matches if num_matches > 0
    hash
  end
end


  dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
  p substrings("below", dictionary)
  p substrings("Howdy partner, sit down! How's it going?", dictionary)
