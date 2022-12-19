function [X, Y]=matrix_reg_rna(data_in, data_out, reg)
max_o=max(reg(1),reg(2));punt=max_o+reg(3)+1;Y = [data_out(punt:end)];
for a=1:reg(1)
    X(a,:)=data_out(punt-a:end-a);
end
for b=1:reg(2)
    X(b+reg(1),:)=data_in(punt-reg(3)-b:end-(b+reg(3)));
end
