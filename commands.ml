let run shell cmd out =
  let open Feather in
  let open Feather.Infix in
  process shell [ "-c"; cmd ] >> out |> run
