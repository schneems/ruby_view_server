
## functions can take in a block similar to the way Array#each can
#   i.e. [1,2,3].each {|x| x + 1}

## here we are providing a function called `wrap_around_contents` when a block is passed to it, it will yield to the block
def wrap_around_contents
  "hey your contents =>| #{yield} |<= have been wrapped"
end


puts wrap_around_contents { " my contents" }
## We can call the function and provide it a block it will give us this output
# => "hey your contents =>| my contents |<= have been wrapped"


