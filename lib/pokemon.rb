

class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id


    def initialize(name:, id:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end


    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon(name, type)
            VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
    end


    def self.find(id_num, db)
        pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
        Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
      end

end