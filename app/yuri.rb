require 'slop'
require 'stringio'

class Yuri
  def initialize(args)
    parse(args)
  end

  def parse(args)
    opts = Slop::Options.new
    opts.banner = "Usage: ruby #{File.basename($PROGRAM_NAME)} [OPTIONS] OTHER_ARGS"
    opts.separator ""
    opts.separator "Options are:"
    
    opts.string '-e', '--elb Elastic-load-balancer', 'REQUIRED: Name of the Elastic-load-balancer that you want to add this security group to'
    opts.string '-l', '--list File-with-IPs', 'REQUIRED: File containing list of IPs to whitelist'
    opts.on '--version', 'print the version' do
      puts Slop::VERSION
      exit
    end

    parser = Slop::Parser.new(opts)
    puts args
    result = parser.parse(args)
  end

end
