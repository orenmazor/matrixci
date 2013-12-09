Dir["./lib/adapters/*.rb"].each {|f| require f}

module MatrixCi
  class Adapter
    def self.[](adaptername)
      adapters = {"circleci" => MatrixCi::CircleCi}

      adapters[adaptername]
    end
  end
end
