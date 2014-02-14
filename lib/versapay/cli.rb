require "thor"
module Versapay
  class CLI < Thor
    class_option :demo, type: :boolean

    desc "send AMOUNT EMAIL [MESSAGE] (--demo)", "send AMOUNT to EMAIL with MESSAGE"
    def send(amount, email, message=nil)
      client = Client.new(
        ENV.fetch('VERSAPAY_TOKEN'),
        ENV.fetch('VERSAPAY_KEY'),
        options[:demo] ? 'demo' : 'secure'
      )

      human_amount = "%.2f" % amount.to_f
      answer = ask "Send $#{human_amount} to #{email} ?"

      say "Running in demo environment..." if options[:demo]

      if answer.downcase.strip =~ /^y(es)?$/
        say "Sending $#{human_amount} to <#{email}>..."
        response = client.send(amount, email, message)
        puts "Success! Transaction token: #{response.fetch('token')}"
      end
    end
  end
end
