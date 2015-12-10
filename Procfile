web: bundle exec puma -t 2:3 -p ${PORT:-3000} -e ${RACK_ENV:-development}
worker: bundle exec sidekiq -c 2 -v
