local a=require('treesj.langs.utils')return{parameter_list=a.set_preset_for_args(),argument_list=a.set_preset_for_args(),initializer_list=a.set_preset_for_list(),compound_statement=a.set_preset_for_statement({both={separator=';',last_separator=true,no_format_with={'compound_statement'},recursive=false}}),enumerator_list=a.set_preset_for_list(),if_statement={target_nodes={'compound_statement'}},declaration={target_nodes={'parameter_list','argument_list','initializer_list'}},call_expression={target_nodes={'argument_list'}},enum_specifier={target_nodes={'enumerator_list'}}}