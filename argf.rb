# Get all lines of all files
ARGF.each { | line |
  puts line
}

# Get all lines of all files, one by one using file handles
puts ARGF.filename
ARGF.file.each_line { |line|  
  puts line
}
ARGF.close
puts ARGF.filename
ARGF.file.each_line { |line|
  puts line
}
ARGF.close