web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
release: bundle exec rails db:migrate db:seed
worker: bundle exec sidekiq -C config/sidekiq.yml