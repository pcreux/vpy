# Vpy - The Versapay Gem

Send money via Versapay from the CLI


## Send money from the command line

Install it:

    $ gem install vpy

Set the environment variables `VERSAPAY_KEY` and `VERSAPAY_TOKEN`.

Run:

    $ versapay send 10.23 bob@example.com

... with a message:

    $ versapay send 10.23 bob@example.com "Here is some cash"

... against demo environment:

    $ versapay send 10.23 bob@example.com --demo

## Send money from ruby

```ruby
  require 'vpy'

  client = Versapay.new(VERSAPAY_TOKEN, VERSAPAY_KEY)
  client.send(10.23, 'bob@example.com')
```

## License

MIT
