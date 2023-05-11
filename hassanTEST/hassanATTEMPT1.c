/*
  This is hassan's first attempt at using p4est. I'm working from the 
  example/steps/p4est_steps3 script. Pretty much exclusively adapted from
  there.
*/

// Only 2D, therefore only using p4 instead of p8 things 
//  (compared to step3)
#include <p4est_vtk.h>
#include <p4est_bits.h>
#include <p4est_extended.h>
#include <p4est_iterate.h>
#include <p4est_io.h>
#include <p4est_communication.h>
#include <sc_options.h>

#define P4EST_DATA_FILE_EXT "p4d" // file extension
#define STEP3_BLOCK_SIZE (sizeof(step3_ctx_t)) // bytes??


// Data stored for each quadrant
typedef struct data
{
  double              u;             /**< the state variable */
  double              du[P4EST_DIM]; /**< the spatial derivatives */
  double              dudt;          /**< the time derivative */
}
data_t;


// Data for advection problem and timestepping.
//  more or less outside of the p4est functionality?
typedef struct ctx
{
  double              center[P4EST_DIM];  /**< coordinates of the center of
                                               the initial condition Gaussian
                                               bump */
  double              bump_width;         /**< width of the initial condition
                                               Gaussian bump */
  double              max_err;            /**< maximum allowed global
                                               interpolation error */
  double              v[P4EST_DIM];       /**< the advection velocity */
  int                 refine_period;      /**< the number of time steps
                                               between mesh refinement */
  int                 repartition_period; /**< the number of time steps
                                               between repartitioning */
  int                 write_period;       /**< the number of time steps
                                               between writing vtk files */
  double              current_time;       /**< the current time */
  int                 time_step;          /**< current time step
                                               counted from the first start. */
}
ctx_t;



 