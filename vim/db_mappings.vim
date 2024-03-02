" Db Migration BAse
nnoremap <silent> ,dmba ggO# frozen_string_literal: true<esc><down>O<esc>o# ChangeTopLevelDocumentation<esc>/ChangeTopLevelDocumentation<return>
" Db Migration Up Down
nnoremap <silent> ,dmud adef up<return># DeleteThis - insert migration methods for up<return><backspace><backspace>end<return><return>def down<space><backspace><return># DeleteThis - insert migration methods for down<return>DeleteThis - NOTE: if dropping table, no need to remove columns or indexes because they will be removed when dropping table<return>DeleteThis - NOTE if removing column, no need to remove index for that column, because they will be removed whyen removing column<return><backspace><backspace>end<esc>/DeleteThis<return>
" Db Migration Add Index
nnoremap <silent> ,dmai a# DeleteThis - remove "unique: true," if index does not need to be unique<space><backspace><return><backspace><backspace>add_index :ChangeTableName, %i[ChangeAttributeOrAttributesIfMultiple], unique: true, name: :index_ChangeTableName_on_ChangeAttributeOrAttributesIfMultiple<esc>/ChangeTableName\\|ChangeAttributeOrAttributesIfMultiple\\| unique: true,\\|DeleteThis<return>
" Db Migration Add Index (case insensitive)
nnoremap <silent> ,dmaI a# DeleteThis - Change migration to Up / Down if not already changed<space><backspace><return>DeleteThis - for unique even when a specific attribute may be nil, and using postgres 15, add NULLS NOT UNIQUE<space><backspace><return>If using 14 or earlier, follow these steps:<space><backspace><return>1) duplicate the existing index<space><backspace><return>2) remove the attribute<space><backspace><return>3) add 'WHERE ChangeAttribute IS NULL' to the end<space><backspace><return>4) update the index name<space><backspace><return><backspace><backspace>execute <<-SQL<space><backspace><return><tab>CREATE UNIQUE INDEX index_ChangeTableName_on_lChangeCaseInsensitiveAttribute_and_ChangeAdditionalAttributesIfAny ON ChangeTableName(LOWER(ChangeCaseInsensitiveAttribute), ChangeAdditionalAttributesIfAny);<space><backspace><return><C-d>SQL<space><backspace><return># DeleteThis - move code below to down method (index must be removed in down method)<space><backspace><return>DeleteThis - if a table is created, simply drop table (dropping table will remove index)<space><backspace><return><backspace><backspace>drop_table :ChangeTableName<space><backspace><return># DeleteThis - if tabe was not created, remove index explicitly<space><backspace><return><backspace><backspace>remove_index :ChangeTableName, name: :index_ChangeTableName_on_lower_ChangeCaseInsensitiveAttribute_and_ChangeAdditionalAttributesIfAny<esc>/DeleteThis\\|ChangeCaseInsensitiveAttribute\\|ChangeAdditionalAttributesIfAny\\|ChangeTableName\\|ChangeAttribute<return>
" Db Migration Remove Index
nnoremap <silent> ,dmri aremove_index :ChangeTableName, name: 'ChangeIndexName'<esc>/ChangeTableName\\|ChangeIndexName<return>




