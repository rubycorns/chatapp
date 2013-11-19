require 'sinatra'
require 'pathname'

get '/' do
  '<h1>Chat with me</h1>' +
  render_posts +
  '<form action="/" method="POST"><textarea name="text"></textarea> <input type="submit" value="send" id="send"></form>'
end

post '/' do
  Pathname.new('posts.txt').open('a') { |f| f.puts(params[:text]) }
  redirect '/'
end

def render_posts
  chat_messages = Pathname.new('posts.txt').read.lines.map do |line|
    '<p>' + line + '</p>'
  end
  chat_messages.join
end