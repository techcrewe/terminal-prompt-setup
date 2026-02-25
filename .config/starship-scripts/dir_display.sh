#!/usr/bin/env bash
home="${HOME%/}"
pwd="${PWD%/}"

if [[ "$pwd" == "$home" ]]; then
  printf "󰋜"
elif [[ "$pwd" == "$home/"* ]]; then
  printf "󰋜 » %s" "${pwd##*/}"
else
  rel="${pwd#/}"
  IFS='/' read -r -a parts <<< "$rel"
  n=${#parts[@]}

  if (( n >= 3 )) && [[ "${parts[0]}" == "mnt" ]]; then
    drive_root="/mnt/${parts[1]}"
    if (( n <= 5 )); then
      printf "%s/%s" "$drive_root" "$(IFS=/; echo "${parts[*]:2}")"
    else
      printf "%s/.../%s/%s/%s" \
        "$drive_root" "${parts[n-3]}" "${parts[n-2]}" "${parts[n-1]}"
    fi
  else
    if (( n <= 4 )); then
      printf "/%s" "$rel"
    else
      printf "/%s/.../%s/%s/%s" \
        "${parts[0]}" "${parts[n-3]}" "${parts[n-2]}" "${parts[n-1]}"
    fi
  fi
fi