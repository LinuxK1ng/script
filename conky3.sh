-- Converted to Lua 
conky.config = {
  background = true,
  update_interval = 1,

  cpu_avg_samples = 2,
  net_avg_samples = 2,
  no_buffers = true,
  double_buffer = true,
  text_buffer_size = 2048,
  use_spacer = "right",

  total_run_times = 0,
  gap_x = 16,
  gap_y = 16,

  minimum_width = 300,
  minimum_height = 0,
  maximum_width = 340,

  own_window = true,
  own_window_type = "override",
  own_window_transparent = true,
  own_window_argb_visual = true,
  own_window_colour = "000000",
  own_window_argb_value = 0,
  own_window_hints = "undecorated,below,sticky,skip_taskbar,skip_pager",
  own_window_class = "Conky",
  own_window_title = "Cyrethium Conky",

  alignment = "top_right",
  xinerama_head = 0,
  draw_shades = false,
  draw_outline = false,
  draw_borders = false,
  draw_graph_borders = false,
  stippled_borders = 0,

  border_margin = 4,
  border_width = 1,

  override_utf8_locale = true,
  use_xft = true,
  font = "Monospace:size=9",
  xftalpha = 0.5,
  uppercase = false,

  -- High-contrast defaults for dark themes
  default_color = "FFFFFF",
  default_shade_color = "000000",
  default_outline_color = "FFFFFF",

  color1 = "DDDDDD",
  color2 = "AAAAAA",
  color3 = "888888",
  color4 = "EF5A29",
  color5 = "EF5A29",
  color6 = "3a5153",
}

conky.text = [[
${font Monospace:bold:size=11}${color4}CYRETHIUM STATUS ${color6}${hr 1}
${color}${font Monospace:size=9}
OS:${alignr}Cyrethium V1R (Reborn)
Kernel:${alignr}$kernel
Uptime:${alignr}$uptime
Host:${alignr}$nodename
User:${alignr}${execi 60 whoami}
Time:${alignr}${time %Y-%m-%d %H:%M:%S}
Load:${alignr}${loadavg}

${voffset 6}${font Monospace:bold:size=11}${color4}PRIVACY ${color6}${hr 1}
${color}${font Monospace:size=9}
Tor/Cyrethonion:${alignr}${if_existing /var/lib/cyrethonion/started}${color4}ENABLED${color}${else}${if_running tor}${color4}ENABLED${color}${else}${color2}DISABLED${color}${endif}${endif}
VPN:${alignr}${if_up tun0}${color4}CONNECTED${color}${else}${color2}OFF${color}${endif}

${voffset 6}${font Monospace:bold:size=11}${color4}CPU ${color6}${hr 1}
${color}${font Monospace:size=9}
Total:${alignr}${cpu}%
Tasks:${alignr}$processes (Running: $running_processes)
Freq:${alignr}${freq_g 1} / ${freq_g 2} GHz
Temp:${alignr}${if_existing /sys/class/thermal/thermal_zone0/temp}${execi 10 awk '{printf("%.0f°C\n",$1/1000)}' /sys/class/thermal/thermal_zone0/temp}${else}${acpitemp}°C${endif}
${color4}${cpubar 8,320}${color}
Core1 ${alignr}${cpu cpu1}%
${color4}${cpubar 6,320 cpu1}${color}
Core2 ${alignr}${cpu cpu2}%
${color4}${cpubar 6,320 cpu2}${color}
Top CPU:${alignr}%
1) ${top name 1} ${alignr}${top cpu 1}
2) ${top name 2} ${alignr}${top cpu 2}
3) ${top name 3} ${alignr}${top cpu 3}

${voffset 6}${font Monospace:bold:size=11}${color4}MEMORY ${color6}${hr 1}
${color}${font Monospace:size=9}
$mem / $memmax ($memperc%) ${alignr}Swap: $swap/$swapmax ($swapperc%)
${color4}${membar 8,320}${color}
Top MEM:${alignr}%
1) ${top_mem name 1} ${alignr}${top_mem mem 1}
2) ${top_mem name 2} ${alignr}${top_mem mem 2}
3) ${top_mem name 3} ${alignr}${top_mem mem 3}

