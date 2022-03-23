FROM trufflesuite/ganache-cli as ganache
RUN mkdir /truffle
WORKDIR /truffle
RUN npm install -g truffle@5.5.4
COPY ./truffle /smart-contracts/truffle
WORKDIR /smart-contracts/truffle
