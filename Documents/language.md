* Fundamental syntax — the special forms that cannot faithfully be explained by local expansion to other syntax.

* Semantic state — the state that computation manipulates.

* Kernel builtins — the portion of the built in library providing functionality that, if it were absent, could not be provided instead by user code.

* Non-kernel intrinsics — built in libraries that could be implemented in JavaScript, but that semantic state or kernel builtins depend on. For example, with proxies, one might be able to implement Array in user code. But other kernel builtins already have a dependency on Array specifically, giving it a privileged position over any replacement.

* Syntactic sugar — the syntax that can be explained by local expansion to fundamental syntax.

* Global convenience libraries — could be implemented by unprivileged user code, but given standard global naming paths in the primordial global namespace.

* Standard convenience modules — blessing community-developed modules as standard.

