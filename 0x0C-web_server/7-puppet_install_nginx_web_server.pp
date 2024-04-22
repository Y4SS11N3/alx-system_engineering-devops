# This manifest installs and configures Nginx with a custom page and a 301 redirect

class nginx_setup {
  package { 'nginx':
    ensure => installed,
  }

  service { 'nginx':
    ensure    => running,
    enable    => true,
    require   => Package['nginx'],
  }

  file { '/var/www/html/index.html':
    ensure  => file,
    content => 'Hello World!',
    require => Package['nginx'],
  }

  file { '/etc/nginx/sites-available/default':
    ensure  => file,
    content => template('nginx/default.erb'),
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
}

class nginx_redirect {
  file_line { 'nginx_redirect':
    path  => '/etc/nginx/sites-available/default',
    line  => 'rewrite ^/redirect_me$ http://example.com permanent;',
    match => '^.*rewrite.*redirect_me.*$',
    require => Package['nginx'],
    notify => Service['nginx'],
  }
}

include nginx_setup
include nginx_redirect
