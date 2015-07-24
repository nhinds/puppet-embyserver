require 'spec_helper'
describe 'embyserver' do

  context 'with defaults for all parameters' do
    it { should contain_class('embyserver') }
  end
end
