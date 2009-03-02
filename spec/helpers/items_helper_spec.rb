require File.dirname(__FILE__) + '/../spec_helper'

describe ItemsHelper do
    include ItemsHelper # need this...

    describe 'item table <th> tag ' do
      describe 'class names' do
      %w{name quantity price}.each do |header|
        describe " for '#{header}' column" do

            it "should be sorted up if params[:sort] is '#{header}' "do
              params[:sort] = header
              sort_td_class_helper(header).should =~ /#{header}.*sortup/
            end

            it "should be sorted down if params[:sort] is not '#{header}' " do
              params[:sort] = "#{header}_reverse"
              sort_td_class_helper(header).should =~ /#{header}.*sortdown/
            end

        end
      end
      end

      describe 'content' do
        before do
        end
        %w{name quantity price}.each do |header|
          describe 'returns a link' do

            it 'with a sort arg to reverse the order if the sort param ' +
               "is equal to '#{header}' " do
                params[:sort] = header
                sort_link_helper(header).should have_tag("a.#{header}_reverse")
            end

            it 'with a sort arg to not reverse if the sort param ' +
               "is not equal to '#{header}' " do
               params[:sort] = "#{header}_reverse"
              sort_link_helper(header).should have_tag("a.#{header}")
            end

          end
        end
      end
    end

end
