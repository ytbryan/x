require "xxxxx/version"
require 'thor'
require "koala"
require "twitter"

module Xxxxx
  class Base < Thor
    check_unknown_options!
    package_name 'x'
    default_task :list

    desc :setup, ''
    def setup
      FileUtils.touch(".x/setup.yml")
    end

    desc :list, 'list the project alias (short alias: p)'
    def list()
      puts "hello world"
    end

    desc :draft, 'see what you put in the drafts'
    def draft()
      puts "see what you put in the drafts"
    end

    desc :post, 'see what you put in the drafts'
    def post()
      puts "post to twitter and facebook"
    end

    desc :save, 'see what you put in the drafts'
    def save()
      puts "see what you put in the drafts"
    end

    desc :config, 'set the config file'
    def config()
      puts "set the config file"
      puts "x config --facebook --secret "
      puts "x config --twitter --secret "
    end


    private

    def setup

      @graph = Koala::Facebook::API.new("")
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ""
        config.consumer_secret     = ""
        config.access_token        = ""
        config.access_token_secret = ""
      end
    end


  end
end
