clc


Horizon = 10;

Set_of_state  = [1 2 3 4];
Set_of_action = [1 2 3 4];

Size_init_data =  50;
Size_evaluation_data = 1500;
Number_Iteration = 1000;

R_LLFPD = zeros(Number_Iteration,Size_evaluation_data);
R_FPD   = zeros(Number_Iteration,Size_evaluation_data);

for k_k = 1:Number_Iteration

Data       = zeros(3,(Size_init_data + Size_evaluation_data));
Data_FPD   = zeros(3,(Size_init_data + Size_evaluation_data));
Data_LLFPD = zeros(3,(Size_init_data + Size_evaluation_data));    

Cardinality_of_state  =  max(size(Set_of_state));
Cardinality_of_action = max(size(Set_of_action));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Sequence_of_model{1,1,1} = [0.10 ; 0.70 ; 0.10 ; 0.10] * ones(1,Horizon);
Sequence_of_model{2,1,1} = [0.70 ; 0.10 ; 0.10 ; 0.10] * ones(1,Horizon);
Sequence_of_model{3,1,1} = [0.40 ; 0.20 ; 0.10 ; 0.30] * ones(1,Horizon);
Sequence_of_model{4,1,1} = [0.20 ; 0.20 ; 0.50 ; 0.10] * ones(1,Horizon);

Sequence_of_model{1,1,2} = [0.30 ; 0.20 ; 0.40 ; 0.10] * ones(1,Horizon);
Sequence_of_model{2,1,2} = [0.20 ; 0.40 ; 0.20 ; 0.20] * ones(1,Horizon);
Sequence_of_model{3,1,2} = [0.20 ; 0.20 ; 0.30 ; 0.30] * ones(1,Horizon);
Sequence_of_model{4,1,2} = [0.10 ; 0.30 ; 0.40 ; 0.20] * ones(1,Horizon);

Sequence_of_model{1,1,3} = [0.20 ; 0.10 ; 0.20 ; 0.50] * ones(1,Horizon);
Sequence_of_model{2,1,3} = [0.20 ; 0.20 ; 0.20 ; 0.40] * ones(1,Horizon);
Sequence_of_model{3,1,3} = [0.20 ; 0.10 ; 0.10 ; 0.60] * ones(1,Horizon);
Sequence_of_model{4,1,3} = [0.10 ; 0.10 ; 0.10 ; 0.70] * ones(1,Horizon);

Sequence_of_model{1,1,4} = [0.10 ; 0.50 ; 0.20 ; 0.20] * ones(1,Horizon);
Sequence_of_model{2,1,4} = [0.20 ; 0.50 ; 0.20 ; 0.10] * ones(1,Horizon);
Sequence_of_model{3,1,4} = [0.30 ; 0.20 ; 0.10 ; 0.40] * ones(1,Horizon);
Sequence_of_model{4,1,4} = [0.10 ; 0.10 ; 0.50 ; 0.30] * ones(1,Horizon);

Sequence_of_model{1,2,1} = [0.80 ; 0.10 ; 0.05 ; 0.05] * ones(1,Horizon);
Sequence_of_model{2,2,1} = [0.20 ; 0.20 ; 0.30 ; 0.30] * ones(1,Horizon);
Sequence_of_model{3,2,1} = [0.10 ; 0.10 ; 0.10 ; 0.70] * ones(1,Horizon);
Sequence_of_model{4,2,1} = [0.20 ; 0.30 ; 0.20 ; 0.30] * ones(1,Horizon);

Sequence_of_model{1,2,2} = [0.40 ; 0.40 ; 0.10 ; 0.10] * ones(1,Horizon);
Sequence_of_model{2,2,2} = [0.60 ; 0.20 ; 0.10 ; 0.10] * ones(1,Horizon);
Sequence_of_model{3,2,2} = [0.20 ; 0.20 ; 0.30 ; 0.30] * ones(1,Horizon);
Sequence_of_model{4,2,2} = [0.10 ; 0.20 ; 0.40 ; 0.30] * ones(1,Horizon);

Sequence_of_model{1,2,3} = [0.10 ; 0.20 ; 0.30 ; 0.40] * ones(1,Horizon);
Sequence_of_model{2,2,3} = [0.20 ; 0.10 ; 0.10 ; 0.60] * ones(1,Horizon);
Sequence_of_model{3,2,3} = [0.40 ; 0.40 ; 0.15 ; 0.05] * ones(1,Horizon);
Sequence_of_model{4,2,3} = [0.50 ; 0.20 ; 0.10 ; 0.20] * ones(1,Horizon);

