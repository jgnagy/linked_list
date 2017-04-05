# LinkedList

A Pure-ruby (Doubly) Linked List implementation.

## Installation

I can't imagine why you would...

## Usage

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

The bulk of the usefulness comes from doing something like:

```ruby
include LinkedList

list = List.new
list.push('a test')
list.push('woo hoo!')
list.push('another test')
list.size            # => 3

# most methods return a Node
list.first.class     # => LinkedList::Node
# so you'll probably need to use `datum` to get to value for the Node
list.first.datum     # => "a test"

# lists allow accessing arbitrary indexes like Arrays
list[1].datum        # => "woo hoo!"

# they also support selecting a random node
list.random.datum    # => "a test"

# you can also sort (by default it uses the node's value)
list.last.datum      # => "another test"
list.sort.last.datum # => "woo hoo!"

# it is also possible to take the first n elements
list.take(2).size    # => 2

# and map (here we grab the length of each datum)
list.map {|node| node.datum.length }  # => [6, 8, 12]

# you can also remove items from the list
list.pop             # => "another test"
list.size            # => 2
```

## Contributing

Don't bother.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
