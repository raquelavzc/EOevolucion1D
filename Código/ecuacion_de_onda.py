import glob
from pathlib import Path
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
from matplotlib.ticker import MaxNLocator

base_dir = Path(__file__).resolve().parent
files = sorted(glob.glob(str(base_dir / "snapshot_*.txt")))

if not files:
    raise FileNotFoundError("No se encontraron archivos snapshot_*.txt en la carpeta del script.")

initial_snapshot = base_dir / "snapshot_0000.txt"
if initial_snapshot.exists():
    run_start_time = initial_snapshot.stat().st_mtime
    files = [
        f for f in files
        if Path(f).stat().st_mtime >= run_start_time - 1.0
    ]

fig, ax = plt.subplots()

data = np.loadtxt(files[0], skiprows=1)
r = data[:, 0]
phi = data[:, 1]

line, = ax.plot(r, phi, lw=2)

ax.set_xlabel("r")
ax.set_ylabel(r"$\phi$")
ax.set_xlim(r.min(), r.max())
ax.xaxis.set_major_locator(MaxNLocator(nbins=9))

phi_max = max(np.max(np.abs(np.loadtxt(f, skiprows=1)[:, 1])) for f in files)
ax.set_ylim(-1.1 * phi_max, 1.1 * phi_max)

def update(i):
    data = np.loadtxt(files[i], skiprows=1)
    line.set_ydata(data[:, 1])
    ax.set_title(f"Evolucion de la onda")
    return line,

ani = FuncAnimation(fig, update, frames=len(files), interval=80, blit=True)

plt.show()
