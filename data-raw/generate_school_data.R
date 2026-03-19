## Script to generate school_data dataset
## Run once to create data/school_data.rda

set.seed(42)

n_schools  <- 100
n_students <- 30
N          <- n_schools * n_students

school     <- rep(seq_len(n_schools), each = n_students)
climate    <- rep(stats::rnorm(n_schools, mean = 0, sd = 1), each = n_students)
u0         <- rep(stats::rnorm(n_schools, mean = 0, sd = 3), each = n_students)
u1         <- rep(stats::rnorm(n_schools, mean = 0, sd = 0.5), each = n_students)

ses        <- stats::rnorm(N, mean = 0, sd = 1)
gender     <- factor(sample(c("female", "male"), N, replace = TRUE))

# True model: math ~ 2 + 1.5*ses + 0.8*climate + 0.5*ses*climate + 0.3*(gender==male) + u0 + u1*ses + e
math <- 50 +
        1.5 * ses +
        0.8 * climate +
        0.5 * ses * climate +
        0.3 * (gender == "male") +
        u0 + u1 * ses +
        stats::rnorm(N, mean = 0, sd = 5)

school_data <- data.frame(
  school  = factor(school),
  student = seq_len(N),
  math    = round(math, 2),
  ses     = round(ses, 3),
  climate = round(climate, 3),
  gender  = gender
)

usethis::use_data(school_data, overwrite = TRUE)
