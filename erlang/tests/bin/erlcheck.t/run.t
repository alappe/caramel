  $ cat rebind.erl
  -module(rebind).
  
  f(X) -> case X of Y -> ok end.
  g(Z) -> case Z of Z -> ok end.
  $ erldump parse rebind.erl
  ((Module_attribute
     ((atr_name (Atom module))
       (atr_value (Expr_literal (Lit_atom (Atom rebind))))))
    (Function_decl
      ((fd_name (Atom f)) (fd_arity 1)
        (fd_cases
          (((c_lhs ((Pattern_binding (Var_name X)))) (c_guard ())
             (c_rhs
               (Expr_case (Expr_name (Var_name X))
                 (((c_lhs ((Pattern_binding (Var_name Y)))) (c_guard ())
                    (c_rhs (Expr_literal (Lit_atom (Atom ok)))))))))))
        (fd_spec ())))
    (Function_decl
      ((fd_name (Atom g)) (fd_arity 1)
        (fd_cases
          (((c_lhs ((Pattern_binding (Var_name Z)))) (c_guard ())
             (c_rhs
               (Expr_case (Expr_name (Var_name Z))
                 (((c_lhs ((Pattern_binding (Var_name Z)))) (c_guard ())
                    (c_rhs (Expr_literal (Lit_atom (Atom ok)))))))))))
        (fd_spec ()))))
  $ erlcheck rebind rebind.erl
  We found a rebinding of: Z
  [1]