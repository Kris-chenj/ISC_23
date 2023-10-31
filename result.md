bridges2

CP `-np 128 --map-by ppr:16:socket:PE=4 --bind-to core` 54.50s CPU 58.65s WALL

Base: `-np 512` 2m2.01s WALL

Supercell `-np 256 --map-by ppr:32:socket:PE=2 --bind-to core`  15m 9.58s CPU  15m28.15s WALL

The 32PPN result is near but 64PPN on supercell is normally faster.

Base: `-np 512` 24m20.65s WALL



Openmp with mpi have negative effect on 4 tried situation(1:2; 1:4; 1:8; 1:16).



fau

CP `-np 72 --map-by ppr:18:socket:PE=2 --bind-to core` 2m25s WALL 

(Near to single node run `N=1 -np 64` 2m34s)

Base: `-np 256` 3m42s WALL

Supercell `-np 72 --map-by ppr:18:socket:PE=2 --bind-to core`21m52.53s WALL

Base:`-np 256` 27m38.69s WALL



Using all 36 cores on a socket rather than 32 cores is faster.

Havn't tried openmp with mpi on fau.