Sequence_of_model{1,2,4} = [0.10 ; 0.20 ; 0.10 ; 0.60] * ones(1,Horizon);
Sequence_of_model{2,2,4} = [0.10 ; 0.10 ; 0.60 ; 0.20] * ones(1,Horizon);
Sequence_of_model{3,2,4} = [0.20 ; 0.10 ; 0.60 ; 0.10] * ones(1,Horizon);
Sequence_of_model{4,2,4} = [0.30 ; 0.10 ; 0.10 ; 0.50] * ones(1,Horizon);

Sequence_of_model{1,3,1} = [0.40 ; 0.20 ; 0.10 ; 0.30] * ones(1,Horizon);
Sequence_of_model{2,3,1} = [0.40 ; 0.10 ; 0.10 ; 0.40] * ones(1,Horizon);
Sequence_of_model{3,3,1} = [0.20 ; 0.10 ; 0.50 ; 0.20] * ones(1,Horizon);
Sequence_of_model{4,3,1} = [0.10 ; 0.20 ; 0.40 ; 0.30] * ones(1,Horizon);

Sequence_of_model{1,3,2} = [0.20 ; 0.70 ; 0.05 ; 0.05] * ones(1,Horizon);
Sequence_of_model{2,3,2} = [0.10 ; 0.80 ; 0.05 ; 0.05] * ones(1,Horizon);
Sequence_of_model{3,3,2} = [0.10 ; 0.20 ; 0.40 ; 0.30] * ones(1,Horizon);
Sequence_of_model{4,3,2} = [0.10 ; 0.20 ; 0.20 ; 0.50] * ones(1,Horizon);

Sequence_of_model{1,3,3} = [0.10 ; 0.70 ; 0.10 ; 0.10] * ones(1,Horizon);
Sequence_of_model{2,3,3} = [0.30 ; 0.30 ; 0.10 ; 0.30] * ones(1,Horizon);
Sequence_of_model{3,3,3} = [0.20 ; 0.20 ; 0.30 ; 0.30] * ones(1,Horizon);
Sequence_of_model{4,3,3} = [0.10 ; 0.10 ; 0.50 ; 0.30] * ones(1,Horizon);

Sequence_of_model{1,3,4} = [0.20 ; 0.20 ; 0.30 ; 0.30] * ones(1,Horizon);
Sequence_of_model{2,3,4} = [0.20 ; 0.10 ; 0.40 ; 0.30] * ones(1,Horizon);
Sequence_of_model{3,3,4} = [0.10 ; 0.10 ; 0.50 ; 0.30] * ones(1,Horizon);
Sequence_of_model{4,3,4} = [0.20 ; 0.20 ; 0.50 ; 0.10] * ones(1,Horizon);

Sequence_of_model{1,4,1} = [0.10 ; 0.70 ; 0.10 ; 0.10] * ones(1,Horizon);
Sequence_of_model{2,4,1} = [0.10 ; 0.10 ; 0.10 ; 0.70] * ones(1,Horizon);
Sequence_of_model{3,4,1} = [0.10 ; 0.10 ; 0.70 ; 0.10] * ones(1,Horizon);
Sequence_of_model{4,4,1} = [0.30 ; 0.30 ; 0.20 ; 0.20] * ones(1,Horizon);

Sequence_of_model{1,4,2} = [0.20 ; 0.20 ; 0.10 ; 0.50] * ones(1,Horizon);
Sequence_of_model{2,4,2} = [0.10 ; 0.20 ; 0.10 ; 0.60] * ones(1,Horizon);
Sequence_of_model{3,4,2} = [0.10 ; 0.10 ; 0.10 ; 0.70] * ones(1,Horizon);
Sequence_of_model{4,4,2} = [0.40 ; 0.20 ; 0.20 ; 0.20] * ones(1,Horizon);

Sequence_of_model{1,4,3} = [0.60 ; 0.20 ; 0.10 ; 0.10] * ones(1,Horizon);
Sequence_of_model{2,4,3} = [0.10 ; 0.40 ; 0.20 ; 0.30] * ones(1,Horizon);
Sequence_of_model{3,4,3} = [0.20 ; 0.20 ; 0.20 ; 0.40] * ones(1,Horizon);
Sequence_of_model{4,4,3} = [0.10 ; 0.10 ; 0.40 ; 0.40] * ones(1,Horizon);

