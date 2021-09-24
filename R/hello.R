#' Silly little wrapper to data.table
#' @param ... passed along to data.table::data.table
#' @importFrom data.table data.table setattr
#' @export
blarg <- function(...){
  r = data.table::data.table(...)
  data.table::setattr(r, 'class', c('blarg', class(r)))
  r
}

#' @rdname blarg
#' @export
blarg2 <- function(...){
  r = data.table::data.table(...)
  data.table::setattr(r, 'class', c('blarg2', class(r)))
  r
}

#' @rdname blarg
#' @export
blarg3 <- function(...){
  r = data.table::data.table(...)
  data.table::setattr(r, 'class', c('blarg3', class(r)))
  r
}

#' @rdname blarg
#' @export
blarg4 <- function(...){
  r = data.frame(...)
  class(r) = c('blarg4', class(r))

  r
}


#' Custom extract function (or subset or whatever) for dtsurveys. A loose wrapper over `[.data.table`
#' @param x a dtsurvey object
#' @param i i in the data.table format
#' @param j j in the data.table format
#' @param by by in the data.table format
#' @param ... extra options passed to data table
#' @export
#' @name extract
"[.blarg" <- function(x, i, j, by, ...){
  mc <- match.call()

  #ordinarily, some messing of mc would go here

  mc[[1]] <- quote(data.table:::`[.data.table`)
  res = eval.parent(mc)
}

#' @rdname extract
#' @export
"[.blarg4" <- function(...){

  mc <- match.call()

  print('b4')

  #ordinarily, some messing of mc would go here

  mc[[1]] <- quote(base:::`[.data.frame`)
  res = eval.parent(mc)
}


#' Custom extract function (or subset or whatever) for dtsurveys. A loose wrapper over `[.data.table`
#' @param x a dtsurvey object
#' @param i i in the data.table format
#' @param j j in the data.table format
#' @param by by in the data.table format
#' @param ... extra options passed to data table
#' @export
#' @name extract
"[.blarg2" <- function(x, i, j, by, ...){
  mc <- match.call()
  mc[[1]] <- quote(data.table:::`[.data.table`)
  res = eval.parent(mc)
}

#' Custom head
#' @noRd
#' @importFrom utils head
#' @exportS3Method
head.blarg <- function (x, n = 6L, ...)
{
  #cat('turtle')
  stopifnot(length(n) == 1L)
  i = seq_len(if (n < 0L) max(nrow(x) + n, 0L) else min(n, nrow(x)))
  x[i, , ]
}
