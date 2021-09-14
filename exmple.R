library('data.table')
library('headtest')

blarg <- function(...){
  r = data.table::data.table(...)
  data.table::setattr(r, 'class', c('blarg', class(r)))
  r
}

"[.blarg" <- function(x, i, j, by, ...){
  mc <- match.call()
  mc[[1]] <- quote(data.table:::`[.data.table`)
  res = eval.parent(mc)
}
a = data.table(1:10)
b = blarg(1:10)

head(a)
head(b)
