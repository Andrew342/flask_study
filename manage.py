#!/usr/bin/env python
import os
from app import  create_app,db
from app.models import User,Role
from flask_script import Manager,Shell
from flask_migrate import Migrate,MigrateCommand

app=create_app(os.getenv('FLASK_CCONFIG') or 'default')
manager=Manager(app)
migrate=Migrate(app,db)


# @app.shell_context_processor
def make_shell_context():
    return dict(app=app,db=db,User=User,Role=Role)
manager.add_command("shell",Shell(make_context=make_shell_context))
manager.add_command("db",MigrateCommand)


@manager.command
def test():
    """Run the unit tests."""
    import unittest
    test_dir="./tests"
    tests = unittest.defaultTestLoader.discover(test_dir,pattern="test*.py")
    unittest.TextTestRunner(verbosity=2).run(tests)


if __name__ == '__main__':
    manager.run()