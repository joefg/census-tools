"""
Database connections.
"""

import os
import sqlite3
from typing import Optional

class SpatialiteConnection():
    """
    Helper class for connecting to Spatialite datastores,
    for use in a with statement.
    """
    def __init__(self, location: Optional[str] = None) -> None:
        if location:
            self.conn = sqlite3.connect(os.path.join(location))
        else:
            self.conn = sqlite3.connect(':memory:')
        self.conn.enable_load_extension(True)
        self.conn.execute('SELECT load_extension("mod_spatialite")')
        self.conn.execute('SELECT InitSpatialMetaData(1);')

    def __enter__(self) -> sqlite3.Connection:
        return self.conn

    def __exit__(self, exc_type, exc_value, exc_traceback) -> None:
        self.conn.close()
