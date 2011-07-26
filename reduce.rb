word_frequency = File.new("alice_chapter_1.txt").each_line.reduce({}) { | frequency, line | 
  line.split(' ').each { | word |
    word = word.upcase[/(\A[a-zA-Z][a-zA-Z\-']*)[^a-zA-Z]?\z/, 1]
    frequency[word] = ((frequency[word].nil?) ? 0 : frequency[word] + 1) unless word.nil?
  }
  frequency
}

word_frequency.sort {|a,b| b[1] <=> a[1]}.each { | frequency |
  puts "#{frequency[0]} #{frequency[1]}"
}

highest_frequency = word_frequency.reduce { | highest, current | 
  (current[1] > highest[1]) ? current : highest
}

puts "Highest frequency word is: '#{highest_frequency[0]}' with #{highest_frequency[1]} occurences"