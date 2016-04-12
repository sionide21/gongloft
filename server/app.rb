require "sinatra"
require "thread"

$stdout.sync = true
$queue = Queue.new

RING_TOKEN = ENV.fetch("RING_TOKEN")
GONG_TOKEN = ENV.fetch("GONG_TOKEN")

class App < Sinatra::Application
  get "/" do
    "Ring the Gong"
  end

  post "/queue/:token/pop" do
    halt 403 unless params["token"] == GONG_TOKEN
    begin
      $queue.pop(true)
      200
    rescue ThreadError
      409
    end
  end

  post "/queue/:token" do
    halt 403 unless params["token"] == RING_TOKEN
    $queue << true
    201
  end
end
