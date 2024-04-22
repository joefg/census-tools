import os
import census_tools.db as db

def test_SpatialiteConnection():
    with db.SpatialiteConnection() as in_memory:
        cur = in_memory.execute('select 1 as "test";')
        ret = cur.fetchall()
        assert ret == [{'test': 1}]

    with db.SpatialiteConnection('/tmp/test.db') as in_file:
        cur = in_file.execute('select 2 as "test";')
        ret = cur.fetchall()
        assert ret == [{'test': 2}]

    assert os.path.isfile('/tmp/test.db')
    os.remove('/tmp/test.db')