Sequence_of_model{1,4,4} = [0.50 ; 0.10 ; 0.10 ; 0.30] * ones(1,Horizon);
Sequence_of_model{2,4,4} = [0.10 ; 0.30 ; 0.40 ; 0.20] * ones(1,Horizon);
Sequence_of_model{3,4,4} = [0.10 ; 0.20 ; 0.50 ; 0.20] * ones(1,Horizon);
Sequence_of_model{4,4,4} = [0.10 ; 0.20 ; 0.50 ; 0.20] * ones(1,Horizon);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Sequence_of_ideal_model{1,1} = [0.97 ; 0.01 ; 0.01 ; 0.01] * ones(1,Horizon);
Sequence_of_ideal_model{1,2} = [0.97 ; 0.01 ; 0.01 ; 0.01] * ones(1,Horizon);
Sequence_of_ideal_model{1,3} = [0.97 ; 0.01 ; 0.01 ; 0.01] * ones(1,Horizon);
Sequence_of_ideal_model{1,4} = [0.97 ; 0.01 ; 0.01 ; 0.01] * ones(1,Horizon);
Sequence_of_ideal_model{2,1} = [0.97 ; 0.01 ; 0.01 ; 0.01] * ones(1,Horizon);
Sequence_of_ideal_model{2,2} = [0.97 ; 0.01 ; 0.01 ; 0.01] * ones(1,Horizon);
Sequence_of_ideal_model{2,3} = [0.97 ; 0.01 ; 0.01 ; 0.01] * ones(1,Horizon);
Sequence_of_ideal_model{2,4} = [0.97 ; 0.01 ; 0.01 ; 0.01] * ones(1,Horizon);
Sequence_of_ideal_model{3,1} = [0.97 ; 0.01 ; 0.01 ; 0.01] * ones(1,Horizon);
Sequence_of_ideal_model{3,2} = [0.97 ; 0.01 ; 0.01 ; 0.01] * ones(1,Horizon);
Sequence_of_ideal_model{3,3} = [0.97 ; 0.01 ; 0.01 ; 0.01] * ones(1,Horizon);
Sequence_of_ideal_model{3,4} = [0.97 ; 0.01 ; 0.01 ; 0.01] * ones(1,Horizon);
Sequence_of_ideal_model{4,1} = [0.97 ; 0.01 ; 0.01 ; 0.01] * ones(1,Horizon);
Sequence_of_ideal_model{4,2} = [0.97 ; 0.01 ; 0.01 ; 0.01] * ones(1,Horizon);
Sequence_of_ideal_model{4,3} = [0.97 ; 0.01 ; 0.01 ; 0.01] * ones(1,Horizon);
Sequence_of_ideal_model{4,4} = [0.97 ; 0.01 ; 0.01 ; 0.01] * ones(1,Horizon);

Sequence_of_ideal_policy{1}  = [0.25 ; 0.25 ; 0.25 ; 0.25] * ones(1,Horizon);
Sequence_of_ideal_policy{2}  = [0.25 ; 0.25 ; 0.25 ; 0.25] * ones(1,Horizon);    
Sequence_of_ideal_policy{3}  = [0.25 ; 0.25 ; 0.25 ; 0.25] * ones(1,Horizon);
Sequence_of_ideal_policy{4}  = [0.25 ; 0.25 ; 0.25 ; 0.25] * ones(1,Horizon);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pre_state     = min(floor(4 * rand(1,1)) + 1 , 4);
Initial_state = min(floor(4 * rand(1,1)) + 1 , 4);

old_state = Initial_state;

for h = 1 : Size_init_data
            
    p_action = rand(1,1);
        
    Random_method_value_for_action = ones(Cardinality_of_action , 1) / Cardinality_of_action;
        
    if p_action <= Random_method_value_for_action(1)
            
        current_action = 1;
            
    elseif p_action <= sum(Random_method_value_for_action(1:2,1))
            
        current_action = 2;
            
    elseif p_action <= sum(Random_method_value_for_action(1:3,1))
            
        current_action = 3;
            
    else
            
        current_action = 4;
            
    end
               
    p_state = rand(1,1);
    p_value_for_upcoming_state = Sequence_of_model{pre_state, old_state,current_action};
        
    if p_state <= p_value_for_upcoming_state(1)
            
         new_state = 1;
            
    elseif p_state <= sum(p_value_for_upcoming_state(1:2,1))
            
         new_state = 2;  
            
    elseif p_state <= sum(p_value_for_upcoming_state(1:3,1))
            
         new_state = 3;   
                    
    else 
        
         new_state = 4;
            
    end
        
    Data(:,h) = [old_state ; current_action ; new_state]; 
    pre_state = old_state;
    old_state = new_state;
        
