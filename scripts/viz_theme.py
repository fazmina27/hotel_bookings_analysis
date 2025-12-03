# ------------------------------------------------------------
# viz_theme.py — Professional Blue-Grey Visualization Template
# ------------------------------------------------------------

import seaborn as sns
import matplotlib.pyplot as plt

def set_viz_theme():
    """
    Apply a consistent professional visualization theme
    across all seaborn/matplotlib plots.
    """

    # Define a custom blue-grey palette (same as heatmap)
    custom_palette = ["#517FA4", "#A9C4D9", "#E8ECEF"]

    # Apply Seaborn theme
    sns.set_theme(style="whitegrid", font_scale=1.0, palette=custom_palette)

    # Matplotlib settings
    plt.rcParams.update({
        "axes.edgecolor": "#E8ECEF",
        "axes.labelcolor": "#333333",
        "xtick.color": "#333333",
        "ytick.color": "#333333",
        "axes.titleweight": "bold",
        "axes.titlepad": 12,
        "axes.labelsize": 11,
        "axes.titlesize": 13,
        "axes.titlelocation": "center",
        "grid.color": "#E8ECEF",
        "grid.alpha": 0.7,
        "figure.figsize": (7, 4),
        "figure.facecolor": "white",
        "savefig.dpi": 120,
        "savefig.bbox": "tight",
    })

    # Return palette (optional)
    return custom_palette
