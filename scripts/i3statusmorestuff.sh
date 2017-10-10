#!/bin/sh
# shell script to prepend i3status with more stuff

get_mem() {
  # MemUsed = Memtotal + Shmem - MemFree - Buffers - Cached - SReclaimable
  # Source: https://github.com/KittyKatt/screenFetch/issues/386#issuecomment-249312716
  local mem_total=$(awk '/MemTotal/ {print $2/1024}' /proc/meminfo | bc)
  local shmem=$(awk '/Shmem/ {print $2/1024}' /proc/meminfo | sed -n 1p | bc)
  local mem_free=$(awk '/MemFree/ {print $2/1024}' /proc/meminfo | bc)
  local buffers=$(awk '/Buffers/ {print $2/1024}' /proc/meminfo | bc)
  local cached=$(awk '/Cached/ {print $2/1024}' /proc/meminfo | sed -n 1p | bc)
  local sreclaimable=$(awk '/SReclaimable/ {print $2/1024}' /proc/meminfo | bc)
  local mem_used=$(echo "scale=0; ($mem_total + $shmem - $mem_free - $buffers - $cached - $sreclaimable)/1" | bc)
  local mem_total_scale0=$(echo "$mem_total/1" | bc)

  echo "RAM: $mem_used MiB / $mem_total_scale0 MiB |"
}

get_cpu_temperature() {
  echo $(sensors | awk '/CPU Temperature/ {printf "%s |",$3}')
}

get_uptime() {
  echo $(uptime -p | awk '{printf "%s |",$0}')
}

get_active_layout() {
  if [[ "$(xset -q | awk '/Caps Lock/ {printf "%s",$4}')" == "off" ]]; then
    echo $(xkblayout-state print "%s |")
  else
    echo $(xkblayout-state print "%s |" | awk '{print toupper($0)}')
  fi
}

i3status | while :
do
  read line
  echo "$(get_active_layout) $(get_mem) $(get_uptime) $(get_cpu_temperature) $line" || exit 1
done