end  

Initial_state_evaluation     = old_state;
Pre_Initial_state_evaluation = pre_state;

Reward_LLFPD = 0;

Data_FPD   = Data;
Data_LLFPD = Data;

for h =1 : Size_evaluation_data
        
    Considered_Data_ident = Data_LLFPD(:,1:(Size_init_data + h -1));    
    Estimated_Model = Identificatin_phase (Considered_Data_ident');    

    LL_policy = LLFPD_strategy_with_simple_model (Data_LLFPD(:,1:(Size_init_data + h -1)) , Sequence_of_ideal_policy , Sequence_of_ideal_model , Estimated_Model , Horizon , Set_of_action , Set_of_state , (Horizon - 1) , old_state);
        
    p_action = rand(1,1);
        
    LLFPD_method_value_for_action =  LL_policy;
        
    if p_action <= LLFPD_method_value_for_action(1,1)
            
        current_action = 1;
            
    elseif p_action <= sum(LLFPD_method_value_for_action(1:2,1))
            
        current_action = 2;
            
    elseif p_action <= sum(LLFPD_method_value_for_action(1:3,1))
            
        current_action = 3;
            
    else
            
        current_action = 4;
            
    end
        
    p_state = rand(1,1);
    p_value_for_upcoming_state = Sequence_of_model{pre_state, old_state, current_action};
        
    if p_state <= p_value_for_upcoming_state(1)
            
        new_state = 1;
        Reward_LLFPD = Reward_LLFPD + 1;
            
    elseif p_state <= sum(p_value_for_upcoming_state(1:2,1))
            
         new_state = 2;  
            
    elseif p_state <= sum(p_value_for_upcoming_state(1:3,1))
            
         new_state = 3;           
         
    else 
        
         new_state = 4;
            
    end
    
    
    Data_LLFPD(: , (h + Size_init_data)) = [old_state ; current_action ; new_state];
    pre_state = old_state;
    old_state = new_state;
    R_LLFPD(k_k,h) = Reward_LLFPD;
           
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Reward_FPD = 0;
    
old_state =     Initial_state_evaluation;
pre_state = Pre_Initial_state_evaluation;

for h =1 : Size_evaluation_data
        
    Considered_Data_ident = Data_FPD(:,1:(Size_init_data + h -1));    
    Estimated_Model = Identificatin_phase (Considered_Data_ident');  
    
    Sequence_of_action = FPD_strategy (Sequence_of_ideal_policy , Sequence_of_ideal_model , Estimated_Model  , Horizon , Set_of_action , Set_of_state);

    FPD_policy = Sequence_of_action{old_state}(:,1);
         
    p_action = rand(1,1);
        
    FPD_method_value_for_action =  FPD_policy;
        
    if p_action <= FPD_method_value_for_action(1,1)
            
        current_action = 1;
            
    elseif p_action <= sum(FPD_method_value_for_action(1:2,1))
            
        current_action = 2;
            
    elseif p_action <= sum(FPD_method_value_for_action(1:3,1))
            
        current_action = 3;
            
    else
            
        current_action = 4;
            
    end
        
    p_state = rand(1,1);
    p_value_for_upcoming_state = Sequence_of_model{pre_state, old_state, current_action};
        
    if p_state <= p_value_for_upcoming_state(1)
            
        new_state = 1;
        Reward_FPD = Reward_FPD + 1;
            
    elseif p_state <= sum(p_value_for_upcoming_state(1:2,1))
            
         new_state = 2;  
            
    elseif p_state <= sum(p_value_for_upcoming_state(1:3,1))
            
         new_state = 3;        
         
    else 
        
         new_state = 4;
            
    end
    
    Data_FPD(: , (h + Size_init_data)) = [old_state ; current_action ; new_state];  
    pre_state = old_state;
    old_state = new_state;
    R_FPD(k_k,h) = Reward_FPD;
            
end
end