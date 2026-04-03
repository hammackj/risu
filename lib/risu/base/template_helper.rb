# Copyright (c) 2010-2026 Jacob Hammack.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NON INFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

module Risu
  module Templates
    # Template helper module with various formatting utilities for report generation
    module TemplateHelper
      include HostTemplateHelper
      include MalwareTemplateHelper
      include GraphTemplateHelper
      include SharesTemplateHelper
      include ScanHelper

      # Renders report classification text
      def report_classification(classification = Report.classification.upcase, newline: true)
        @output.font_size(12) do
          @output.text classification, align: :center
          @output.text "\n" if newline
        end
      end

      # Renders report title text
      def report_title(title, newline: false)
        @output.font_size(24) do
          @output.text title, align: :center
          @output.text "\n" if newline
        end
      end

      def report_title_page(title, newline: false)
        @output.font_size(24) do
          @output.text title, align: :left
          @output.text "\n" if newline
        end
      end

      # Renders report subtitle text
      def report_subtitle(title, newline: false)
        @output.font_size(18) do
          @output.text title, align: :center
          @output.text "\n" if newline
        end
      end

      def report_subtitle_page(title, newline: false)
        @output.font_size(18) do
          @output.text title, align: :left
          @output.text "\n" if newline
        end
      end

      # Renders report author text
      def report_author(author, newline: false)
        @output.font_size(14) do
          @output.text author, align: :center
          @output.text "\n" if newline
        end
      end

      def report_author_page(author, newline: false)
        @output.font_size(14) do
          @output.text author, align: :left
          @output.text "\n" if newline
        end
      end

      # Renders text with nil safety
      def text(text, options = {})
        text = '' if text.nil?

        @output.text text, options
      end

      def title(text, size = 18, color = '#000000')
        @output.font_size(size) do
          @output.fill_color color.gsub('#', '')
          @output.text text, style: :bold
          @output.fill_color '000000'
        end

        @output.text "\n"
      end

      def definition(term, text, options = {})
        return if text.nil?

        @output.text "\n#{term}", style: :bold
        @output.text text, options
      end

      def field(term, text, _options = {})
        return if text.nil?

        @output.formatted_text [
          { text: term.to_s, styles: [:bold] },
          { text: text }
        ]
      end

      def bullet_item(point, indent, item, bold: false)
        return if item.nil?

        indent_spacing = Prawn::Text::NBSP.to_s * (indent * 5)
        idented_point = indent_spacing + point

        text_styles = bold ? [:bold] : []

        @output.formatted_text [
          { text: "#{idented_point} ", styles: [:bold] },
          { text: item, styles: text_styles }
        ]
      end

      def bullet_field_item(point, indent, term, item, bold: false)
        return if item.nil?

        indent_spacing = Prawn::Text::NBSP.to_s * (indent * 5)
        idented_point = indent_spacing + point

        if bold
          @output.formatted_text [
            { text: "#{idented_point} ", styles: [:bold] },
            { text: "#{term}: ", styles: [:bold] },
            { text: item, styles: [:bold] }
          ]
        else
          @output.formatted_text [
            { text: "#{idented_point} ", styles: [:bold] },
            { text: "#{term}: ", styles: [:bold] },
            { text: item }
          ]
        end
      end

      def numbered_item(number, indent, item, _options = {})
        return if item.nil?

        indent_spacing = "\t" * indent
        idented_point = indent_spacing + number

        @output.formatted_text [
          { text: "#{idented_point}. ", styles: [:bold] },
          { text: item }
        ]
      end

      def numbered_field_item(number, indent, term, item, _options = {})
        return if item.nil?

        indent_spacing = "\t" * indent
        idented_point = indent_spacing + number

        @output.formatted_text [
          { text: "#{idented_point}. ", styles: [:bold] },
          { text: "#{term}: ", styles: [:bold] },
          { text: item }
        ]
      end

      def page_width
        @output.bounds.width
      end

      # Renders heading level 1
      def heading1(title_text)
        title title_text, 24
      end

      def heading1_with_outline(title_text)
        heading1 title_text

        @output.outline.page({ title: title_text, destination: @page_count })
      end

      # Renders heading level 2
      def heading2(title_text)
        title title_text, 18
      end

      def heading2_with_outline(title_text, section)
        heading2 title_text

        @output.outline.add_subsection_to(section) do
          @output.outline.page(title: title_text, destination: @page_count)
        end
      end

      # Renders heading level 3
      def heading3(title_text)
        title title_text, 14
      end

      # Renders heading level 4
      def heading4(title_text)
        title title_text, 12
      end

      # Renders heading level 5
      def heading5(title_text)
        title title_text, 10
      end

      # Renders heading level 6
      def heading6(title_text)
        @output.font_size(8) do
          @output.text title_text, style: :bold
        end
      end

      # Renders a table with headers and data
      def table(headers, header_widths, data)
        @output.table([headers] + data, header: true, column_widths: header_widths,
                                        row_colors: %w[ffffff E5E5E5]) do
          row(0).style(font_style: :bold, background_color: 'D0D0D0')
          cells.borders = %i[top bottom left right]
        end
      end

      # Starts a new page
      def new_page
        @output.start_new_page
        @page_count += 1
      end

      # Returns count of items by plugin name
      def item_count_by_plugin_name(plugin_name)
        Item.where(plugin_id: Plugin.where(plugin_name: plugin_name).first.id).count
      rescue StandardError
        0
      end

      def item_count_by_plugin_id(plugin_id)
        Item.where(plugin_id: plugin_id).count
      rescue StandardError
        0
      end

      # Returns array of default credential plugin IDs
      def default_credential_plugins
        [
          10_862, 25_927, 32_315, 65_950, 39_364, 33_852, 11_454, 51_369,
          26_918, 76_073, 24_745, 11_245, 23_938, 46_786, 46_789, 10_483,
          81_375, 81_777
        ].uniq
      end

      # Checks if system has default credentials
      def default_credentials?
        plugins = default_credential_plugins
        default_cred = false

        plugins.each do |plugin_id|
          default_cred = true if item_count_by_plugin_id(plugin_id).positive?
        end

        default_cred
      end

      # Renders default credentials section
      def default_credentials_section
        heading1 'Default Credentials'

        text 'Default credentials were discovered on the network. This can cause issues because ' \
                  'the credentials can be found all over the Internet giving anyone with network access ' \
                  'full access to the systems in question.'
        text "\n"
      end

      # Renders default credentials appendix section
      def default_credentials_appendix_section
        return unless default_credentials?

        heading1 'Default Credentials'

        headers = ['Plugin Name', 'IP']
        header_widths = { 0 => (@output.bounds.width - 80), 1 => 80 }
        data = []

        default_credential_plugins.each do |plugin_id|
          next unless item_count_by_plugin_id(plugin_id).positive?

          items = Item.where(plugin_id: plugin_id)

          plugin_name = items.first.plugin_name

          items.each do |item|
            hosts = Host.where(id: item.host_id)

            hosts.each do |host|
              row = []
              row.push plugin_name
              row.push host.ip

              data.push row
            end
          end
        end

        table headers, header_widths, data

        text "\n"
      end
    end
  end
end
