local a=require('treesj.langs.utils')return{argument_list=a.set_preset_for_args(),formal_parameters=a.set_preset_for_args(),block=a.set_preset_for_statement(),constructor_body=a.set_preset_for_statement(),array_initializer=a.set_preset_for_list(),annotation_argument_list=a.set_preset_for_args(),enum_body=a.set_preset_for_dict(),enum_declaration={target_nodes={'enum_body'}},if_statement={target_nodes={'block'}},annotation={target_nodes={'annotation_argument_list'}},method_declaration={target_nodes={'block'}},variable_declarator={target_nodes={'array_initializer'}},constructor_declaration={target_nodes={'constructor_body'}}}
