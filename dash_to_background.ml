let argsAfterFirst = Sys.argv |> Array.to_list |> List.tl

let () =
  match argsAfterFirst with
  | "background" :: _ -> Server.run ()
  | _ -> print_endline "-- REACHED _ IN MATCH --"
