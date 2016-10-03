<?php
$aliases['local'] = array (
  'root' => '/usr/share/nginx/htdocs',
  'uri' => 'http://drop.local',
);

$aliases['dev'] = array (
  'root' => '/var/www/MY_DEV_WEBSITE',
  'uri' => 'http://dev.website.com',
  'remote-user' => 'root',
  'remote-host' => 'DEV_SERVER_IP',
  'ssh-options' => '-p 22',
);

$aliases['test'] = array (
  'root' => '/var/www/MY_TEST_WEBSITE',
  'uri' => 'http://test.website.com',
  'remote-user' => 'root',
  'remote-host' => 'TEST_SERVER_IP',
  'ssh-options' => '-p 22',
);

$aliases['live'] = array (
  'root' => '/var/www/MY_LIVE_WEBSITE',
  'uri' => 'http://website.com',
  'remote-user' => 'root',
  'remote-host' => 'LIVE_SERVER_IP',
  'ssh-options' => '-p 22',
  'path-aliases' => array (
    '%drush' => '/usr/bin',
    '%site' => 'sites/default/',
  ),
);
