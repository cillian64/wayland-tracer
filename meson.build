project('wayland-tracer', 'c', version : '0.2.0')

expat = dependency('expat')
cc = meson.get_compiler('c')
rt = cc.find_library('rt', required : true)

tracer_version = meson.project_version()
conf = configuration_data()
conf.set_quoted('VERSION', tracer_version)
conf.set('VERSION_UNQ', tracer_version)
configure_file(output : 'config.h',
               configuration : conf)

cflags = [
  '-Wall',
  '-Wextra',
  '-g',
  '-Wstrict-prototypes',
  '-Wmissing-prototypes',
  '-fvisibility=hidden',
]

sources = [
  'src/connection.c',
  'src/frontend-analyze.c',
  'src/frontend-analyze.h',
  'src/frontend-bin.c',
  'src/frontend-bin.h',
  'src/tracer.c',
  'src/tracer.h',
  'src/tracer-analyzer.c',
  'src/tracer-analyzer.h',
  'src/wayland-os.c',
  'src/wayland-util.c',
  'src/wayland-util.h',
  'src/wayland-private.h',
]

wayland_tracer = executable(
  'wayland-tracer', sources,
  dependencies : [expat, rt],
  c_args: cflags,
  install : true,
)

mandir = join_paths(get_option('prefix'), get_option('mandir'), 'man1')

configure_file(
  input : 'man/wayland-tracer.man',
  output : 'wayland-tracer.1',
  configuration : conf,
  install: true,
  install_dir: mandir,
)
