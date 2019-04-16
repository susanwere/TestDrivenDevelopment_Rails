# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'products/index', type: :view do
  before(:each) do
    assign(:products, [
             Product.create!(
               title: 'Title',
               description: 'MyText',
               price: '9.99'
             ),
             Product.create!(
               title: 'New Title',
               description: 'MyText',
               price: '9.99'
             )
           ])
  end

  it 'renders a list of products' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 1
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
  end
end
