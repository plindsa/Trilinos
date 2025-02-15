# This file contains the options needed to both run the pull request testing
# for Trilinos for the Linux Intel 17 pull request testing builds, and to reproduce
# the errors reported by those builds. Prior to using this this file, the
# appropriate set of SEMS modules must be loaded and accessible through the
# SEMS NFS mount. (See the sems/PullRequestGCC*TestingEnv.sh files.)

# Usage: cmake -C PullRequestLinuxIntel17.0.1TestingSettings.cmake

#Failing tests under C++14
#Remove line if test has been fixed
set (Piro_AnalysisDriver_MPI_4_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (Piro_AnalysisDriverTpetra_MPI_4_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_adapters_epetra_test_sol_EpetraSROMSampleGenerator_MPI_4_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_adapters_minitensor_test_function_test_01_MPI_4_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_adapters_minitensor_test_sol_test_01_MPI_4_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_adapters_teuchos_test_sol_solSROMGenerator_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_example_burgers-control_example_01_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_example_diode-circuit_example_01_MPI_4_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_example_parabolic-control_example_01_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_example_parabolic-control_example_02_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_example_parabolic-control_example_03_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_example_parabolic-control_example_04_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_example_parabolic-control_example_05_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_example_PDE-OPT_0ld_adv-diff-react_example_02_MPI_4_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_example_PDE-OPT_0ld_poisson_example_01_MPI_4_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_example_PDE-OPT_0ld_stoch-adv-diff_example_01_MPI_4_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_example_PDE-OPT_adv-diff-react_example_02_MPI_4_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_example_PDE-OPT_navier-stokes_example_02_MPI_4_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_example_PDE-OPT_nonlinear-elliptic_example_01_MPI_4_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_example_PDE-OPT_nonlinear-elliptic_example_02_MPI_4_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_example_PDE-OPT_obstacle_example_01_MPI_4_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_example_PDE-OPT_topo-opt_poisson_example_01_MPI_4_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_example_poisson-control_example_01_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_example_poisson-control_example_02_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_example_poisson-inversion_example_02_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_example_tensor-opt_example_01_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_NonlinearProblemTest_MPI_4_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_test_algorithm_OptimizationSolverStatusTestInput_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_test_elementwise_BoundConstraint_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_test_function_BinaryConstraintCheck_MPI_4_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_test_function_ExplicitLinearConstraintCheck_MPI_4_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_test_step_AugmentedLagrangianStep_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_test_step_BoxConstrained_LineSearch_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_test_step_BoxConstrained_LM_TrustRegion_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_test_step_BoxConstrained_PrimalDualActiveSet_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_test_step_BoxConstrained_TrustRegion_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_test_step_CubicTest_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_test_step_fletcher_ALLPROBLEMS_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_test_step_fletcher_BOUNDFLETCHER_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_test_step_FletcherStep_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_test_step_interiorpoint_PrimalDualNewtonKrylov_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_test_step_InteriorPointStep_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_test_step_LineSearch_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_test_step_MoreauYosidaPenaltyStep_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_test_step_TrustRegion_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (ROL_tutorial_BoundAndInequality_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")


# Misc options typically added by CI testing mode in TriBITS

# Use the below option only when submitting to the dashboard
#set (CTEST_USE_LAUNCHERS ON CACHE BOOL "Set by default for PR testing")

set (MueLu_UnitTestsEpetra_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (MueLu_UnitTestsEpetra_MPI_4_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")
set (MueLu_UnitTestsTpetra_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")

# (Temporarily) Disable randomly failing ROL test (#3103)
set (ROL_example_poisson-inversion_example_01_MPI_1_DISABLE ON CACHE BOOL "Temporarily disabled in PR testing")

set (SuperLUDist_INCLUDE_DIRS "$ENV{SEMS_SUPERLU_DIST_INCLUDE_PATH}" CACHE PATH "Set by default for PR testing")
set (SuperLUDist_LIBRARY_DIRS "$ENV{SEMS_SUPERLU_DIST_LIBRARY_PATH}" CACHE PATH "Set by default for PR testing")
set (TPL_ENABLE_SuperLUDist ON CACHE BOOL "Set by default for PR testing")

set (TPL_ENABLE_SuperLU OFF CACHE BOOL "Set by default for PR testing")

include("${CMAKE_CURRENT_LIST_DIR}/PullRequestLinuxCommonTestingSettings.cmake")

# These three tests are disabled due to a similar error during testing
# see issue #9077
set (Amesos2_SolverFactory_UnitTests_MPI_4_DISABLE ON CACHE BOOL
  "Temporarily disabled in PR testing")
set (Amesos2_SuperLU_DIST_Solver_Test_MPI_4_DISABLE ON CACHE BOOL
  "Temporarily disabled in PR testing")
set (Stratimikos_test_single_amesos2_tpetra_solver_driver_SuperLU_DIST_MPI_1_DISABLE ON CACHE BOOL
  "Temporarily disabled in PR testing")

# These 3 tests have been holding up a few PRs after the autotester has come back.
# Turning them off so we can get a few PRs merged before we replace Intel 17 with Intel 19.
set (Zoltan_ch_simple_parmetis_parallel_DISABLE ON CACHE BOOL "Disabled in PR testing")
set (Zoltan_ch_simple_scotch_parallel_DISABLE ON CACHE BOOL "Disabled in PR testing")
set (Zoltan_ch_7944_parmetis_parallel_DISABLE ON CACHE BOOL "Disabled in PR testing")

set (Tpetra_INST_INT_INT ON CACHE BOOL "INST_INT_INT ON")
set (Trilinos_ENABLE_STKBalance OFF CACHE BOOL "Hard disabled since Tpetra_INST_INT_INT=ON in this build" FORCE)
#STK-TODO: try to remember to come back and remove this when stk-balance
#is able to tolerate int as a global-index.

set(CMAKE_CXX_FLAGS "-Wall -Warray-bounds -Wchar-subscripts -Wcomment -Wenum-compare -Wformat -Wuninitialized -Wmaybe-uninitialized -Wmain -Wnarrowing -Wnonnull -Wparentheses -Wpointer-sign -Wreorder -Wreturn-type -Wsign-compare -Wsequence-point -Wtrigraphs -Wunused-function -Wunused-but-set-variable -Wunused-variable -Wwrite-strings" CACHE STRING "Warning settings")

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -lifcore -qopenmp" CACHE STRING "updated by Pull Request")

#set (Anasazi_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (Belos_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (Domi_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (Epetra_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (EpetraExt_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (FEI_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (Ifpack_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (Ifpack2_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
set (Intrepid2_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (Kokkos_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (KokkosKernels_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (ML_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (MueLu_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (NOX_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (Panzer_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (Phalanx_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
set (Pike_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (Piro_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (ROL_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (Sacado_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (SEACAS_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (Shards_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (Stokhos_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
set (Tempus_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (Teuchos_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (Tpetra_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (Triutils_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
#set (Zoltan2_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror" CACHE STRING "Warnings as errors setting")
