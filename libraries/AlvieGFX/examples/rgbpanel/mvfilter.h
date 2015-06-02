#ifndef __MVFILTER_H__
#define __MVFILTER_H__

template<typename T, unsigned int size>
class MovingAverageFilter {
public:
    T push(const T value) {
        unsigned i;
        acc=value;
        for (i=0;i<size-1;i++) {
            values[i+1] = values[i];
            acc+=values[i];
        }
        values[0] = value;
        acc/=size;
        return acc;
    }
    T get() { return acc; }
private:
    T values[size];
    T acc;
};

#endif
