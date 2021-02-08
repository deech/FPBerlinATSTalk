staload "prelude/DATS/integer.dats"
staload "prelude/DATS/filebas.dats"
staload "prelude/DATS/option.dats"

fun {a:t@ype} read_input():Option(a) =
  let
    var result: a?
    val success = fileref_load<a> (stdin_ref,result)
  in
  if success then
    let prval () = opt_unsome(result) in Some(result) end
  else
    let prval () = opt_unnone(result) in None end
  end

fun go {n:int| n >= 1; n <= 10} (len:int n):void =
  begin
    println! ("Enter a number to add to the array:");
    case+ read_input<int>() of
    | Some(n) => println! ("Got: ", n)
    | None => println! ("Not a number!")
  end

implement main0() =
  begin
    println! ("Length of array? (1-10):");
    case+ read_input<int>() of
    | Some(len) =>
        let
          val len = g1ofg0(len)
        in
        if (len >= 1) * (len <= 10) then
          go(len)
        else
          println! ("Please enter a number between 1 and 10")
        end
    | None =>
        println! ("Not a number!")
   end
