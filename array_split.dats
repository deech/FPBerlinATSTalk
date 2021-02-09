#include "share/atspre_staload.hats"

extern
prfun
array_v_split
  {a:t@ype}
  {l:addr}{n,i:nat | i <= n}
(
  pfarr: array_v (a, l, n)
) : (array_v (a, l, i), array_v (a, l+i*sizeof(a), n-i))


primplement
array_v_split
  {a}{l}{n,i}(pfarr) = let
  prfun split
    {l:addr}{n,i:nat | i <= n} .<i>.
  (
    pfarr: array_v (a, l, n)
  ) : (
    array_v (a, l, i)
  , array_v (a, l+i*sizeof(a), n-i)
  ) =
    sif i > 0 then let
      prval (pf1, pf2arr) = array_v_uncons pfarr
      prval (pf1res1, pf1res2) = split{..}{n-1,i-1} (pf2arr)
    in
      (array_v_cons (pf1, pf1res1), pf1res2)
    end else let
      prval EQINT () = eqint_make{i,0}((*void*))
    in
      (array_v_nil (), pfarr)
    end
in
  split
end

extern
fun{
a:t@ype
} arrget{l:addr}{n,i:nat | i < n}
  (pf: array_v (a, l, n) | p: ptr l, i: int i):
  (array_v(a,l,i), array_v (a, l+i*sizeof(a), n-i)| void)

implement{a}
arrget{l}{n,i}
  (pf |p, i) = () where {prval (pf1, pf2) = array_v_split{a}{l}{n,i}(pf)}

implement main0() = println! ("hello")
