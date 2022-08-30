#' Conveniently print loop iterations to console
#'
#' @description Place inside a loop to automatically and conveniently print the
#' current loop iteration at exponentially disparate (or custom) intervals.
#' @name iteration
#'
#' @usage iteration(iterator_name, iteration_values)
#'
#' @param iterator_name The name of the loop iterator (e.g. "i")
#' @param iteration_values An integer vector specifying loop iterations
#'     (defaults to the sequence 1, 2, 5, 10, 20, 50, 100, 200, 500 ....)
#'
#' @return iteration() is a non-value-returning function. As such, it will not
#'     return anything, and instead print to console the value representing the
#'     current loop iteration.
#' @export
#'
#' @examples
#'
#' # For a loop that would otherwise give no feedback as to where it is up to,
#' # simply include iteration() anywhere inside the loop to show progress
#'
#' for(i in 1:10000) {
#'   2 * 2
#'   iteration()
#' }
#' # 10
#' # 20
#' # 50
#' # 100
#' # 200
#' # 500
#' # 1,000
#' # 2,000
#' # 5,000
#' # 10,000
#' # 20,000
#' # 50,000
#'
#'
#'
#' # To use an iterator other than 'i' (example: 'page')
#' for(page in 1:10000) {
#'   2 * 2
#'   iteration("page")
#' }
#' # 10
#' # 20
#' # 50
#' # 100
#' # 200
#' # 500
#' # 1,000
#' # 2,000
#' # 5,000
#' # 10,000
#'
#' # Use custom iteration intervals
#' for(i in 1:10000) {
#'   2 * 2
#'   iteration(iteration_values = seq(0, 1e4, 1e3))
#' }
#'
#' # 1,000
#' # 2,000
#' # 3,000
#' # 4,000
#' # 5,000
#' # 6,000
#' # 7,000
#' # 8,000
#' # 9,000
#' # 10,000

iteration <- function(iterator_name, iteration_values) {
  if(missing(iteration_values)) {
    iteration_values <- rep(c(1,2,5), 10) * (10 ^ (sort(rep(1:30, 3))))
    }
  if(missing(iterator_name)) { iterator_name <- "i" }
  iteration <- get(iterator_name)
  if(any(iteration == iteration_values)) {
    cat(paste0(format(iteration, big.mark=",", scientific=FALSE), "\n"))
    }
}
