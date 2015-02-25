require 'slop'

opts = Slop.parse do |o|
  o.string '-h', '--host', 'a hostname'
  o.integer '--port', 'custom port', default: 80
  o.bool '-v', '--verbose', 'enable verbose mode'
  o.bool '-q', '--quiet', 'suppress output (quiet mode)'
  o.on '--version', 'print the version' do
    puts Slop::VERSION
    exit
  end
end

puts ARGV #=> -v --host 192.168.0.1

puts opts[:host]   #=> 192.168.0.1
puts opts.verbose? #=> true
puts opts.quiet?   #=> false

puts opts.to_hash  #=> { host: "192.16