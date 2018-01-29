FROM eschoute/python3-matplotlib:latest

RUN echo "http://dl-8.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
# RUN apk add openblas-dev
RUN apk --no-cache --update-cache add --virtual scipy-build \
		build-base freetype-dev lapack-dev pkgconfig gfortran libffi-dev openssl-dev
RUN pip install --no-cache-dir qiskit
RUN apk del scipy-build
RUN apk add --no-cache --virtual scipy-runtime \
	freetype libgfortran libgcc libpng libstdc++ musl openblas tcl tk libffi openssl lapack
