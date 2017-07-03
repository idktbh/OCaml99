(* Determine whether a given integer number is prime. *)
(* TODO *)
let int_sqrt x = Float.iround_towards_zero_exn (sqrt (float_of_int x))

let is_prime n =
    let rec aux div = if div * div <= n then true else
        if n mod div = 0 || n mod (div + 2) = 0 then false
        else aux (div + 6)
    in
    if n <= 1                     then false else
    if n <= 3                     then true  else
    if n mod 2 = 0 or n mod 3 = 0 then false else aux 5

(* A list of prime numbers. *)
let is_prime_array n =
    (* Let ints be an array of Boolean values, indexed by integers
     * 0 to n, initially all set to true. Of course 0 and 1 are not
     * primes and as such must be set to false. *)
    let ints = Array.create (n + 1) true in
    ints.(0) <- false;
    ints.(1) <- false;
    let lim = int_sqrt n in
    (* TODO explain *)
    for i = 2 to lim do print_int i;
        if ints.(i) then
            let multiple = ref (i * i) in
            while (!multiple <= n) do
                print_int !multiple;
                ints.(!multiple) <- false;
                multiple := !multiple + i (* next multiple *)
            done
    done;
    ints

let primes_seq n = is_prime_array n
    |> Array.foldi ~init:[] ~f:(fun ix acc is_prime ->
        if is_prime then (ix :: acc) else acc)
    |> List.rev

(* TODO Benchmark
 * seq 1 n |> List.filter ~f:is_prime
 * vs
 * primes_seq n
 *)

(* Determine the greatest common divisor of two positive integer numbers. *)
let rec gcd a b = if b = 0 then a else gcd b (a mod b)

(* Determine whether two positive integer numbers are coprime. *)
let coprime a b = (gcd a b) = 1

(* Calculate Euler's totient function phi(n). *)
let seq lb ub =
    let rec aux lb ub = if lb > ub then [] else lb :: aux (lb + 1) ub in
    aux lb ub

let phi n  = seq 1 (n - 1)
    |> List.filter ~f:(fun x -> coprime x n)
    |> List.length

(* Determine the prime factors of a given positive integer. *)
(* TODO Clean *)
let prime_factors n =
    let primes = primes_seq n in
    let rec aux cur_n ps fs =
        (* TODO Clean up this pred both may not be ness idk *)
        (* len predicate rm may need no (hd|tl)_exns used below *)
        if List.length ps < 1 || cur_n <= 1 then fs
        else if cur_n mod div = 0 then
            aux (cur_n / div) ps (List.hd_exn ps :: fs)
        else
            aux cur_n (List.tail_exn ps) fs
    in aux n (List.rev primes) []

(* Determine the prime factors of a given positive integer (2). *)
let pack l =
    let equal = Int.equal in
    let inc counts elt =
        let c = match List.Assoc.find ~equal counts elt with
            | None -> 0
            | Some x -> x
        in List.Assoc.add ~equal counts elt (c + 1)
    in List.fold l ~init:[] ~f:inc

let prime_factor_pairs n = prime_factors n |> pack

(* Calculate Euler's totient function phi(n) (improved).
 * If the list of the prime factors of a number m is known in the form
 * of [(p, e); ...] where p is the prime factor and e is the exponent
 * then the function phi(n) can be efficiently calculated as follows:
 *  phi n = (((p1 - 1) * p1) ** (e1 - 1)) + ...
 *)
let int_exp x y = (float_of_int x) ** (float_of_int y) |> int_of_float
let phi' n =
    let phi_fn acc (p, e) = acc + (int_exp ((p - 1) * p) (e - 1)) in
    prime_factor_pairs n |> List.fold ~init:0 ~f:phi_fn

(*  Goldbach's conjecture says that every positive even number greater than 2
 *  is the sum of two prime numbers. Example: 28 = 5 + 23. It is one of the
 *  most famous facts in number theory that has not been proved to be correct
 *  in the general case. It has been numerically confirmed up to very large
 *  numbers (much larger than we can go). Write a function to find the two
 *  prime numbers that sum up to a given even integer.
 *  *)
let goldbach n = 

(* A list of Goldbach compositions. *)
let goldbach_list ~lb ~ub = seq ~lb ~ub |> List.map ~f:(fun x -> goldbach x)