"" Db Seeds BAse
"nnoremap <silent> ,dsba a# frozen_string_literal: true<return><backspace><backspace><return>puts 'Loading ChangeApp ChangeFile...'<return><return># Clear used values for all generators<return><backspace><backspace>Faker::UniqueGenerator.clear<return><return># Setup<return><backspace><backspace>account = Core::Account.first<return>dif_account = Core::Account.second<return>user = Core::User.first<return>dif_account_user = dif_account.users.first<return><return># DeleteThis - make sure to add unique to faker if unique names are important<return>Faker::SomeType.unique.some_method<esc>/ChangeApp\\|ChangeFile\\|DeleteThis<return>
"
"" Db Migration Foreign Key
"nnoremap <silent> ,dmfk a{ to_table: :ChangeTableName }<esc>/ChangeTableName<return>
"
"" Db Migration Rename Table
"nnoremap <silent> ,dmrt arename_table :ChangeOldTableName, :ChangeNewTableName<esc>/ChangeOldTableName\\|ChangeNewTableName<return>
"" Db Migration Drop Table
"nnoremap <silent> ,dmdt adrop_table :ChangeTableName<esc>/ChangeTableName<return>
"
"" Db Migration Add Column
"nnoremap <silent> ,dmac aadd_column :ChangeTableName, :ChangeColumn, :ChangeColumnType, ChangeOptions<esc>/ChangeTableName\\|ChangeColumnType\\|ChangeColumn\\|ChangeOptions<return>
"" Db Migration Add Reference
"nnoremap <silent> ,dmar aadd_reference :ChangeTableName, :ChangeColumn, ChangeOptions<esc>/ChangeTableName\\|ChangeColumn\\|ChangeOptions<return>
"" Db Migration Rename  Column
"nnoremap <silent> ,dmrC arename_column :ChangeTableName, :ChangeCurrentColumnName, :ChangeNewColumnName<esc>/ChangeTableName\\|ChangeCurrentColumnName\\|ChangeNewColumnName<return>
"" Db Migration Change Column
"nnoremap <silent> ,dmcc a# DeleteThis - Change migration to Up / Down if not already changed<return>DeleteThis - add change to up method<return>ChangeDescriptionOfChange<return><backspace><backspace>change_column :ChangeTableName, :ChangeColumn, :ChangeColumnType, ChangeOptions<return># DeleteThis - add reversion to down method<return>ChangeDescriptionOfReversion<return><backspace><backspace>change_column :ChangeTableName, :ChangeColumn, :ChangeColumnType, ChangeOptions<esc>/DeleteThis\\|ChangeDescriptionOfChange\\|ChangeDescriptionOfReversion\\|ChangeTableName\\|ChangeColumnType\\|ChangeColumn\\|ChangeOptions<return>
"" Db Migration Remove Column
"nnoremap <silent> ,dmrc aremove_column :ChangeTableName, :ChangeColumn<esc>/ChangeTableName\\|ChangeColumn<return>
"
"" Db Migration Add Index
"nnoremap <silent> ,dmai a# DeleteThis - remove "unique: true," if index does not need to be unique<space><backspace><return><backspace><backspace>add_index :ChangeTableName, %i[ChangeAttributeOrAttributesIfMultiple], unique: true, name: 'index_ChangeTableName_on_ChangeAttributeOrAttributesIfMultiple'<esc>/ChangeTableName\\|ChangeAttributeOrAttributesIfMultiple\\| unique: true,\\|DeleteThis<return>
"" Db Migration Add Index (case insensitive)
"nnoremap <silent> ,dmaI a# DeleteThis - Change migration to Up / Down if not already changed<space><backspace><return>DeleteThis - for unique even when a specific attribute may be nil, and using postgres 15, add NULLS NOT UNIQUE<space><backspace><return>If using 14 or earlier, follow these steps:<space><backspace><return>1) duplicate the existing index<space><backspace><return>2) remove the attribute<space><backspace><return>3) add 'WHERE ChangeAttribute IS NULL' to the end<space><backspace><return>4) update the index name<space><backspace><return><backspace><backspace>execute <<-SQL<space><backspace><return><tab>CREATE UNIQUE INDEX index_ChangeTableName_on_lChangeCaseInsensitiveAttribute_and_ChangeAdditionalAttributesIfAny ON ChangeTableName(LOWER(ChangeCaseInsensitiveAttribute), ChangeAdditionalAttributesIfAny);<space><backspace><return><C-d>SQL<space><backspace><return># DeleteThis - move code below to down method (index must be removed in down method)<space><backspace><return>DeleteThis - if a table is created, simply drop table (dropping table will remove index)<space><backspace><return><backspace><backspace>drop_table :ChangeTableName<space><backspace><return># DeleteThis - if tabe was not created, remove index explicitly<space><backspace><return><backspace><backspace>remove_index :ChangeTableName, name: :index_ChangeTableName_on_lower_ChangeCaseInsensitiveAttribute_and_ChangeAdditionalAttributesIfAny<esc>/DeleteThis\\|ChangeCaseInsensitiveAttribute\\|ChangeAdditionalAttributesIfAny\\|ChangeTableName\\|ChangeAttribute<return>
"
