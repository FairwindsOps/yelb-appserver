require 'redis'

def pageviews()
           redis = Redis.new
           redis = Redis.new(:host => $redishost, :port => 6379)
           redis.incr("pageviews")
           pageviewscount = redis.get("pageviews")
           redis.quit()
        return pageviewscount.to_s
end
