require_relative 'modules/pageviews'

def pageviews_adapter(event:, context:)
    $redishost = ENV['redishost']
    $port = 6379
    pageviewscount = pageviews()
    # use the return JSON command when you want the API Gateway to manage the http communication
    # return JSON.parse(pageviewscount)
    { statusCode: 200,
        body: pageviewscount,
        headers: {
          'content_type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Headers':  'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With',
          'Access-Control-Allow-Methods': 'GET,POST,PUT,DELETE,OPTIONS'
        }
    }

end

