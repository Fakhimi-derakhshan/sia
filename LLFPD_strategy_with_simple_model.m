function LL_policy = LLFPD_strategy_with_simple_model (Data , Sequence_of_ideal_policy , Sequence_of_ideal_model , Estimated_Model , Horizon , Set_of_action , Set_of_state , Considered_horizen , Considered_state)

Cardinality_of_state  =  max(size(Set_of_state));
Cardinality_of_action = max(size(Set_of_action));

Considered_row = max(size(Data));

Size_C_D = sum(Data(1,1:(Considered_row - Considered_horizen)) == Considered_state);

Considered_Data_state  = zeros(Size_C_D,Considered_horizen);
Considered_Data_action = zeros(Size_C_D,Considered_horizen);

xx = 1;

for i = 1 : (Considered_row - Considered_horizen)
           
    if Data(1,i) == Considered_state
    
        Considered_Data_state(xx,:)  = Data(3,i:(i + Considered_horizen - 1));
        Considered_Data_action(xx,:) = Data(2,i:(i + Considered_horizen - 1));
        xx = xx + 1;
       
    end
    
end

Weight_Sequence = 1;

CR = size(Considered_Data_state);

Previous_state = Considered_state;

if CR(1)==0
       
    for i = 1 : Cardinality_of_state
    
        for j = 2 : Considered_horizen
        
            for k = 1 : Cardinality_of_action
                
                Optimal_policies_closed_our_ideal{i}(k,j) = (1 / Cardinality_of_action);
                
            end
            
        end
        
    end
      
else
    
    for i = 1 : CR(1)
    
        for j = 1 : Considered_horizen
        
            Weight_Sequence = Weight_Sequence * Sequence_of_ideal_policy{Previous_state}(Considered_Data_action(i,j),(Horizon - j));
            Weight_Sequence = Weight_Sequence * Sequence_of_ideal_model{Previous_state,Considered_Data_action(i,j)}(Considered_Data_state(i,j),(Horizon - j));
            Previous_state = Considered_Data_state(i,j);
        
        end
    
        Weight_S(1,i) = (Weight_Sequence);
    
    end
    
    for i = 1 : Cardinality_of_state
    
        for j = 2 : Considered_horizen
        
            for k = 1 : Cardinality_of_action
                
                if (Weight_S * (Considered_Data_state(:,j-1)==i)) == 0
                    
                    Optimal_policies_closed_our_ideal{i}(k,j) = (1 / Cardinality_of_action);
                    
                else
                    
                    Optimal_policies_closed_our_ideal{i}(k,j) = (Weight_S * (Considered_Data_state(:,j-1)==i & Considered_Data_action(:,j)==k)) / (Weight_S * (Considered_Data_state(:,j-1)==i));
                    
                end
                
            end
            
        end
        
    end
      
end

Residual = zeros(1,Cardinality_of_state);

for i = Considered_horizen : -1 : 2
    
   for j = 1 : Cardinality_of_state
            
       for k = 1 : Cardinality_of_action
                
            Alpha_upcoming_state(j,k) = sum(X_log_X_Y(Estimated_Model{j,k}(:,i),Sequence_of_ideal_model{j,k}(:,(Horizon - Considered_horizen - 1 + i))));
            Alpha_upcoming_state(j,k) = Alpha_upcoming_state(j,k) + (Residual * Estimated_Model{j,k}(:,i));
                
        end
            
        Beta_action(j) = sum(X_log_X_Y(Optimal_policies_closed_our_ideal{j}(:,i),Sequence_of_ideal_policy{j}(:,(Horizon - Considered_horizen - 1 + i))));
                
        Residual(1,j) = Beta_action(j) + (Alpha_upcoming_state(j,:) * Optimal_policies_closed_our_ideal{j}(:,i));
                
    end
        
end
    
for l = 1 : Cardinality_of_action
        
    Alpha_upcoming_state(Considered_state,l) = sum(X_log_X_Y(Estimated_Model{Considered_state,l}(:,1),Sequence_of_ideal_model{Considered_state,l}(:,(Horizon - Considered_horizen))));
    Alpha_upcoming_state(Considered_state,l) = Alpha_upcoming_state(Considered_state,l) + (Residual * Estimated_Model{Considered_state,l}(:,1));  
        
    OP_ideal = zeros(4,1);
    OP_ideal(l,1) = 1;
        
    LL_policy_p(l,1) = sum(X_log_X_Y(OP_ideal,Sequence_of_ideal_policy{Considered_state}(:,1))) + Alpha_upcoming_state(Considered_state,l);    
        
end
    
LL_policy_p = exp(-(LL_policy_p));
    
LL_policy = LL_policy_p / sum(LL_policy_p);

    
          