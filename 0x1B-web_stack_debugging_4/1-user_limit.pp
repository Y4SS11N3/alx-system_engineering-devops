# This manifest changes the OS configuration to allow the "holberton" user to log in and open files without error
exec { 'increase-hard-file-limit-for-holberton-user':
  command => 'sed -i "/holberton hard nofile/s/5/50000/" /etc/security/limits.conf',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

exec { 'increase-soft-file-limit-for-holberton-user':
  command => 'sed -i "/holberton soft nofile/s/4/50000/" /etc/security/limits.conf',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}
