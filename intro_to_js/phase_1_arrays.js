Array.prototype.uniq = function() {
    let uniqueArray = [];
    for(let i = 0; i < this.length; i++){
        var ele = this[i];
        if (uniqueArray.includes(ele)) {
            continue;
        } else {
            uniqueArray.push(ele);
        }
    }
    return uniqueArray;
}

Array.prototype.twoSum = function() {
    let pairs = [];
    let i = 0;

    while (i < this.length) {
        if (this[i]+this[i+1] === 0){
            pairs.push(this[i],this[i+1]);
            i += 2;
        } else {
            i++;
        }
    }

    return pairs;

}
