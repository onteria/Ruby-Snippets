# Get array of all command line arguments
puts ARGF.argv.inspect

# Get all lines of all files
ARGF.each { | line |
  puts line
}

# Get all lines of all files, one by one using file handles
while !ARGF.file.closed?
  puts "===== Current File: #{ARGF.filename} ====="
  ARGF.file.each_line { |line|
    puts line
  }
  ARGF.close
end