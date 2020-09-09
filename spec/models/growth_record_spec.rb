describe GrowthRecord do
  describe 'uniqueness バリデーション' do
    let(:params) do
      {
        age: 0,
        age_of_the_moon: 1,
        height: 55,
        weight: 32
      }
    end
    before { GrowthRecord.create(params) }

    it '同じ年齢・月齢作成時にエラーが発生する' do
      expect(GrowthRecord.new(params).valid?).to be_falsy
    end

    it '異なる月齢のときにレコードが作成できる' do
      new_params = params
      new_params[:age_of_the_moon] = 2

      expect(GrowthRecord.new(new_params).valid?).to be_truthy
    end

    it '異なる年齢のときにレコードが作成できる' do
      new_params = params
      new_params[:age] = 1

      expect(GrowthRecord.new(new_params).valid?).to be_truthy
    end

    after { GrowthRecord.destroy_all }
  end
end
