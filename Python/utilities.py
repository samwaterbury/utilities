"""Contains a variety of Python code that I reuse often or find interesting.

Author: Sam Waterbury
GitHub: https://github.com/samwaterbury
"""

import json
import os
import pathlib
import sys

from contextlib import contextmanager
from typing import Iterator, Union

import pandas as pd

from scipy.sparse import spmatrix
from tqdm import tqdm


@contextmanager
def cd(path: Union[str, pathlib.Path]) -> Iterator[None]:
    """Context manager for temporarily working in a different directory."""
    prev_path = os.getcwd()
    os.chdir(path)
    try:
        yield
    finally:
        os.chdir(prev_path)


def identify_mixed_dtypes(df: pd.DataFrame) -> list:
    """Identifies columns of a DataFrame containing mixed types.

    Args:
        df: DataFrame.

    Returns:
        Array of the names of columns containing mixed dtypes.
    """
    return df.columns[df.applymap(type).nunique().gt(1)].to_list()


def json_to_dataframe(json_path: Union[str, pathlib.Path]) -> pd.DataFrame:
    """Converts a file containing rows of JSON objects to a DataFrame.

    Args:
        json_path: Filepath of the JSON data.

    Returns:
        DataFrame containing the keys of the JSON objects as features.
    """
    with open(json_path, mode='r') as f:
        content = [json.loads(line) for line in tqdm(f)]
    return pd.DataFrame(content)


@contextmanager
def silence() -> None:
    """Context to silence the output of anything in its scope.

    This context can be used as follows:
    ```
    >>> with silence():
    >>>     print(dissenting_opinions)
    ```
    All output is discarded and the existing sys.stdout is restored on exit.
    """
    stdout = sys.stdout
    sys.stdout = open(os.devnull, 'w')
    try:
        yield
    finally:
        sys.stdout.close()
        sys.stdout = stdout


def sparse_memory_usage(mat: spmatrix) -> int:
    """Calculates the memory usage of a Scipy sparse matrix.

    Args:
        mat: A Scipy sparse matrix object.

    Returns:
        Integer number of bytes representing the memory usage of the matrix.
    """
    nbytes = 0
    if hasattr(mat, 'data'):
        nbytes += mat.data.nbytes
    if hasattr(mat, 'indptr'):
        nbytes += mat.indptr.nbytes
    if hasattr(mat, 'indices'):
        nbytes += mat.indices.nbytes
    return nbytes
