function [final_im] = new_method(image,kernel_dim)
    H = size(image,1); 
    W = size(image,2); 
    extras = ((kernel_dim - 1)/2);
    J = padarray(image,[extras extras],'replicate','both');
    final_im = image;
 
    for i = 1:H
        for j = 1:W
            
            values = zeros(kernel_dim,kernel_dim);

            for k = 1:kernel_dim
                for l = 1:kernel_dim
                    
                    values(k,l) = J(k + i - 1,j + l - 1);

                end
            end
            %---------------------------------here is the magic:
            
            the_val = mean(quantile(values(:),[0.47 0.53]));

            %---------------------------------
            final_im(i,j) = the_val;
        end
    end
end 