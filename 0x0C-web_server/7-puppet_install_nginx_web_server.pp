# Install and Configure Nginx

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Ensure Nginx service is running
service { 'nginx':
  ensure    => running,
  enable    => true,
  require   => Package['nginx'],
  subscribe => File['/etc/nginx/sites-available/default'],
}

# Configure Nginx default site
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "server {
    listen 80 default_server;
    root /var/www/html;
    index index.html;

    location / {
      try_files \$uri \$uri/ =404;
    }

    location /redirect_me {
      return 301 https://highendflora.com/;
    }
  }
",
  notify  => Service['nginx'],
}

# Create index.html with "Hello World!"
file { '/var/www/html/index.html':
  ensure  => file,
  content => "Hello World!\n",
  require => Package['nginx'],
}
