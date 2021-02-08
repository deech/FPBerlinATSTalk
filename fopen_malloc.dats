%{
  #include <stdio.h>
  #include <stdlib.h>
%}

fun malloc
  {a:t@ype}
  (s:sizeof_t a):
  [l:addr | l > null] (a? @ l | ptr l)
  = "ext#malloc"

implement main0 () = let
  val (pf | i) = malloc (sizeof<int>)
  val (pfset | ()) = ptr_set(pf | i, 10)
  val (pfFile | fp) = fopen("test.txt", "r")
in
  free(pfset | i);
  fclose(pfFile | fp);
end
