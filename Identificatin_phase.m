function Estimated_Model = Identificatin_phase (Considered_Data_ident)

Horizon = 20;

Set_of_state  = [1 2 3 4];
Set_of_action = [1 2 3 4];

Cardinality_of_state  =  max(size(Set_of_state));
Cardinality_of_action = max(size(Set_of_action));  


for i = 1 : Cardinality_of_state
    
    for j = 1 : Cardinality_of_action 
        
        for k = 1 : Cardinality_of_state
            
            Sum_i_j   = sum((Considered_Data_ident(:,1)==i & Considered_Data_ident(:,2)==j));
            Sum_i_j_k = sum((Considered_Data_ident(:,1)==i & Considered_Data_ident(:,2)==j) & Considered_Data_ident(:,3)==k);
            
            if Sum_i_j == 0
                
                Estimated_Model{i,j}(k,:) = (1 / Cardinality_of_state) * ones(1,Horizon);

            else
                
                Estimated_Model{i,j}(k,:) = (Sum_i_j_k / Sum_i_j) * ones(1,Horizon);
                
            end
            
        end
        
    end
    
end