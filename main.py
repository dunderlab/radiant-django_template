import sys
import os
from radiant.compiler import server

sys.path.append(os.path.join(os.path.dirname(__file__)))
sys.path.append(os.path.join(os.path.dirname(__file__), 'project'))
server.main('project', ip='localhost', port=5000)