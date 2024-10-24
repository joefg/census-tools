# notebooks

Keep notebooks in here.

## Imports

To use `census_tools` functions, you'll want to add this to the top of your
local imports:

```python
import os.sys; sys.path.insert(1, os.path.join(os.getcwd()  , '..'))
```

By default, these notebooks are ran from this directory and as such can't see
modules outside of it unless they are in the Pipenv (which the `census_tools`
library isn't).

For now, this adds the parent directory to the path, allowing us to import
`census_tools` normally.

## Cleaning notebooks

Generally speaking: don't commit executed notebooks-- ipython notebooks are a
pig for keeping state in a mess all over the document.

To strip output and state, use `nbconvert`:

```sh
pipenv run jupyter nbconvert --clear-output --inplace notebooks/<path-to-notebook>.ipynb
```

## Common Gotchas

### Joining a DataFrame to a GeoDataFrame

Join the DataFrame to the GeoDataFrame (ie the GeoDataFrame is on the left)--
the other way around loses the spatial properties of the GeoDataFrame.

```python
geo_frame.join(data_frame, on="<common-key>")
```

### Performance issues under JupyterLab

JupyterLab is a bit slow to render Plotly inline JavaScript. If it's a problem
use old Jupyter Notebook.