class Field
  include MongoMapper::EmbeddedDocument

  key :name, String, :required => true
  key :prompt, String
  key :required, Boolean, :required => true
  key :input, String, :required => true
  key :uuid,  String
  key :position, Integer  # 排序用
  key :intern, String     # 类保留字段型,如email字段,paypal字段等
  
  many :options
  
  TYPES = [['单行文字', 'string'], ['大段文字', 'text'], 
            ['多选一', 'radio'], ['多选多', 'check'], 
            ['下拉列表', 'drop'], ['日期', 'date']]
  
  def update_options(options)
    return true if options.nil? || !options.is_a?(Array)
    
    self.options.clear
    
    options.each do |value|
      option = Option.new(:value => value)
      self.options << option
      self.save
    end
  end
end
