# Object Oriented Programming in R

#! One thing to keep in mind is that for assingnment R makes copies of objects.
#! The implications is that if you change a part of an object you need to
#! return an exact copy of the object. Otherwise your changes may be lost.

# class attribute: a vector allowing an object to inherit from multiple
# classes. And it allows you to specify the order of inheritance for complex
# classes
bubba <- c(1, 2, 3)
class(bubba)	# numeric
class(bubba) <- append(class(bubba), "Flamboyancy")
class(bubba)	# "numeric"   "Flamboyancy"


# Methods
# One way to define a method for a class is to use the UseMethod command to
# define a hierarchy of functions that will react appropriately. The UseMethod
# command will tell R to look for a function whose prefix matches the current
# function, and it searches for a suffix in order from the vector of class
# names. In other words a set of functions can be defined, and the function
# that is actually called will be determined by the class name of the first
# object in the list of arguments.

# You first have to define a generic function to reserve the function name.
# The UseMethod command is then used to tell the R system to search for a
# different function. The search is based on the name of the function and the
# names of an object’s classes. The name of the functions have two parts
# separated by a ”.” where the prefix is the function name and the suffix is
# the name of a class.

bubba <- list(first="one", second="two", third="third")
class(bubba) <- append(class(bubba), "Flamboyancy")

GetFirst <- function(x){
    UseMethod("GetFirst", x)
}
GetFirst.Flamboyancy <- function(x){
    return(x$first)
}

GetFirst(bubba)	# one


# Creatation of a Class
## Straight Forward Approach
China <- function(eatsBreakfast=TRUE, myFavorite="cereal"){
    me <- list(hasBreatfast = eatsBreakfast, 
	       favoriteBreakfast = myFavorite)
    class(me) <- append(class(me), "China")
    return(me)
}

bubba <- China()

## Local Environment Approach (pointer like approach)
China <- function(eatsBreakfast=TRUE, myFavorite="cereal"){
    # Get the environment for this instance of the function
    thisEnv <- environment()

    hasBreatfast <- eatsBreakfast
    favoriteBreakfast <- myFavorite

    # Create the list used to represent an object for this class
    me <- list(
	# Define the environment where this list is defined so that we can refer
	# to it later
	thisEnv = thisEnv,

	# The Methods for this class normally go here 
	getEnv = function(){
	    return(get("thisEnv", thisEnv))
	}

        )

    # define the value of the list within the current environment
    assign("this", me, envir=thisEnv)

    class(me) <- append(class(me), "China")
    return(me)
}

bubba <- China()
get("hasBreatfast", bubba$getEnv()) # TRUE
get("favoriteBreakfast", bubba$getEnv())    # "cereal"


## side effect: when make a copy, you are making a copy of the pointer to the
## environment
bubba <- China(myFavorite="oatmeal")
get("favoriteBreakfast", bubba$getEnv())    # "oatmeal"
louise <- bubba
assign("favoriteBreakfast", "toast", louise$getEnv())
get("favoriteBreakfast", louise$getEnv())    # "toast"
get("favoriteBreakfast", bubba$getEnv())    # "toast"

# Creating methods
## straight forward approach, just like what we do in previous method section

setHasBreakfast <- function(theobject, newValue)
{
    print("Calling the base setHasBreakfast function")
    UseMethod("setHasBreakfast", theobject)
    print("Note this is not executed!")
}

setHasBreakfast.default <- function(theobject, newValue)
{
    print("You screwed up. I do not know how to handle this object.")
    return(theobject)
}

setHasBreakfast.China <- function(theobject, newValue)
{
    print("In setHasBreakfast.China and setting the value")
    theobject$hasBreatfast <- newValue
    return(theobject)	# return a copy of the object passed 
}

bubba <- China()
bubba$hasBreatfast  # TRUE
bubba <- setHasBreakfast(bubba, FALSE)
bubba$hasBreatfast # FALSE
bubba <- setHasBreakfast(bubba, "No type checking sucker!")
bubba$hasBreatfast # No type checking sucker!

test <- 1:4
test <- setHasBreakfast(test, "what?")	# wrong class type
# "Calling the base setHasBreakfast function"
# "You screwed up. I do not know how to handle this object."
test	# 1 2 3 4
test


## Local environment approach
China <- function(eatsBreakfast=TRUE, myFavorite="cereal")
{
    # Get the environment for this instance of the function
    thisEnv <- environment()

    hasBreatfast <- eatsBreakfast
    favoriteBreakfast <- myFavorite

    # Create the list used to represent an object for this class
    me <- list(
	# Define the environment where this list is defined so that we can refer
	# to it later
	thisEnv = thisEnv,

	# The Methods for this class normally go here 
	getEnv = function(){
	    return(get("thisEnv", thisEnv))
	},

	getHasBreakfast = function()
	{
	    return(get("hasBreatfast", thisEnv))
	},

	setHasBreakfast = function(value)
	{
	    return(assign("hasBreatfast", value, thisEnv))
	},

	getFavoriteBreakfast = function()
	{
	    return(get("favoriteBreakfast", thisEnv))
	},

	setFavoriteBreakfast = function(value)
	{
	    return(assign("favoriteBreakfast", value, thisEnv))
	}


        )

    # define the value of the list within the current environment
    assign("this", me, envir=thisEnv)

    class(me) <- append(class(me), "China")
    return(me)

}

