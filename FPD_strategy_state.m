function Sequence_of_action = FPD_strategy_state (Sequence_of_ideal_policy , Sequence_of_ideal_model , Sequence_of_model , Horizon , Set_of_action , Set_of_state, Number_of_state)

Cardinality_of_state  =  max(size(Set_of_state));
Cardinality_of_action = max(size(Set_of_action));

C_S_N_S = Cardinality_of_state^Number_of_state;

Landa_state = ones(Cardinality_of_state,Cardinality_of_state,Horizon);
D_D = ones(1,Number_of_state);

for i = (Horizon - 1) : -1 : 1
    
    for j = 1 : C_S_N_S
        
        D_C = dec2base(j-1,4);
        
        if j<=4
            
        D_D(1)=1;
        D_D(2)=j;
             
        else
            
        for N__s = 1 : Number_of_state
            
            if max(size(D_C)) >= N__s
                
                D_D(N__s) = str2num(D_C(N__s))+1;
                
            else
                
                D_D(N__s) = 1;
                
            end
            
        end
        
        end
        
        for l = 1 : Cardinality_of_action
            
            Alpha(j,l) =  sum(X_log_X_Y(Sequence_of_model{D_D(1),D_D(2),l}(:,i),Sequence_of_ideal_model{D_D(1),D_D(2),l}(:,i)));
            Beta(j,l)  = - log(Landa_state(D_D(2),:,i+1)) * Sequence_of_model{D_D(1),D_D(2),l}(:,i);
                
        end
                
        Landa_state(D_D(1),D_D(2),i) = exp(-(Alpha(j,:) + Beta(j,:))) * Sequence_of_ideal_policy{D_D(1),D_D(2)}(:,i);
        Sequence_of_action{D_D(1),D_D(2)}(:,i) = Sequence_of_ideal_policy{D_D(1),D_D(2)}(:,i) .* exp(-(Alpha(j,:) + Beta(j,:))') / Landa_state(D_D(1),D_D(2),i);
        
    end
    
end