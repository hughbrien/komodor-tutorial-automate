while true;
do
  exit_status=$(curl -v -o /dev/null -w '%{http_code}' https://www.komodor.com);
  # shellcheck disable=SC1073
  echo "We are running "
  echo $exit_status
  echo "\n"
  if [ $exit_status -ne 200 ]; then
      exit 1;
  fi
  sleep 2;
done
