import os
import census_tools.db as db

def test_SpatialiteConnection():
    with db.SpatialiteConnection() as in_memory:
        cur = in_memory.execute('select 1;')
        assert cur.fetchall() == [(1,)]

    with db.SpatialiteConnection('/tmp/test.db') as in_file:
        cur = in_file.execute('select 2;')
        assert cur.fetchall() == [(2,)]

    os.remove('/tmp/test.db')