${voffset 6}${font Monospace:bold:size=11}${color4}DISKS ${color6}${hr 1}
${color}${font Monospace:size=9}
/ ${alignr}${fs_used /} / ${fs_size /} (${fs_used_perc /}%)
${color4}${fs_bar 8,320 /}${color}
${if_existing /home}
/home ${alignr}${fs_used /home} / ${fs_size /home} (${fs_used_perc /home}%)
${color4}${fs_bar 8,320 /home}${color}
${endif}

${voffset 6}${font Monospace:bold:size=11}${color4}NETWORK ${color6}${hr 1}
${color}${font Monospace:size=9}
${if_up wlp0s20f3}
Interface:${alignr}wlp0s20f3
IP:${alignr}${addr wlp0s20f3}
Gateway:${alignr}${gw_ip}
${if_existing /usr/bin/curl}Public:${alignr}${execi 600 curl -s -m 3 https://ipv4.icanhazip.com | tr -d '\n'}${endif}
Down:${alignr}${downspeedf wlp0s20f3} KiB/s
Up:${alignr}${upspeedf wlp0s20f3} KiB/s
Conn:${alignr}${tcp_portmon 1 65535 count}
${color4}${downspeedgraph wlp0s20f3 16,320 EF5A29 EF5A29}${color}
${color6}${upspeedgraph wlp0s20f3 16,320 3a5153 3a5153}${color}
${else}${if_up wlp2s0}
Interface:${alignr}wlp2s0
IP:${alignr}${addr wlp2s0}
Gateway:${alignr}${gw_ip}
${if_existing /usr/bin/curl}Public:${alignr}${execi 600 curl -s -m 3 https://ipv4.icanhazip.com | tr -d '\n'}${endif}
Down:${alignr}${downspeedf wlp2s0} KiB/s
Up:${alignr}${upspeedf wlp2s0} KiB/s
Conn:${alignr}${tcp_portmon 1 65535 count}
${color4}${downspeedgraph wlp2s0 16,320 EF5A29 EF5A29}${color}
${color6}${upspeedgraph wlp2s0 16,320 3a5153 3a5153}${color}
${else}${if_up wlp3s0}
Interface:${alignr}wlp3s0
IP:${alignr}${addr wlp3s0}
Gateway:${alignr}${gw_ip}
${if_existing /usr/bin/curl}Public:${alignr}${execi 600 curl -s -m 3 https://ipv4.icanhazip.com | tr -d '\n'}${endif}
Down:${alignr}${downspeedf wlp3s0} KiB/s
Up:${alignr}${upspeedf wlp3s0} KiB/s
Conn:${alignr}${tcp_portmon 1 65535 count}
${color4}${downspeedgraph wlp3s0 16,320 EF5A29 EF5A29}${color}
${color6}${upspeedgraph wlp3s0 16,320 3a5153 3a5153}${color}
${else}${if_up wlo1}
Interface:${alignr}wlo1
IP:${alignr}${addr wlo1}
Gateway:${alignr}${gw_ip}
${if_existing /usr/bin/curl}Public:${alignr}${execi 600 curl -s -m 3 https://ipv4.icanhazip.com | tr -d '\n'}${endif}
Down:${alignr}${downspeedf wlo1} KiB/s
Up:${alignr}${upspeedf wlo1} KiB/s
Conn:${alignr}${tcp_portmon 1 65535 count}
${color4}${downspeedgraph wlo1 16,320 EF5A29 EF5A29}${color}
${color6}${upspeedgraph wlo1 16,320 3a5153 3a5153}${color}
${else}${if_up wlan0}
Interface:${alignr}wlan0
IP:${alignr}${addr wlan0}
Gateway:${alignr}${gw_ip}
${if_existing /usr/bin/curl}Public:${alignr}${execi 600 curl -s -m 3 https://ipv4.icanhazip.com | tr -d '\n'}${endif}
Down:${alignr}${downspeedf wlan0} KiB/s
Up:${alignr}${upspeedf wlan0} KiB/s
Conn:${alignr}${tcp_portmon 1 65535 count}
${color4}${downspeedgraph wlan0 16,320 EF5A29 EF5A29}${color}
${color6}${upspeedgraph wlan0 16,320 3a5153 3a5153}${color}
${else}${if_up enp0s3}
Interface:${alignr}enp0s3
IP:${alignr}${addr enp0s3}
Gateway:${alignr}${gw_ip}
${if_existing /usr/bin/curl}Public:${alignr}${execi 600 curl -s -m 3 https://ipv4.icanhazip.com | tr -d '\n'}${endif}
Down:${alignr}${downspeedf enp0s3} KiB/s
Up:${alignr}${upspeedf enp0s3} KiB/s
Conn:${alignr}${tcp_portmon 1 65535 count}
${color4}${downspeedgraph enp0s3 16,320 EF5A29 EF5A29}${color}
${color6}${upspeedgraph enp0s3 16,320 3a5153 3a5153}${color}
${else}${if_up enp3s0}
Interface:${alignr}enp3s0
IP:${alignr}${addr enp3s0}
Gateway:${alignr}${gw_ip}
${if_existing /usr/bin/curl}Public:${alignr}${execi 600 curl -s -m 3 https://ipv4.icanhazip.com | tr -d '\n'}${endif}
Down:${alignr}${downspeedf enp3s0} KiB/s
Up:${alignr}${upspeedf enp3s0} KiB/s
Conn:${alignr}${tcp_portmon 1 65535 count}
${color4}${downspeedgraph enp3s0 16,320 EF5A29 EF5A29}${color}
${color6}${upspeedgraph enp3s0 16,320 3a5153 3a5153}${color}
${else}${if_up eno1}
Interface:${alignr}eno1
IP:${alignr}${addr eno1}
Gateway:${alignr}${gw_ip}
${if_existing /usr/bin/curl}Public:${alignr}${execi 600 curl -s -m 3 https://ipv4.icanhazip.com | tr -d '\n'}${endif}
Down:${alignr}${downspeedf eno1} KiB/s
Up:${alignr}${upspeedf eno1} KiB/s
Conn:${alignr}${tcp_portmon 1 65535 count}
${color4}${downspeedgraph eno1 16,320 EF5A29 EF5A29}${color}
${color6}${upspeedgraph eno1 16,320 3a5153 3a5153}${color}
${else}${if_up eth0}
Interface:${alignr}eth0
IP:${alignr}${addr eth0}
Gateway:${alignr}${gw_ip}
${if_existing /usr/bin/curl}Public:${alignr}${execi 600 curl -s -m 3 https://ipv4.icanhazip.com | tr -d '\n'}${endif}
Down:${alignr}${downspeedf eth0} KiB/s
Up:${alignr}${upspeedf eth0} KiB/s
Conn:${alignr}${tcp_portmon 1 65535 count}
${color4}${downspeedgraph eth0 16,320 EF5A29 EF5A29}${color}
${color6}${upspeedgraph eth0 16,320 3a5153 3a5153}${color}
${else}${if_up tun0}
Interface:${alignr}tun0
IP:${alignr}${addr tun0}
Gateway:${alignr}${gw_ip}
${if_existing /usr/bin/curl}Public:${alignr}${execi 600 curl -s -m 3 https://ipv4.icanhazip.com | tr -d '\n'}${endif}
Down:${alignr}${downspeedf tun0} KiB/s
Up:${alignr}${upspeedf tun0} KiB/s
Conn:${alignr}${tcp_portmon 1 65535 count}
${color4}${downspeedgraph tun0 16,320 EF5A29 EF5A29}${color}
${color6}${upspeedgraph tun0 16,320 3a5153 3a5153}${color}
${else}
${color2}No active connection${color}
${endif}${endif}${endif}${endif}${endif}${endif}${endif}${endif}

]]
