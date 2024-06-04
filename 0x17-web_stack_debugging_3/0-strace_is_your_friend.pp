# 0-strace_is_your_friend.pp
# Using strace to find and fix the issue causing Apache to return a 500 error

exec { 'fix-wordpress':
  command => 'sed -i "s/phpp/php/" /var/www/html/wp-settings.php',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}
