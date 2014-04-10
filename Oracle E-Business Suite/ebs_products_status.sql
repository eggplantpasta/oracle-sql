-- Oracle EBS Products, install and update status.
select
  case nvl(a.application_short_name,'not found')
    when 'SQLAP' then 'AP'
    when 'SQLGL' then 'GL'
    when 'OFA'then 'FA'
    when 'not found' then 'id: '||to_char(pi.application_id)
    else a.application_short_name
  end as application_short_name,
  a.application_name,
  case pi.status
    when 'I' then 'Installed'
    when 'S' then 'Shared'
    when 'N' then 'Inactive'
    else pi.status
  end as status,
  pi.product_version,
  nvl(pi.patch_level,'not available') patchset,
  to_char(pi.last_update_date,'dd-mon-rrrr') last_update_date
from fnd_application_vl a, fnd_product_installations pi
where pi.application_id = a.application_id
order by pi.status, a.application_short_name;