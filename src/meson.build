resource_files = files('polvora.gresource.xml')
resources = gnome.compile_resources ('resources', 'polvora.gresource.xml',
                                     source_dir: '.',
                                     c_name: 'resources')

vala_args = [ 
  '--target-glib', glib_min_version,
  '--enable-checking',
  '--gresources', resource_files
]

c_args = [  
  '-g',
  '-include', 'config.h',
  '-DVERSION="@0@"'.format (meson.project_version ()),
  '-DICON_DIR="@0@"'.format (icondir),
]

balisitica = executable (meson.project_name(),
  [ 'PolvoraApplication.vala',
    'Database.vala',
    'Logging.vala',
    'LogMsg.vala',

    # Gui
    'LogViewerDialog.vala',
    'CaseBox.vala',
    'PowderBox.vala',
    'PrimerBox.vala',
    'ProjectileBox.vala',
    ] + resources,
  include_directories: config_h_dir,
  dependencies: [ glib_dep, gtk_dep, gio_dep, sqlite_dep ],
  c_args: c_args,
  vala_args: vala_args,
  link_args: ['-lm'],
  install: true
)
