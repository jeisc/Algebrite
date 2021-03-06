# For example, the number of five card hands is choose(52,5)
#
#                          n!
#      choose(n,k) = -------------
#                     k! (n - k)!



Eval_choose = ->
	push(cadr(p1))
	Eval()
	push(caddr(p1))
	Eval()
	choose()

# Result vanishes for k < 0 or k > n. (A=B, p. 19)

#define N p1
#define K p2

choose = ->
	save()

	p2 = pop()
	p1 = pop()

	if (choose_check_args() == 0)
		push_integer(0)
		restore()
		return

	push(p1)
	factorial()

	push(p2)
	factorial()

	divide()

	push(p1)
	push(p2)
	subtract()
	factorial()

	divide()

	restore()

choose_check_args = ->
	if (isnum(p1) && lessp(p1, zero))
		return 0
	else if (isnum(p2) && lessp(p2, zero))
		return 0
	else if (isnum(p1) && isnum(p2) && lessp(p1, p2))
		return 0
	else
		return 1


test_choose = ->
	run_test [
		"choose(52,5)",
		"2598960",

		"choose(n,k)",
		"n!/(k!*(-k+n)!)",

		"choose(0,k)",
		"1/(k!*(-k)!)",

		"choose(n,0)",
		"1",

		"choose(-1,k)",
		"0",

		"choose(n,-1)",
		"0",
	]

