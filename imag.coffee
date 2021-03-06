###
 Returns the coefficient of the imaginary part of complex z

	z		imag(z)
	-		-------

	a + i b		b

	exp(i a)	sin(a)
###



Eval_imag = ->
	push(cadr(p1))
	Eval()
	imag()

imag = ->
	save()
	rect()
	p1 = pop()
	push(p1)
	push(p1)
	conjugate()
	subtract()
	push_integer(2)
	divide()
	push(imaginaryunit)
	divide()
	restore()

test_imag = ->
	run_test [

		"imag(a+i*b)",
		"b",

		"imag(1+exp(i*pi/3))",
		"1/2*3^(1/2)",

		"imag(i)",
		"1",

		"imag((-1)^(1/3))",
		"1/2*3^(1/2)",

		"imag(-i)",
		"-1",
	]