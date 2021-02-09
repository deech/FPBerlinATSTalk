#include "share/atspre_staload.hats"

fun {a:t@ype} read_input():Option_vt(a) =
  let
    var result: a?
    val success = fileref_load<a> (stdin_ref,result)
  in
  if success then
    let prval () = opt_unsome(result)
    in Some_vt(result) end
  else
    let prval () = opt_unnone(result)
    in None_vt end
  end

fun make_array {n:int| n >= 1; n <= 10} (len:int n): [l:addr] arrayptr(int,l,n) =
  let
    implement array_tabulate$fopr<int> (i) = sz2i i
  in
    arrayptr_tabulate<int>(i2sz len)
  end

implement main0() =
  begin
    println! ("Length of array? (1-10):");
    case+ read_input<int>() of
    | ~None_vt() =>
        println! ("Not a number!")
    | ~Some_vt(len) =>
        let
          val len = g1ofg0(len)
        in
        if (len >= 1) * (len <= 10) then
          let
            val arr = make_array(len)
          in
            begin
              fprint_arrayptr<int>(stdout_ref,arr,i2sz len);
              arrayptr_free(arr);
            end
          end
        else
          println! ("Please enter a number between 1 and 10")
        end
   end
