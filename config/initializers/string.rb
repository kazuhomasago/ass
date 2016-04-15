# encoding = utf-8
class String
  require 'nkf'

  FULL_SYMBOLS = ['＼', '￥', '＾', '＠', '［', '；', '：', '］', '，', '．', '／', '＊', '＋', '！', '＄', '％', '＆', '｀', '（', '）', '＝', '～', '｜', '‘', '’', '｛', '｝', '＜', '＞', '？', '＿', '＃', '“', '”']
  HALF_SYMBOLS = ["\\", '¥', '^', '@', '[', ';', ':', ']', ',', '.', '/', '*', '+', '!', '$', '%', '&', '`', '(', ')', '=', '~', '|', ''', ''', '{', '}', '<', '>', '?', '_', '#', '"', '"']

  MYSQL_FORBIDDEN_CHARS = ['\\', '%', '_']
  MYSQL_ESCAPED_CHARS = ['\\\\\\', '\\%', '\\_']

  JP_YEARS = [
    ['1868-09-08', '明治'],
    ['1912-07-30', '大正'],
    ['1926-12-25', '昭和'],
    ['1989-01-08', '平成']
  ]

  def delete_space
    self.gsub(/\s/, '').gsub(/　/, '')
  end

  def delete_space!
    self.gsub!(/\s/, '')
    self.gsub!(/　/, '')
    return self
  end

  def hankana_to_zenkana
    NKF::nkf( '-WwXm0', self )
  end

  def to_bool
    !(self.downcase === 'false' || self === '0' || self === '')
  end

  def n_to_br
    self.gsub(/\r\n|\r|\n/, '<br />')
  end

  def getbytes
    i = 0
    strByte = 0

    while i < self.length
      if self[i].bytesize === 3
        i += 1
        strByte += 2
      else
        i += 1
        strByte += 1
      end
    end

    return strByte
  end

  def to_full
    self.tr('0-9a-zA-Z', '０-９ａ-ｚＡ-Ｚ')
  end

  def to_half
    self.tr('０-９ａ-ｚＡ-Ｚ', '0-9a-zA-Z')
  end

  def to_number_with_commas
    if (self =~ /^\d+\.?\d+$/).blank?
      return self
    end

    target_str = self.remove_leading_zero
    target_str_arr = target_str.split('.')
    integer_part = target_str_arr[0]
    decimal_part = target_str_arr[1]
    reversed_integer_part_arr = integer_part.split('').reverse
    len = reversed_integer_part_arr.length

    reversed_integer_part_arr.each_with_index do |char, i|
      if (i < len - 1 && (i + 1) % 3 === 0)
        reversed_integer_part_arr[i] = ',' + char
      end
    end

    integer_part_with_commas = reversed_integer_part_arr.reverse.join('')

    [integer_part_with_commas, decimal_part].compact.join('.')
  end

  def remove_leading_zero
    self.remove_left_leading_zero.remove_right_leading_zero
  end

  def remove_left_leading_zero
    target_str = self.clone
    re = /^([0]*)([^0].*)$/

    if target_str.match(re).nil?
      return target_str
    end

    target_str.slice!(0, $1.length)

    if target_str[0] === '.'
      target_str = '0' + target_str
    end

    return target_str
  end

  def remove_right_leading_zero
    target_str = self.clone
    re = /^(\d+)\.(\d+)$/

    if target_str.match(re).nil?
      return target_str
    end

    integer_part = $1
    decimal_part = $2
    re = /([0]+)$/

    if decimal_part.match(re).nil?
      return target_str
    end

    decimal_part.slice!(decimal_part.length - $1.length, decimal_part.length)

    if decimal_part === ''
      return integer_part
    else
      return [integer_part, decimal_part].join('.')
    end
  end

  def format_number
    self.tr('０-９', '0-9')
  end

  def format_alphabet
    self.tr('ａ-ｚＡ-Ｚ', 'a-zA-Z')
  end

  def format_hyphen
    self.gsub(/－|‐/, '-')
  end

  def format_symbol
    FULL_SYMBOLS.each_with_index do |fs, i|
      self.gsub!(fs, HALF_SYMBOLS[i])
    end

    return self.format_hyphen
  end

  def mysql_escape
    MYSQL_FORBIDDEN_CHARS.each_with_index do |mfc, i|
      self.gsub!(mfc, MYSQL_ESCAPED_CHARS[i])
    end

    return self
  end

  def get_prefecture_division
    if self.present?
      return self.last
    else
      return ''
    end
  end

  def get_prefecture_name
    if self.present?
      return self.slice(0, self.length - 1)
    else
      return ''
    end
  end

  def year_month_only
    if self.present?
      return self.gsub(/(\d+)日/, '')
    else
      return ''
    end
  end

  def concat_strings_with_n(*str)
    strings_arr = []

    strings_arr << self

    str.each do |s|
      strings_arr << s
    end

    strings_arr.collect{|string| string if string != ''}.compact.join("\n")
  end

  def concat_strings_with_n!(*str)
    new_str = self.concat_strings_with_n(*str)
    self.clear
    self << new_str
    return self
  end

  def display_under_limmit(str_length)
    self.slice(0, str_length)
  end

  def ad_to_jp
    begin
      unix_time = self.to_time.to_i
    rescue Exception => e
      p 'unsupported string >>>>>>>>>>', e
      return self
    end

    if unix_time < JP_YEARS[0][0].to_time.to_i
      p 'The time is before MEIJI'
      return self
    end

    date_arr = self.split("\s")[0].try(:split, '-').to_a

    1.upto(JP_YEARS.length - 1) do |i|
      if unix_time < JP_YEARS[i][0].to_time.to_i
        year_count = date_arr[0].to_i - JP_YEARS[i - 1][0].to_i + 1
        return "#{JP_YEARS[i - 1][1]}#{year_count === 1 ? '元' : year_count}年#{date_arr[1]}月#{date_arr[2]}日"
      end
    end

    first_date = JP_YEARS.last[0]
    first_date_arr = first_date.split('-')
    year_count = date_arr[0].to_i - first_date_arr[0].to_i + 1
    return "#{JP_YEARS.last[1]}#{year_count === 1 ? '元' : year_count}年#{date_arr[1]}月#{date_arr[2]}日"
  end

  def remove_comma
    self.gsub(',', '')
  end
end
