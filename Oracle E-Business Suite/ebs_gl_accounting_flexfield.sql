-- GL Accounting  Flexfields
select
    f.application_id,
    f.id_flex_code,
    f.id_flex_name,
    f.application_table_name,
    f.description,
    fs.id_flex_num,
    fs.id_flex_structure_code,
    fse.segment_name,
    fse.segment_num,
    fse.flex_value_set_id
from
    fnd_id_flexs f,
    fnd_id_flex_structures fs,
    fnd_id_flex_segments fse
where f.application_id = fs.application_id
and   f.id_flex_code = fs.id_flex_code
and   fse.application_id = f.application_id
and   fse.id_flex_code = f.id_flex_code
and   fse.id_flex_num = fs.id_flex_num
and   f.id_flex_code like 'GL#'
and   f.id_flex_name like 'Accounting Flexfield';