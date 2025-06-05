project('wayland-tracer', 'c', version : '0.4.0')

expat = dependency('expat')
cc = meson.get_compiler('c')
rt = cc.find_library('rt', required: true)
deps = [expat, rt]

if get_option('perfetto').enabled()
  percetto_proj = subproject('percetto')
  percetto_dep = percetto_proj.get_variable('percetto_dep')
  deps += [percetto_dep]
endif

tracer_version = meson.project_version()
conf = configuration_data()
conf.set_quoted('VERSION', tracer_version)
conf.set('VERSION_UNQ', tracer_version)
conf.set10('HAVE_PERFETTO', get_option('perfetto').enabled())
configure_file(output : 'config.h',
               configuration : conf)

subdir('man')

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
  'wayland-tracer',
  sources,
  dependencies: deps,
  c_args: cflags,
  install: true,
)
