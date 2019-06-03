#' Finds and optionally removes all packages not included with a base R install.

find_custom_pkgs = function() {
  pkgs <- as.data.frame(installed.packages())
  pkgs <- subset(pkgs, !grepl("MRO", pkgs$LibPath))
  pkgs <- pkgs[!(pkgs[,"Priority"] %in% c("base", "recommended")),]

  path_lib <- unique(pkgs$LibPath)
  to_remove <- as.vector(pkgs[,1], mode = 'character')
  return(to_remove)
}

to_remove <- find_custom_pkgs()
if (length(to_remove) == 0) {
  cat('No custom packages found. Quiting...')
} else {
  cat('Found', length(to_remove), ' custom packages:\n--------------------\n')
  cat(to_remove, sep = '\n')
  cat('--------------------\nWould you like to remove them all (Y/n)? ')
  if (readline() == 'Y') {
    sapply(to_remove, remove.packages, lib = path_lib)
    cat('Done! All custom packages successfully removed.')
  } else {
    cat('Quiting...')
  }
}
