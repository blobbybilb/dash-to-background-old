let run_command_and_append_out_to_file cmd output_file =
  let out = open_out_gen [ Open_append; Open_creat ] 0o666 output_file in
  let pid =
    Unix.create_process cmd [| cmd |] Unix.stdin
      (Unix.descr_of_out_channel out)
      Unix.stderr
  in
  let _, status = Unix.waitpid [] pid in
  close_out out;
  status

let test_it () =
  let output_file = "output.txt" in
  let cmd = "echo" in
  let status = run_command_and_append_out_to_file cmd output_file in
  assert (status = Unix.WEXITED 0);
  let out = open_in output_file in
  (* let line = input_line out in *)
  (* assert (line = "echo"); *)
  close_in out;
  Unix.unlink output_file
