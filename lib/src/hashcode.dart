import 'dart:math' as math;

class _NoParameter {
  const _NoParameter();
}

const _NoParameter _noParameter = _NoParameter();

class HashCode {
  static const int _prime1 = 2654435761;
  static const int _prime2 = 2246822519;
  static const int _prime3 = 3266489917;
  static const int _prime4 = 668265263;
  static const int _prime5 = 374761393;

  static int s_seed = new math.Random.secure().nextInt((1 << 32) - 1);

  static int combine(Object value1, Object value2,
      [Object value3 = _noParameter,
      Object value4 = _noParameter,
      Object value5 = _noParameter,
      Object value6 = _noParameter,
      Object value7 = _noParameter,
      Object value8 = _noParameter]) {
    if (value4 != _noParameter) {
      int v1 = s_seed + _prime1 + _prime2;
      int v2 = s_seed + _prime2;
      int v3 = s_seed;
      int v4 = s_seed - _prime1;

      v1 = round(v1, (value1?.hashCode ?? 0));
      v2 = round(v2, (value2?.hashCode ?? 0));
      v3 = round(v3, (value3?.hashCode ?? 0));
      v4 = round(v4, (value4?.hashCode ?? 0));

      int hash = 16;

      if (value8 != _noParameter) {
        hash = 32;
        v1 = round(v1, (value5?.hashCode ?? 0));
        v2 = round(v2, (value6?.hashCode ?? 0));
        v3 = round(v3, (value7?.hashCode ?? 0));
        v4 = round(v4, (value8?.hashCode ?? 0));
        hash += mixState(v1, v2, v3, v4);
        return mixFinal(hash);
      } else {
        hash += mixState(v1, v2, v3, v4);
        if (value5 != _noParameter) {
          hash += 4;
          hash = queueRound(hash, (value5?.hashCode ?? 0));
          if (value6 != _noParameter) {
            hash += 4;
            hash = queueRound(hash, (value6?.hashCode ?? 0));
            if (value7 != _noParameter) {
              hash += 4;
              hash = queueRound(hash, (value7?.hashCode ?? 0));
            }
          }
        }

        return mixFinal(hash);
      }
    }

    int hc1 = (value1?.hashCode ?? 0);
    int hc2 = (value2?.hashCode ?? 0);
    int hash = s_seed + _prime5 + 8;

    hash = queueRound(hash, hc1);
    hash = queueRound(hash, hc2);
    if (value3 != _noParameter) {
      hash += 4;
      hash = queueRound(hash, (value3?.hashCode ?? 0));
    }

    return mixFinal(hash);
  }

  /*static int combineList(Iterable<Object> arguments) {
    return 0;
  }*/

  static int round(int hash, int input) =>
      rotateLeft(hash + input + _prime2, 13) * _prime1;

  static int queueRound(int hash, int input) =>
      rotateLeft(hash + input + _prime3, 17) * _prime4;

  static int rotateLeft(int value, int offset) =>
      (value << offset) | (value >> (32 - offset));

  static int mixState(int v1, int v2, int v3, int v4) =>
      rotateLeft(v1, 1) +
      rotateLeft(v2, 7) +
      rotateLeft(v3, 12) +
      rotateLeft(v4, 18);

  static int mixFinal(int hash) {
    hash ^= hash >> 15;
    hash *= _prime2;
    hash ^= hash >> 13;
    hash *= _prime3;
    hash ^= hash >> 16;
    return hash;
  }
}
