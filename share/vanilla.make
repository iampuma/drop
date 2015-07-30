; This file was auto-generated by drush make
core = 7.x
api = 2

; Core
projects[] = "drupal"
; Modules
projects[views_bulk_operations][subdir] = "contrib"

projects[admin_menu][subdir] = "contrib"

projects[admin_views][subdir] = "contrib"

projects[adminimal_admin_menu][subdir] = "contrib"

projects[backup_migrate][subdir] = "contrib"

projects[ctools][subdir] = "contrib"

projects[cck][subdir] = "contrib"

projects[ckeditor][subdir] = "contrib"

projects[ckeditor_widgets][subdir] = "contrib"

projects[coffee][subdir] = "contrib"

projects[date][subdir] = "contrib"

projects[devel][subdir] = "contrib"

projects[ds][subdir] = "contrib"

projects[eck][subdir] = "contrib"

projects[entity][subdir] = "contrib"

projects[entityreference][subdir] = "contrib"

projects[features][subdir] = "contrib"

projects[field_collection][subdir] = "contrib"

projects[field_group][subdir] = "contrib"

projects[globalredirect][subdir] = "contrib"

projects[honeypot][subdir] = "contrib"

projects[htmlpurifier][subdir] = "contrib"

projects[i18n][subdir] = "contrib"

projects[jquery_update][subdir] = "contrib"

projects[l10n_update][subdir] = "contrib"

projects[libraries][subdir] = "contrib"

projects[link][subdir] = "contrib"

projects[menu_admin_per_menu][subdir] = "contrib"

projects[menu_block][subdir] = "contrib"

projects[metatag][subdir] = "contrib"

projects[module_filter][subdir] = "contrib"

projects[nodeblock][subdir] = "contrib"

projects[paragraphs][subdir] = "contrib"

projects[pathauto][subdir] = "contrib"

projects[r4032login][subdir] = "contrib"

projects[redirect][subdir] = "contrib"

projects[search_krumo][subdir] = "contrib"

projects[strongarm][subdir] = "contrib"

projects[taxonomy_access_fix][subdir] = "contrib"

projects[token][subdir] = "contrib"

projects[variable][subdir] = "contrib"

projects[views][subdir] = "contrib"

projects[webform][subdir] = "contrib"

projects[xmlsitemap][subdir] = "contrib"

; Themes
projects[] = "adminimal_theme"
projects[] = "bootstrap"

; Features
projects[xi_vanilla_feature][download][type] = "git"
projects[xi_vanilla_feature][download][url] = "https://git@bitbucket.org/nicky_vandevoorde/xi_vanilla_feature.git"
projects[xi_vanilla_feature][type] = "module"
projects[xi_vanilla_feature][subdir] = "features"

; Profiles
projects[vanilla][download][type] = "git"
projects[vanilla][download][url] = "https://git@bitbucket.org/nicky_vandevoorde/vanilla.git"
projects[vanilla][type] = "profile"

; Libraries
libraries[htmlpurifier][download][type] = "get"
libraries[htmlpurifier][download][url] = "http://htmlpurifier.org/releases/htmlpurifier-4.6.0.zip"
libraries[htmlpurifier][directory_name] = "htmlpurifier"
libraries[htmlpurifier][type] = "library"

projects[codemirror][download][type] = "get"
projects[codemirror][download][url] = "http://download.ckeditor.com/codemirror/releases/codemirror_1.13.zip"
projects[codemirror][download][subtree] = codemirror/
projects[codemirror][directory_name] = "contrib/ckeditor/plugins/codemirror"
