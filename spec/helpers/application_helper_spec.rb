require 'rails_helper'

describe ApplicationHelper do
  it '#page_title' do
    expect(helper.page_title).to eq I18n.t('page_title.test')
  end

  it '#document_title' do
    expect(helper.document_title).to eq "#{I18n.t('page_title.test')} / #{I18n.t('site_name')}"
  end

  it '#carousel_active_class' do
    expect(helper.carousel_active_class(0)).to eq 'active'
    expect(helper.carousel_active_class(1)).to eq 'stub'
  end
end
