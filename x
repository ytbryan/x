#!/usr/bin/env ruby
require "thor"
require "koala"
require "twitter"

class X < Thor
  include Thor::Actions
  check_unknown_options!
  desc "post STATUS", "post to twitter and facebook"
  # method_option :delete, :aliases => "-d", :desc => "Delete the file after parsing it"
  def post status
    u(status)
  end

  #methods
  def reply
    
  end

  def share
    
  end

  def fav
    
  end

  # desc "u STATUS", "update twitter and facebook"
  # def u status
  #   puts "post to #{facebook(status)} and #{twitter(status)}"
  # end
  # 
  # desc "feed", "show timeline for twitter"
  # def feed
  #   twitter_feed()
  # end

  private

  def setup_facebook
    @graph = Koala::Facebook::API.new("CAALThqTJw7UBAFMGjwxMYXdKNF80CXG8gW8jcIHTGkodoj2HUYKJznU0TtQvkk3iHRu23ESMbzGSNS256fZAZBTRtfRvNMvZAj6nssXGmZBJaeuZAauP2wXcJguDFWgo9sMRMZCClVI9pkHJlmZB7ZCMSfZAU0onGwMFATuuxopabrnoJbkJSSwbwJTyTSRl9x9qSZCHWctGeZB0b00dMAx376J")
  end

  def setup_twitter
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "8VCozNTSNlV1BbwpVjSHVtk4S"
      config.consumer_secret     = "jffluqXfFh2gzbjfmRPKOGXIo6M0UdWkLErg9MBTHXCnOZqLwh"
      config.access_token        = "19512258-vGZnld9uEpKhHtMVVhQWMSXRzrWTPiu4oqGSY64zu"
      config.access_token_secret = "d8DDCYgG6LHuJVngayoaIfhXPvupjF29jBUqA3OvTC4S7"
    end
  end

  def facebook status
    setup_facebook()
    @graph.put_wall_post(status)
    #find url use it as a url
    "Facebook"
  end


  def twitter status
    setup_twitter()
    @client.update(status)
    "Twitter"
  end

  def facebook_feed
    setup_facebook()
    feed = @graph.get_connections("me", "feed")
    puts feed
  end


  def twitter_feed
    setup_twitter()
    array = @client.home_timeline
    array.each_with_index do  |eachTweet, index|
      puts "#{index+1}." + eachTweet.user.name + ": " + eachTweet.full_text
      puts "---"
    end
  end
end

X.start(ARGV)
