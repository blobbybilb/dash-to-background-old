let run_get_pid shell cmd out =
  let out_descr =
    Unix.openfile out [ Unix.O_RDWR; Unix.O_CREAT; Unix.O_APPEND ] 0o640
  in

  let null_input = Unix.openfile "/dev/null" [ O_RDONLY ] 0o000 in

  Unix.create_process shell [| shell; "-c"; cmd |] null_input out_descr
    out_descr

(* let runstuff =
   let shell = "/bin/sh" in
   let cmd = "while true; do echo hi1; sleep 1; done" in
   let out = "/Users/blob/Developer/dash-to-background/out.txt" in
   let pid = run_get_pid shell cmd out in
   print_endline ("pid: " ^ string_of_int pid);
   Unix.kill pid *)
