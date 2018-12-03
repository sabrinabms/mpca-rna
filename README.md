#
# mpca-rna
#
mpcaANN/
├── annActivation
├── annMPCA
├── Makefile
├── README
├── runMPCA
├── build/
│   └── *.o
├── config/
│   └── annConfig.in
├── data/
│   ├── x.txt
│   ├── x_gen.txt
│   ├── x_valid.txt
│   ├── yd.txt
│   ├── yd_valid.txt
│   └── y_gen.txt
├── output/
│   ├── final.out
│   ├── nn.best
│   ├── nn*.out
│   └── result_ys.out
└── src/
    ├── annActivation.f90
    ├── annTrainning.f90
    ├── foul.f90
    ├── main_activation.f90
    ├── foul.f90
    ├── mpca.f90
    ├── mpcaFunctions.f90
    ├── newTypes.f90
    ├── normalR8.f90 
    ├── uniformR8.f90
    └── normalizacao.py - usada para normalizar os dados (python)



I- Configuring the experiment: ./config/configuration.ini

&CONTENT
 NCLASSES=1126,             Number of patterns
 NCLASSESVALIDATION=0,      Number of patterns cross-validation
 NINPUTS=4,                 Number of inputs
 NOUTPUTS=1,                Number of outputs
 TARGETERROR=1.0E-5,        Minimum value of the objective function (error) (stopping criterium for MPCA)
 NEPOCHS=1000,              Maximum epoch number (stopping criterium for MPCA); 
 LOADWEIGHTSBIAS=1,         Initialization of the weights and bias      [0; 1]
                            0 - Random weights and bias
                            1 - Weights and bias fixed in 0.5
 HAVEVALIDATION=F,          Validation                  [T; F]
                            T - Training with validation
                            F - Training without validation
 TRYINITIALARCHITECTURE=F,  Initial configuration for the topology      [T; F]
                            T - Empirical configuration
                            F - Random configuration
 /
&BOUNDS
 LOWER_HIDDEN_LAYERS=1,         Number of hidden layers (D)         [1; 2]         
 UPPER_HIDDEN_LAYERS=2,
 LOWER_FIRST_HIDDEN_LAYER=5,    Number of neurons in the first hidden layer (D) [1 - 40]
 UPPER_FIRST_HIDDEN_LAYER=25,
 LOWER_SECOND_HIDDEN_LAYER=5,   Number of neurons in the second hidden layer (D)    [1 - 40]
 UPPER_SECOND_HIDDEN_LAYER=25,
 LOWER_ACTIVATION_FUNCTION=1,   Activation function (D)             [(1) log; (2) tang; (3) gauss]
 UPPER_ACTIVATION_FUNCTION=3,
 LOWER_ALPHA=1.0E-2,            Momentum rate - alpha (C)           [0.01 - 0.9]
 UPPER_ALPHA=0.5,
 LOWER_ETA=1.0E-2,              Learning rate - eta (C)             [0.01 - 1]
 UPPER_ETA=1.0,
 /
&INITIAL
 INITIAL_HIDDEN_LAYERS=0,
 INITIAL_FIRST_HIDDEN_LAYER=0,
 INITIAL_SECOND_HIDDEN_LAYER=0,
 INITIAL_ACTIVATION_FUNCTION=0,
 INITIAL_ALPHA=0.0,
 INITIAL_ETA=0.0,
 /
&ALGORITHM_CONFIGURATION
 VALUE_TO_REACH=1.0E-7,
 PARTICLES_PROCESSOR=10,
 MAXIMUM_NFE_MPCA=1000,
 CYCLE_BLACKBOARD_MPCA=400,
 NFE_EXPLOITATION_MPCA=100,
 LOWER_EXPLOITATION_MPCA=0.7,
 UPPER_EXPLOITATION_MPCA= 1.1,
 TYPE_PROBABILITY_MPCA=1,
 ENABLE_OPPOSITION=T,
 TYPE_OPPOSITION="MPCA",
 JUMPING_RATE_OPPOSITION=0.01,
 EPSILON_HOOKE_JEEVES=1.0E-11,
 RHO_HOOKE_JEEVES= 0.8,
 MAXIMUM_NFE_HOOKE_JEEVES=1000,
 VERBOSE=T,


II- How to run the ANN auto-configuration

./runMPCA E P

E: total of trials
P: processor number

Example:
./runMPCA 5 4

