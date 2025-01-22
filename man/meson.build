scdoc = find_program('scdoc', required: get_option('man-pages'))

if scdoc.found()
  custom_target(
    'wayland-tracer.1',
    input: 'wayland-tracer.1.scd',
    output: 'wayland-tracer.1',
    command: scdoc,
    feed: true,
    capture: true,
    install: true,
    install_dir: join_paths(get_option('mandir'), 'man1')
  )
endif
