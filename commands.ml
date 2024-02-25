type command = {
  id : string;
  command : string;
  restart : bool;
  status : string;
}

type data = { last_id : string; commands : command list }
