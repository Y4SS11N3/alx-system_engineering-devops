# This manifest changes the OS configuration to allow the "holberton" user to log in and open files without error
exec { 'change-os-configuration-for-holberton-user':
  command => 'sed -i "/holberton hard nofile/d" /etc/security/limits.conf; sed -i "/holberton soft nofile/d" /etc/security/limits.conf; echo "holberton hard nofile 4096" >> /etc/security/limits.conf; echo "holberton soft nofile 1024" >> /etc/security/limits.conf',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}
