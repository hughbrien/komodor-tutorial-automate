while true;
do
  exit_status=$(curl -v -o /dev/null -w '%{http_code}' https://www.komodor.com);
  echo "The Exit Status is \$exit_status";
  if [ $exit_status -ne 200 ]; then
      exit 1;
  fi
  sleep 2;
done
