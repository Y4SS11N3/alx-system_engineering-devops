# Install Flask package with version 2.1.0 using pip3

package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}
