use inc::Module::Install;

name 'Mason-Plugin-AutoNoMain';
all_from 'lib/Mason/Plugin/AutoNoMain.pm';

requires 'Mason' => "2.14";

auto_install;
auto_set_repository;
githubmeta;

WriteAll;
