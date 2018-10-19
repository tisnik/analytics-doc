if [[ -z "${ASCIIDOCTOR}" ]]
then
    echo "Please define the environment variable ASCIIDOCTOR"
    exit 1
fi

MASTER=index

${ASCIIDOCTOR} -a toc -r asciidoctor-diagram ${MASTER}.adoc

GUIDES="architecture_guide deployment_guide developers_guide rest_api_guide user_guide"

for guide in $GUIDES
do
    echo "Building ${guide}"
    pushd ${guide}
    ${ASCIIDOCTOR} -a toc -r asciidoctor-diagram ${MASTER}.adoc
    popd
done

