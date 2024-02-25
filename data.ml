type command = {
  id : string;
  command : string;
  restart : bool;
  status : string;
}
[@@deriving yaml]

type datarecord = { last_id : string; commands : command list }
[@@deriving yaml]

let serialize datarecord =
  let yaml = datarecord_to_yaml datarecord in
  match Yaml.to_string yaml with Ok s -> s | Error (`Msg e) -> failwith e

let deserialize s =
  let yaml = Yaml.of_string s in
  match yaml with
  | Ok yaml -> (
      match datarecord_of_yaml yaml with
      | Ok dr -> dr
      | Error (`Msg e) -> failwith e)
  | Error (`Msg e) -> failwith e

let save datarecord =
  let s = serialize datarecord in
  let oc = open_out "data.yml" in
  Printf.fprintf oc "%s" s;
  close_out oc

let load () =
  let ic = open_in "data.yml" in
  let s = really_input_string ic (in_channel_length ic) in
  close_in ic;
  deserialize s
