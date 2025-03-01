function gt=gaussinaSignal(t,tau,td)

gt=exp(-((t-td)/tau).^2);
