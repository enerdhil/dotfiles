function rebe() {
  if [ -z "$1" ] || [ -z "$2" ]; then
     echo "Usage: rebe <rails_env> <cmd...>"
     return 1
  fi
  _rails_env=$1
  shift
  RAILS_ENV=$_rails_env bundle exec $@
}

