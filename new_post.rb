#!/bin/env ruby
require 'optparse'
require 'ostruct'


class ParseOptions
  def self.parse(args)
    options = OpenStruct.new
    options.title = "Untitled"

    opts = OptionParser.new do |opts|
      opts.banner = "Usage: new_post.rb [options]"
      opts.separator ""
      opts.separator "Options:"

      opts.on("-t", "--title TITLE", "Supply Post Title") do |t|
        options.title = t
      end

      opts.on("-c", "--content <file>", "Supply Post Content") do |c|
        options.content = c
      end
    end

    opts.on_tail("-h", "--help", "Show this message") do
      puts opts
      exit
    end

    opts.parse!(args)
    options

  end
end

options = ParseOptions.parse(ARGV)

if options.content == nil
  p "File name required."
  exit
end

p options.title
