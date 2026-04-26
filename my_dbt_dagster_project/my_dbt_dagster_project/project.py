from pathlib import Path
import os
from dagster_dbt import DbtProject

airbnb_project = DbtProject(
    project_dir=Path(__file__).joinpath("..", "..", "..", "airbnb").resolve(),
    profiles_dir=Path(os.path.expanduser("~/.dbt")),
)
airbnb_project.prepare_if_dev()
