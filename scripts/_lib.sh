TOP="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

UNAME=$(uname)
case ${UNAME} in
  Darwin)
    OS_NAME="darwin-x86_64"
    ;;
  Linux)
    OS_NAME="linux-x86_64"
    ;;
  *)
    echo "Unknown uname: ${UNAME}."
    exit 1
esac

builddir() {
    local tool=$1
    echo "${TOP}/_build/${tool}/${OS_NAME}"
}

prebuiltdir() {
    local tool=$1
    echo "${TOP}/${tool}/${OS_NAME}"
}
