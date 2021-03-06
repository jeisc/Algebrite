# Bignum prime test (returns 1 if prime, 0 if not)

# Uses Algorithm P (probabilistic primality test) from p. 395 of
# "The Art of Computer Programming, Volume 2" by Donald E. Knuth.




mprime = (n) ->
	return n.isProbablePrime()

#if SELFTEST

test_mprime = ->
	i = 0
	k = 0
	m = 0
	t = 0
	logout("test mprime\n")
	k = 0
	for i in [0...10000]
		n = mint(i)
		t = mprime(n)
		if (i == primetab[k])
			if (t == 0)
				throw new Error("failed for prime number " + i)
			k++
		else if (t == 1)
			throw new Error("failed for composite number " + i)
	logout("ok\n")

#endif
