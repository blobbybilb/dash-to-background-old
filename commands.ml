let get_feather_command shell cmd out =
  let open Feather in
  let open Feather.Infix in
  process shell [ "-c"; cmd ] >> out

let run shell cmd out = get_feather_command shell cmd out |> Feather.run

let run_get_pid shell cmd out =
  let out_descr = Unix.openfile out [ Unix.O_APPEND ] 0o640 in

  Unix.create_process shell [| "-c"; cmd |] Unix.stdin out_descr out_descr
