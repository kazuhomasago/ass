# encoding = utf-8
class Numeric
  # 桁数指定の切り上げ
  def point_ceil(point)
    BigDecimal(self.to_s).ceil(point).to_f
  end

  # 桁数指定の四捨五入
  def point_round(point)
    BigDecimal(self.to_s).round(point).to_f
  end

  # 桁数指定の切り捨て
  def point_floor(point)
    BigDecimal(self.to_s).floor(point).to_f
  end
end

