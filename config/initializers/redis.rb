require "redis"
REDIS_CACHE = Redis.new(
  url: "redis://#{Figaro.env.REDIS_CACHE_HOST}/#{Figaro.env.REDIS_CACHE_PORT}")

APP_PROFILE_CACHE_PREFIX = "APP_PROFILE"
APP_GROUP_PROFILE_CACHE_PREFIX = "APP_GROUP_PROFILE"
GATE_GROUP_CACHE_PREFIX = "GATE_GROUP"