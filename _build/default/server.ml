let router =
  Dream.router
    [
      Dream.get "/list-commands" (fun _ -> Dream.json "Good morning, world!");
      Dream.get "/:word" (fun request ->
          Dream.html (Dream.param request "word"));
    ]

let run () = Dream.run ~port:8080 @@ Dream.logger @@ router
