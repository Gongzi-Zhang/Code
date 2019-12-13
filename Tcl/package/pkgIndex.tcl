# register a package
package provide packagename [version]	;# indicate the specific version of package has been loaded; if a different version of the same package has already been loaded, then an error is raised; this command returns the version number that is currently loaded
pkg_mkIndex [-direct] [-lazy] [-load pkgPat] [-verbose] dir [pattern1 pattern2 ... patternN]	;# creates a pkgIndex.tcl file for a package or set of packages by loading the files matching the pattern in dir.


# example
package provide stack 1.0
package require Tcl	8.6

# create the namespace 
namespace eval ::stack {
    # export commands
    namespace export create destroy push pop peek empty

    # set up state
    variable stack
    variable id 0
}

# create a new stack
proc ::stack::create {} {
    variable stack
    variable id
    
    set token "stack[incr id]"
    set stack($token) [list]
    return $token
}

# destroy a stack
proc ::stack::destroy {token} {
    variable stack

    unset stack($token)
}

# push an element onto the stack
proc ::stack::push {token elem} {
    variable stack

    lappend stack($token) $elem
}

# check if stack is empty
proc ::stack::empty {token elem} {
    variable stack

    set num [llength $stack($token)]
    return [expr {$num == 0}]
}

# see what is on top of the stack without removing it
proc ::stack::peek {token} {
    variable stack

    if {[emty $token]} {
	error "stack empty"
    }
    return [lindex $stack($token) end]
}

# pop out an element from the stack
proc ::stack::pop {token} {
    variable stack

    set ret [peek $token]
    set stack($token) [lrange $stack($token) 0 end-1]
    return $ret
}
