require 'spec_helper'

describe 'graphite::carbon::storage' do
  let (:facts) {{ :concat_basedir => '/var/lib/puppet/concat' }}
  context 'Default' do
    let (:pre_condition) {'include graphite'}
    let (:title) {'graphite-default'}
    let (:params) {{
      :pattern    => '.*',
      :retentions => '60s:1d'
    }}

    it {
      should contain_concat__fragment('graphite-default').with(
        'target'  => '/etc/carbon/storage-schemas.conf',
        'content' => /\[graphite-default\]\s+pattern = \.\*\s+retentions = 60s:1d/m
      )
    }
  end
  context 'with schema_file =>' do
    let (:pre_condition) {"class {'graphite::params': schema_file => '/storage-schemas.conf'}\ninclude graphite"}
    let (:title) {'graphite-default'}
    let (:params) {{
      :pattern    => '.*',
      :retentions => '60s:1d'
    }}

    it {
      should contain_concat__fragment('graphite-default').with(
        'target'  => '/storage-schemas.conf',
        'content' => /\[graphite-default\]\s+pattern = \.\*\s+retentions = 60s:1d/m
      )
    }
  end
end
