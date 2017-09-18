require 'swift'
require 'logger'
require 'pathname'

require 'swift/adapter/postgres'

if (database_url = ENV['DATABASE_URL'])
  user, password, host, port, db = database_url.match(/^postgres:\/\/(.+?):(.+?)@(.+?):(.+?)\/(.+?)$/).captures
  puts "user=#{user.inspect}, password=#{password.inspect}, host=#{host.inspect}, port=#{port.inspect} db=#{db.inspect}"
  Swift.setup :default, Swift::Adapter::Postgres, db: db, user: user, password: password, host: host #, port: port
else
  Swift.setup :default, Swift::Adapter::Postgres, db: "chuck"
end

module Chuck
  class << self
    def root
      @root ||= Pathname.new(__FILE__).dirname + '..'
    end

    def logger
      @logger ||= Logger.new($stderr, 0)
    end

    def logger= logger
      @logger = logger
    end

    def log_error e
      logger.error e.message
      logger.error e.backtrace.take(20).join($/)
    end
  end # self
end # Chuck

require 'uri'

class URI::HTTP
  def relative_uri
    (fragment && fragment.size > 0 ? request_uri + '#' + fragment : request_uri).sub %r{^/}, ''
  end
end
