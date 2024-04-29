# This Puppet script installs Nginx, configures a custom HTTP response header, creates a simple index.html file, and sets up a redirect.
# Update system packages
exec { 'update system':
  command => '/usr/bin/apt-get update',
}

# Install Nginx
package { 'nginx':
  ensure  => 'installed',
  require => Exec['update system'],
}

# Create a simple index.html file
file {'/var/www/html/index.html':
  content => 'Hello World!',
}

# Redirect setup
exec {'redirect_me':
  command   => 'sed -i "24i\	rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
  provider  => 'shell',
}

# Add custom HTTP header
exec {'HTTP header':
  command   => 'sed -i "25i\	add_header X-Served-By \$hostname;" /etc/nginx/sites-available/default',
  provider  => 'shell',
}

# Ensure Nginx service is running
service {'nginx':
  ensure  => 'running',
  require => Package['nginx'],
}
