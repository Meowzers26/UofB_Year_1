-- comments🤯
-- /= is 'does not equal'
-- div 10 2 produces the same result as 10 `div` 2
-- whitespace doesn't generally matter <3
-- if ..... then ...... else ......     -->     must have else statement
--      | (condition) -> in this case... (replaces if and else if)
--      = -> replaces then
--      | otherwise -> replaces else


-- :l load new file         (one argument)
-- :r reload                (no arguments)
-- fst [tuple]              takes the first component
-- snd [tuple]              takes the second component
-- "_"                      a hole for placeholder, tells us what type should go there (won't compile)
-- lowercase types (a0)     type doesn't matter / is ambiguous
-- functions                argument -> argument -> return


-- ⚠️RECURSION⚠️
-- induction...start with a base case and work backwards


-- types:
-- Int(eger) (diff sizes) -> the type of integers
-- String -> text (double quotation marks)
-- Bool -> booleans
-- Char -> single character (single quotation marks)
-- tuples = (Integer, String) -> format for typing tuples
-- lists = [1, 2, 3]

-- type error when expected type and actual type do not match


-- LISTS
-- (:)          takes two arguments, one on left one on right
--              adds something to the front of a list
--              True : (False : [])     =   True : False : []   ->      [True, False]