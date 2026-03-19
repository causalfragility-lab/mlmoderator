#' Simulated school achievement dataset
#'
#' A simulated two-level dataset with students nested within schools, designed
#' to illustrate multilevel moderation analysis. The true data-generating model
#' includes a cross-level interaction between student SES and school climate.
#'
#' @format A data frame with 3,000 rows (100 schools -- 30 students) and 6 columns:
#' \describe{
#'   \item{school}{Factor. School identifier (1---100).}
#'   \item{student}{Integer. Student identifier (1---3000).}
#'   \item{math}{Numeric. Mathematics achievement score.}
#'   \item{ses}{Numeric. Student socioeconomic status (standardized).}
#'   \item{climate}{Numeric. School climate rating (standardized, level-2 variable).}
#'   \item{gender}{Factor. Student gender (`"female"`, `"male"`).}
#' }
#'
#' @details
#' The data were generated using:
#' \deqn{math_{ij} = 50 + 1.5 \cdot ses_{ij} + 0.8 \cdot climate_j +
#'   0.5 \cdot ses_{ij} \times climate_j + u_{0j} + u_{1j} \cdot ses_{ij} + e_{ij}}
#'
#' Level-2 random effects: \eqn{u_{0j} \sim N(0, 9)},
#' \eqn{u_{1j} \sim N(0, 0.25)}, residuals \eqn{e_{ij} \sim N(0, 25)}.
#'
#' @examples
#' data(school_data)
#' head(school_data)
#' str(school_data)
#'
#' \dontrun{
#' library(lme4)
#' mod <- lmer(math ~ ses * climate + gender + (1 + ses | school),
#'             data = school_data)
#' mlm_probe(mod, pred = "ses", modx = "climate")
#' }
"school_data"
