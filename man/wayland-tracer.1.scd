wayland-tracer(1)

# NAME

wayland-tracer - a wire protocol dumper for Wayland

# SYNOPSIS

*wayland-tracer* [options...] -- command [arg]...

*wayland-tracer* -S socket [options...]

# DESCRIPTION

The *wayland-tracer* program is a protocol dumper for Wayland.  It can be used
to trace what's on the wire between the compositor and client, which can be
quite useful for debugging. It can dump raw binary data or interpret data to
human-readable format.

# MODES

*wayland-tracer* runs in one of two modes, single mode and server mode.  Both
modes require that you have a running Wayland compositor and the WAYLAND_DISPLAY
environment variable properly set when you launch *wayland-tracer*.

Single mode is used to trace a single program. It is launched with the first
form above, with a client command-line specified.

Server mode is used to trace multiple clients. It listens to a socket specified
by the -S option. Any application run with its WAYLAND_DISPLAY environment
variable set to this socket will have its wayland protocol messages traced.

If either of the *-d* or *-D* options are used to load protocol files then
*wayland-tracer* will decode messages and print them in a human-readable format.
Otherwise, raw binary messages will be dumped in hex.

# OPTIONS

The following options are supported:

*-o* <output-file>
	Dump output to the specified filename instead of standard output.

*-d* <protocol-file>
	Specify a xml protocol file. Multiple protocol files can be loaded by
	specifying this option repeatedly.
	
	*wayland-tracer* will try to interpret according to the protocols given.
	You must provide at least the core wayland protocol. Note that protocol
	files are the only means in which *wayland-tracer* can interpret, so if
	there is a message from an object which implements an interface not
	specified in XML file, the following result is unspecified and the
	program traced may crash.

*-D*
	Try to automatically load all Wayland protocol files from the wayland
	core and wayland-protocols system directories.  Further protocols in
	non-standard locations can be loaded by using the *-d* option alongside
	*-D*.

*-S* <socket>
	Run in server mode listening on the specified socket.

*-h*
	Print help message and exit.
