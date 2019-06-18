FROM debian:buster
RUN apt update && apt install -y curl python3 python3-pip bash-completion vim lsb-release jq git bsdmainutils && \
	rm -Rf /var/cache/apt/*
RUN pip install ansible --upgrade
RUN curl https://sdk.cloud.google.com | bash && \
	echo "source /root/google-cloud-sdk/completion.bash.inc\nsource /root/google-cloud-sdk/path.bash.inc" >> ~/.bashrc && \
	/root/google-cloud-sdk/bin/gcloud components install kubectl --quiet
RUN curl -L https://git.io/get_helm.sh | bash
WORKDIR /project
CMD /bin/bash
