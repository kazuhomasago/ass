# encoding = utf-8
class Array
  # 引数の配列(self)にnilがあればnilを、
  # nilがなければラムダ式(expr)を適用させた結果を返す。
  def nil_lambda(expr)
    if self.include?(nil)
      nil
    else
      expr[self]
    end
  end
end

