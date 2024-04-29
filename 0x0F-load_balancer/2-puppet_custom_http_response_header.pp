# This Puppet script installs Nginx, configures a custom HTTP response header, creates a simple index.html file, and sets up a redirect.
exec { 'update':
  command => '/usr/bin/apt-get update',
}

# Install Nginx
package { 'nginx':
  ensure  => installed,
  require => Exec['update'],
}

# Create custom HTTP header configuration
file { '/etc/nginx/conf.d/custom_header.conf':
  ensure  => file,
  content => 'add_header X-Served-By $hostname;',
  notify  => Service['nginx'],
}

# Configure Nginx
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "
    server {
      listen 80 default_server;
      listen [::]:80 default_server;

      root /var/www/html;
      index index.html;

      server_name _;

      include /etc/nginx/conf.d/custom_header.conf;

      rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;
    }
  ",
  notify  => Service['nginx'],
}

# Ensure Nginx service is running
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

# Create index.html file
file { '/var/www/html/index.html':
  ensure  => file,
  content => 'Y4SS11N3',
  require => Package['nginx'],
}
