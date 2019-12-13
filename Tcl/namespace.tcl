# namespace
::foo::bar  ;# fully qualified namespace begin from global

namespace eval path script	;# This command evaluates the script in the namespace specified by path. If the namespace doesn't exist then it is created. The namespace becomes the current namespace while the script is executing, and any unqualified names will be resolved relative to that namespace. Returns the result of the last command in script.

namespace delete [namespace1 namespace2 ...]
namespace current   ;# returns the fully qualified path of the current namespace
namespace export [-clear] [pattern1 pattern2 ...]   ;# Adds any commands matching one of the patterns to the list of commands exported by the current namespace. If the -clear switch is given then the export list is cleared before adding any new commands. If no arguments are given, returns the currently exported command names. Each pattern is a glob-style pattern 
namespace import [-force] [pattern1 pattern2 ...]   ;# Imports all commands matching any of the patterns into the current namespace. 

namespace eval ::stack {
    namespace ensemble create	;# so that we can use subcommand as: stack create rather than stack::create
}