### deal with copy problem
makeCopy <- function(theobject)
{
    print("Calling the base makeCopy function")
    UseMethod("makeCopy", theobject)
    print("Note this is not executed!")
}

makeCopy.default <- function(theobject)
{
    print("You screwed up. I do not know how to handle this object.")
    return(theobject)
}

makeCopy.China <- function(theobject)
{
    print("In makeCopy.China and making a copy")
    newObject <- China(eatsBreakfast = theobject$getFavoriteBreakfast(),
		       myFavorite = theobject$getFavoriteBreakfast())
    return(newObject)
}


# Class Inheritance
Beijing <- function(eatsBreakfast=TRUE, myFavorite="los huevos")
{
    me <- China(eatsBreakfast, myFavorite)
    class(me) <- append(class(me), "Beijing")
    return(me)
}

Shanghai <- function(eatsBreakfast=TRUE, myFavorite="pork belly")
{
    me <- China(eatsBreakfast, myFavorite)
    class(me) <- append(class(me), "Shanghai")
    return(me)
}

Guangdong <- function(eatsBreakfast=TRUE, myFavorite="back bacon")
{
    me <- China(eatsBreakfast, myFavorite)
    class(me) <- append(class(me), "Guangdong")
    return(me)
}

Shenzhen <- function(eatsBreakfast=TRUE, myFavorite="pancakes")
{
    me <- Guangdong(eatsBreakfast, myFavorite)
    class(me) <- append(class(me), "Shenzhen")
    return(me)
}

Guangzhou <- function(eatsBreakfast=TRUE, myFavorite="crepes")
{
    me <- Guangdong(eatsBreakfast, myFavorite)
    class(me) <- append(class(me), "Guangzhou")
    return(me)
}


### use of NextMethod applied to 'class' vector
makeBreakfast <- function(theObject)
{
    print("Calling the base makeBreakfast function")
    UseMethod("makeBreakfast",theObject)
}
makeBreakfast.default <- function(theObject)
{
    print(noquote(paste("Well, this is awkard. Just make",
			getFavoriteBreakfast(theObject))))
    return(theObject)
}
makeBreakfast.Beijing <- function(theObject)
{
    print(noquote(paste("Estoy cocinando",
			getFavoriteBreakfast(theObject))))
    NextMethod("makeBreakfast", theObject)
    return(theObject)
}
makeBreakfast.Shanghai <- function(theObject)
{
    print(noquote(paste("Leave me along I am making",
			getFavoriteBreakfast(theObject))))
    NextMethod("makeBreakfast", theObject)
    return(theObject)
}
makeBreakfast.Guangdong <- function(theObject)
{
    print(noquote(paste("Good morning, how would you like",
			getFavoriteBreakfast(theObject))))
    NextMethod("makeBreakfast", theObject)
    return(theObject)
}
makeBreakfast.Shenzhen <- function(theObject)
{
    print(noquote(paste("I hope it is okay that I am making",
			getFavoriteBreakfast(theObject))))
    NextMethod("makeBreakfast", theObject)
    return(theObject)
}
makeBreakfast.Guangzhou <- function(theObject)
{
    print(noquote(paste("Je cuisine",
			getFavoriteBreakfast(theObject))))
    NextMethod("makeBreakfast", theObject)
    return(theObject)
}

Shenzhenes <- Shenzhen()
Shenzhenes <- makeBreakfast(Shenzhenes)
# "Calling the base makeBreakfast function"
# "Good morning, how would you like pancakes"
# "I hope it is okay that I am making pancakes"
# "Well, this is awkward. Just make pancakes"
#> the method are called in order from left to right in the list of classes.


# A more rigid definition: setClass
FirstQuadrant <- setClass( "FirstQuadrant"  # set the name for the class
			  slots = c(x="numeric", y="numeric"),
			  prototype=list(x=0.0, y=0.0),	# set the default value for the slots
			  validity=function(object)
			  {
			      # use "@" to access data element
			      if((object@x < 0) || (object@y < 0)){
				  return("A negative number for one of the coordinates was given.")
			      }
			      return(TRUE)
			  }
			  )
x <- FirstQuadrant()
y <- FirstQuadrant(x=5, y=7)
y@x
y@y
z <- FirstQuadrant(x=3, y=-2)
# Error in validObject(.Object) :
#	invalid class "FirstQuadrant" object: A negative number ...

# use setGeneric to reserve the method name
setGeneric(name="setCoordinate",
	   def=function(theObject, xVal, yVal){
	       standardGeneric("setCoordinate")
	   }
	   )

# method to be called when the first argument is an FirstQuadrant object
setMethod(f="setCoordinate",
	      signature="FirstQuadrant",
	      definition=function(theObject, xVal, yVal)
	      {
		  theObject@x <- xVal
		  theObject@y <- yVal
		  return(theObject)
	      }
	      )

z <- FirstQuadrant(x=2.5, y=10)
z <- setCoordinate(z, -3.0, -5.0)


# inheritance
February <- setClass(
		     "February",
		     slots = character(0),
		     prototyep = list(),
		     validity=function(object)
		     {
			 if((object@x < 10) || (object@y < 10)){
			     return("A number less than 10 for one of the coordinates was given.")
			 } 
			 return(TRUE)
		     },

		     # set the inheritance for this class
		     contains = "FirstQuadrant"

		     )
