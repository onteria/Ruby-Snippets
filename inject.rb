# Obtain the highest frequency word of files listed on the command line
def highest_frequency(handle)
  handle.each_line.inject({}) { | frequency, line | 
    line.split(' ').each { | word |
      word = word.upcase[/(\A[a-zA-Z][a-zA-Z\-']*)[^a-zA-Z]?\z/, 1]
      frequency[word] = ((frequency[word].nil?) ? 0 : frequency[word] + 1) unless word.nil?
    }
    frequency
  }.inject { | highest, current | 
    (current[1] > highest[1]) ? current : highest
  }
end

begin
  puts "===== Current File: #{ARGF.filename} ====="
  highest = highest_frequency(ARGF.file)
  puts "Highest frequency word is: '#{highest[0]}' with #{highest[1]} occurrences"
  # Skip close for STDIN
  ARGF.close unless ARGF.filename == '-'
end while (!ARGF.file.closed? and ARGF.filename != '-')

# Non-Inject version
#frequency = {}
#File.new("alice_chapter_1.txt").each_line { | line | 
#  line.split(' ').each { | word |
#    word = word.upcase[/(\A[a-zA-Z][a-zA-Z\-']*)[^a-zA-Z]?\z/, 1]
#    frequency[word] = ((frequency[word].nil?) ? 0 : frequency[word] + 1) unless word.nil?    
#  }
#}
#puts frequency.inspect

# Inject version
#highest_frequency = File.new("alice_chapter_1.txt").each_line.inject({}) { | frequency, line | 
#  line.split(' ').each { | word |
#    word = word.upcase[/(\A[a-zA-Z][a-zA-Z\-']*)[^a-zA-Z]?\z/, 1]
#    frequency[word] = ((frequency[word].nil?) ? 0 : frequency[word] + 1) unless word.nil?
#  }
#  frequency
#}

# Print out the frequency of words with a frequency of 5 or more, highest to lowest:
#File.new("alice_chapter_1.txt").each_line.inject({}) { | frequency, line | 
#  line.split(' ').each { | word |
#    word = word.upcase[/(\A[a-zA-Z][a-zA-Z\-']*)[^a-zA-Z]?\z/, 1]
#    frequency[word] = ((frequency[word].nil?) ? 0 : frequency[word] + 1) unless word.nil?
#  }
#  frequency
#}.sort {|a,b| b[1] <=> a[1]}.reject { | x | x[1] < 5 }.each { | frequency |
#  puts "#{frequency[0]} #{frequency[1]}"
#}

# Find the highest frequency:
#highest_frequency = File.new("alice_chapter_1.txt").each_line.inject({}) { | frequency, line | 
#  line.split(' ').each { | word |
#    word = word.upcase[/(\A[a-zA-Z][a-zA-Z\-']*)[^a-zA-Z]?\z/, 1]
#    frequency[word] = ((frequency[word].nil?) ? 0 : frequency[word] + 1) unless word.nil?
#  }
#  frequency
#}.inject { | highest, current | 
#  (current[1] > highest[1]) ? current : highest
#}

#puts "Highest frequency word is: '#{highest_frequency[0]}' with #{highest_frequency[1]} occurrences"