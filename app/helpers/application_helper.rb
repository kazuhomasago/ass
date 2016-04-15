module ApplicationHelper
  ### エラーメッセージ関連 ###
  # 各エラーメッセージをliで並べる
  def display_error_messages(current_instances)
    return_txt = ''

    current_instances.each do |current_instance|
      errors_order = current_instance.class::ERRORS_ORDER rescue []

      # 画面ごとのエラーメッセージの順番を読み込む
      if errors_order.present?
        sort_full_messages(errors_order, current_instance).each do |full_message|
          return_txt += "<li>#{full_message}</li>"
        end
      else
        current_instance.errors.full_messages.uniq.each do |msg|
          return_txt += "<li>#{msg}</li>"
        end
      end
    end

    return return_txt
  end

  # errors.messagesをfull_messagesの配列に変換
  def sort_full_messages(errors_order, current_instance)
    full_messages = []
    errors_order.each do |field|
      messages = current_instance.errors.messages[field] || []
      new_messages = []

      messages.each do |message|
        # エラーメッセージの先頭にattributeの翻訳を付けたくない場合
        if current_instance.class.const_defined?(:ERROR_NO_ATTRIBUTE_NAME) && current_instance.class::ERROR_NO_ATTRIBUTE_NAME.include?(field)
          new_messages << message
        else
          new_messages << current_instance.class.human_attribute_name(field) + message
        end
      end

      full_messages << new_messages
    end

    return full_messages.flatten.uniq
  end

  # フィールドの横に出すエラーメッセージ
  def side_error_messages(current_instance, field_names)
    # field_names内でかぶってるエラーメッセージは.uniqでまとめる
    error_messages = field_names.map{|field_name| current_instance.errors.full_messages_for(field_name)}.flatten.uniq
    error_messages_text = error_messages.join('<br />')

    if error_messages_text.present?
      return ('<p class="error_massage">' + error_messages_text + '</p>').html_safe
    else
      return ''
    end
  end
  ###  ###

  ### 表示の細かい調整用 ###
  def no_value_to_hyphen(value, unit = '')
    value.present? ? value.to_s + unit : '-'
  end

  # nilでなかったら四捨五入したものを返す
  def h_point_round(num, point)
    if !num.nil?
      if point > 0
        num.point_round(point)
      else
        num.round
      end
    end
  end

  # 追加用のフォームをdataに仕込む
  def link_to_add_fields(name, f, association, args, columns=[], klass=nil)
    association_object = f.object.send(association)
    show_remove_button = association_object.length
    new_object = association_object.klass.new
    id = new_object.object_id

    columns.each do |c|
      new_object.send(:[]=, c, id)
    end

    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + '_fields', m_form: builder, args: args, show_remove_button: show_remove_button)
    end

    submit_tag(name, id: 'addButton', class: "add_fields #{klass}", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
