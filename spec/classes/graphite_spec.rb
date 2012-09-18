require 'spec_helper'

describe 'graphite' do
  let(:facts) {{:concat_basedir => '/var/lib/puppet/concat'}}
  context 'Default' do
    it {
      should contain_package('carbon')
      should contain_package('whisper')
      should contain_package('graphite-web')
      should contain_file('local_settings.py').
        with_content(/#TIME_ZONE = 'America\/Los_Angeles'/).
        with_path('/etc/graphite-web/local_settings.py')
      should contain_concat('/etc/carbon/storage-schemas.conf')
    }
  end

  context 'With local_settings_file =>' do
    let(:pre_condition) {"class{'graphite::params': local_settings_file => '/opt/graphite/webapp/graphite/local_settings.py'}"}
    it {
      should contain_file('local_settings.py').
        with_path('/opt/graphite/webapp/graphite/local_settings.py')
    }
  end 
  context 'with schema_file =>' do
    let(:pre_condition) {"class{'graphite::params': schema_file => '/opt/graphite/conf/storage-schemas.conf'}"}
    it {
      should contain_concat('/opt/graphite/conf/storage-schemas.conf')
    }
  end
  context 'with time_zone =>' do
    let(:pre_condition) {"class{'graphite::params': time_zone => 'America/Chicago'}"}

    it {
      should contain_file('local_settings.py').
        with_content(/TIME_ZONE = 'America\/Chicago/)
    }
  end
end
