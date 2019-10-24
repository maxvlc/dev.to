require "redis"

# By default, the client will try to read the REDIS_URL env variable and use that as the URL
RedisClient = Redis.new
