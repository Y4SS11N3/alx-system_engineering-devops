# Kill the process named "killmenow"

exec { 'killmenow':
  command => 'pkill killmenow',
  path    => '/usr/bin:/usr/sbin:/bin',
  onlyif  => 'pgrep killmenow',
}
