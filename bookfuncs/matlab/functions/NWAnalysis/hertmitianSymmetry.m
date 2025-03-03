function S11sy=hertmitianSymmetry(s11)
if size(s11)
S11sy=[fliplr(conj(s11)),s11(1),s11];
end