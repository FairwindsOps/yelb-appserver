require 'pg'
require 'pg_ext'

def restaurantsdbread(restaurant)
    con = PG.connect :host => $yelbdbhost,
                    :port => $yelbdbport,
                    :dbname => 'yelbdatabase',
                    :user => $yelbdbuser,
                    :password => $yelbdbpassword
    con.prepare('statement1', 'SELECT count FROM restaurants WHERE name =  $1')
    res = con.exec_prepared('statement1', [ restaurant ])
    restaurantcount = res.getvalue(0,0)
    con.close
    return restaurantcount.to_s
end
