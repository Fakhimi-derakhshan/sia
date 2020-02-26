function Sequence_of_action = FPD_strategy (Sequence_of_ideal_policy , Sequence_of_ideal_model , Sequence_of_model , Horizon , Set_of_action , Set_of_state)

Cardinality_of_state  =  max(size(Set_of_state));
Cardinality_of_action = max(size(Set_of_action));

Landa_state = ones(Cardinality_of_state,Horizon);

for i = (Horizon - 1) : -1 : 1
    
    for j = 1:Cardinality_of_state
        
        for l = 1:Cardinality_of_action
            
            Alpha(j,l) =  sum(X_log_X_Y(Sequence_of_model{j,l}(:,i),Sequence_of_ideal_model{j,l}(:,i)));
            Beta(j,l)  = -sum(Sequence_of_model{j,l}(:,i) .* log(Landa_state(:,i+1)));
                
        end
                
        Landa_state(j,i) = exp(-(Alpha(j,:) + Beta(j,:))) * Sequence_of_ideal_policy{j}(:,i);
        Sequence_of_action{j}(:,i) = Sequence_of_ideal_policy{j}(:,i) .* exp(-(Alpha(j,:) + Beta(j,:))') / Landa_state(j,i);
        
    end
    
end                