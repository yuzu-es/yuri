require 'slop'
require 'stringio'

class Yuri
  def initialize(args)
    parse(args)
  end

  def parse(args)
    opts = Slop.parse do |o|
      puts Slop::VERSION

      o.string '-h', '--host', 'a hostname'
      o.integer '--port', 'custom port', default: 80
      o.bool '-v', '--verbose', 'enable verbose mode'
      o.bool '-q', '--quiet', 'suppress output (quiet mode)'
      o.on '--version', 'print the version' do
        puts Slop::VERSION
        exit
      end
    end


    opts[:host]   #=> 192.168.0.1
    opts.verbose? #=> true
    opts.quiet?   #=> false

    opts.to_hash  #=> { host: "192.168.0.1", port: 80, verbose: true, quiet: false }
  end

  def old(args)    
    options = {:default => "args"}
    
    ARGV.options do |opts|
      opts.banner = "Usage: ruby #{File.basename($PROGRAM_NAME)} [OPTIONS] OTHER_ARGS"
      
      opts.separator ""
      opts.separator "Options are:"
      
      opts.on('--elb Elastic-load-balancer', 'REQUIRED: Name of the Elastic-load-balancer that you want to add this security group to') do |elb|
        opts.elb << elb
        puts elb
      end

      opts.on('-l', '--list File-with-IPs', 'REQUIRED: File containing list of IPs to whitelist') do |ips|
        opts.ips << ips
        puts ips
      end

            
      opts.on( "-h", "--help", "Show this message." ) do
        puts opts
        exit
      end
      
      begin
        opts.parse!
      rescue
        # puts opts
        if not opts.ips
          puts "List of IPs is required"
        end
        exit
      end
    end
  end
end
