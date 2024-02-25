(*

let argsAfterFirst = Sys.argv |> Array.to_list |> List.tl

let () =
  match argsAfterFirst with
  | "-background" :: _ -> Server.run ()
  | _ -> print_endline "-- REACHED _ IN MATCH --" *)

(* Define a record *)
(* `[@@deriving yaml]` generates a bunch of functions, one being `book_to_yaml` to convert the record into a Yaml type, another `book_of_yaml` to convert Yaml type to record *)

(* type command = {
     id : string;
     command : string;
     restart : bool;
     status : string;
   }
   [@@deriving yaml]

   type datarecord = { last_id : string; commands : command list }
   [@@deriving yaml] *)
