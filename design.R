  require(DoE.base);
  pi_doe <- fac.design (
           nfactors=2,
           replications=30,
           repeat.only=FALSE,
           blocks=1,
           randomize=TRUE,
           seed=10373,
           nlevels=c(5, 7),
           factor.names=list(
                version=c("base", "critical", "false_sharing", "reduction", "seq"),
                threads=c(1, 2, 4, 8, 10, 20, 40)
           ));

  export.design(pi_doe,
                path=".",
                filename="pi_doe_hype",
                type="csv",
                replace=TRUE,
                response.names=c("time"));

  pi_doe <- fac.design (
           nfactors=2,
           replications=30,
           repeat.only=FALSE,
           blocks=1,
           randomize=TRUE,
           seed=10373,
           nlevels=c(5, 6),
           factor.names=list(
                version=c("base", "critical", "false_sharing", "reduction", "seq"),
                threads=c(1, 2, 4, 8, 16, 32)
           ));

  export.design(pi_doe,
                path=".",
                filename="pi_doe_draco",
                type="csv",
                replace=TRUE,
                response.names=c("time"));

  pi_doe <- fac.design (
           nfactors=2,
           replications=30,
           repeat.only=FALSE,
           blocks=1,
           randomize=TRUE,
           seed=10373,
           nlevels=c(5, 5),
           factor.names=list(
                version=c("base", "critical", "false_sharing", "reduction", "seq"),
                threads=c(1, 2, 4, 8, 16)
           ));

  export.design(pi_doe,
                path=".",
                filename="pi_doe_tupi",
                type="csv",
                replace=TRUE,
                response.names=c("time"));
