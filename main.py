import sys
import os
from radiant.compiler import server

sys.path.append(os.path.join(os.path.dirname(__file__)))
server.main('project', ip='localhost', port=5000)