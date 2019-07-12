module Language.PureScript.CodeGen.Runtime
  (

    -- any: dynamic runtime types
    any
  , anyMut

    -- any: built-ins
  , purs_any_app
  , purs_any_eq_int
  , purs_any_eq_num
  , purs_any_eq_char
  , purs_any_eq_string
  , purs_any_get_cons
  , purs_any_get_int
  , purs_any_get_record
  , purs_any_get_array
  , purs_any_true
  , purs_any_false
  , purs_any_null
  , purs_any_int_zero
  , purs_any_num_zero
  , purs_any_int_one
  , purs_any_num_one

    -- any: built-ins (added for code-gen)
  , purs_any_app
  , purs_any_int_neg

    -- any: allocations
  , purs_any_cont
  , purs_any_array
  , purs_any_cons
  , purs_any_record
  , purs_any_int
  , purs_any_num
  , purs_any_string
  , purs_any_char
  , purs_any_copy

    -- code-gen helpers
  , purs_malloc_many
  , _PURS_SCOPE_T
  , _PURS_CONS_VALUES_NEW
  , purs_indirect_thunk_new
  , purs_indirect_value_new
  , purs_indirect_value_assign
  , purs_any_int_set_mut
  , purs_any_assign_mut
  , _PURS_ANY_THUNK_DECL
  , _PURS_ANY_THUNK_DEF

    -- misc
  , purs_any_fun_t
  , purs_cons_t
  , purs_record_t
  , purs_cons_get_tag
  , purs_vec_new_va
  , purs_record_empty
  , purs_record_find_by_key
  , purs_record_copy_shallow
  , purs_record_add_multi
  , purs_record_new_from_kvps
  , purs_assert
  , purs_assert'

    -- ...
  , void
  ) where

import Prelude

import Data.Either (Either(..))
import Language.PureScript.CodeGen.C.AST (AST)
import Language.PureScript.CodeGen.C.AST as AST
import Language.PureScript.CodeGen.C.AST as Type

void :: Array AST.TypeQualifier -> AST.Type
void = Type.RawType "void"

anyMut :: AST.Type
anyMut = Type.Pointer (Type.Any [])

any :: AST.Type
any = Type.Any []

purs_any_fun_t :: AST.Type
purs_any_fun_t = Type.RawType "purs_any_fun_t" []

purs_record_t :: String
purs_record_t = "purs_record_t"

purs_cons_t :: String
purs_cons_t = "purs_cons_t"

purs_any_num_one :: AST
purs_any_num_one = AST.Var "purs_any_num_one"

purs_any_int_one :: AST
purs_any_int_one = AST.Var "purs_any_int_one"

purs_any_num_zero :: AST
purs_any_num_zero = AST.Var "purs_any_num_zero"

purs_any_int_zero :: AST
purs_any_int_zero = AST.Var "purs_any_int_zero"

purs_any_null :: AST
purs_any_null = AST.Var "purs_any_null"

purs_any_false :: AST
purs_any_false = AST.Var "purs_any_false"

purs_any_true :: AST
purs_any_true = AST.Var "purs_any_true"

purs_any_eq_int :: AST
purs_any_eq_int = AST.Var "purs_any_eq_int"

purs_any_eq_num :: AST
purs_any_eq_num = AST.Var "purs_any_eq_num"

purs_any_eq_char :: AST
purs_any_eq_char = AST.Var "purs_any_eq_char"

purs_any_eq_string :: AST
purs_any_eq_string = AST.Var "purs_any_eq_string"

purs_any_get_int :: AST
purs_any_get_int = AST.Var "purs_any_get_int"

purs_any_get_cons :: AST
purs_any_get_cons = AST.Var "purs_any_get_cons"

purs_any_get_record :: AST
purs_any_get_record = AST.Var "purs_any_get_record"

purs_any_get_array :: AST
purs_any_get_array = AST.Var "purs_any_get_array"

purs_cons_get_tag :: AST
purs_cons_get_tag = AST.Var "purs_cons_get_tag"

purs_any_app :: AST
purs_any_app = AST.Var "purs_any_app"

purs_record_new_from_kvps :: AST
purs_record_new_from_kvps = AST.Var "purs_record_new_from_kvps"

purs_record_find_by_key :: AST
purs_record_find_by_key = AST.Var "purs_record_find_by_key"

purs_record_copy_shallow :: AST
purs_record_copy_shallow = AST.Var "purs_record_copy_shallow"

purs_record_add_multi :: AST
purs_record_add_multi = AST.Var "purs_record_add_multi"

purs_vec_new_va :: AST
purs_vec_new_va = AST.Var "purs_vec_new_va"

_PURS_ANY_THUNK_DEF :: AST
_PURS_ANY_THUNK_DEF = AST.Var "PURS_ANY_THUNK_DEF"

_PURS_ANY_THUNK_DECL :: AST
_PURS_ANY_THUNK_DECL = AST.Var "PURS_ANY_THUNK_DECL"

purs_any_cons :: AST
purs_any_cons = AST.Var "purs_any_cons"

purs_any_int :: AST
purs_any_int = AST.Var "purs_any_int"

purs_any_char :: AST
purs_any_char = AST.Var "purs_any_char"

purs_any_num :: AST
purs_any_num = AST.Var "purs_any_num"

purs_any_array :: AST
purs_any_array = AST.Var "purs_any_array"

purs_any_record :: AST
purs_any_record = AST.Var "purs_any_record"

purs_any_cont :: AST
purs_any_cont = AST.Var "purs_any_cont"

purs_any_string :: AST
purs_any_string = AST.Var "purs_any_string"

purs_any_copy :: AST
purs_any_copy = AST.Var "purs_any_copy"

purs_indirect_thunk_new :: AST
purs_indirect_thunk_new = AST.Var "purs_indirect_thunk_new"

purs_indirect_value_new :: AST
purs_indirect_value_new = AST.Var "purs_indirect_value_new"

purs_indirect_value_assign :: AST
purs_indirect_value_assign = AST.Var "purs_indirect_value_assign"

purs_any_int_set_mut :: AST
purs_any_int_set_mut = AST.Var "purs_any_int_set_mut"

purs_any_assign_mut :: AST
purs_any_assign_mut = AST.Var "purs_any_assign_mut"

_PURS_CONS_VALUES_NEW :: AST
_PURS_CONS_VALUES_NEW = AST.Var "PURS_CONS_VALUES_NEW"

purs_malloc_many :: AST
purs_malloc_many = AST.Var "purs_malloc_many"

_PURS_SCOPE_T :: AST
_PURS_SCOPE_T = AST.Var "PURS_SCOPE_T"

purs_record_empty :: AST
purs_record_empty = AST.Var "purs_record_empty"

purs_assert :: AST -> String -> AST
purs_assert condAst message =
  AST.App (AST.Var "purs_assert")
    [ condAst
    , AST.StringLiteral "%s"
    , AST.StringLiteral message
    ]

purs_assert' :: String -> AST
purs_assert' = purs_assert $ AST.NumericLiteral (Left 0)

purs_any_int_neg :: AST
purs_any_int_neg = AST.Var "purs_any_int_neg"
