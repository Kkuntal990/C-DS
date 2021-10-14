#include <iostream>
#include <string>
#include <vector>
using namespace std;
#define sz(x) (int((x).size()))

int DigToNumber(char c)
{
    if (c <= '9' && c >= '0')
        return c - '0';
    return c - 'A' + 10;
}
char NumberToDig(int n)
{
    if (n < 10)
        return '0' + n;
    return n - 10 + 'A';
}

const int base = 1000 * 1000 * 1000;

void mulint(vector<int> &a, int b)
{
    for (int i = 0, carry = 0; i < sz(a) || carry; i++)
    {
        if (i == sz(a))
            a.push_back(0);
        long long cur = carry + a[i] * 1LL * b;
        a[i] = int(cur % base);
        carry = int(cur / base);
    }
    while (sz(a) > 1 && a.back() == 0)
        a.pop_back();
}
int divint(vector<int> &a, int d)
{
    int carry = 0;
    for (int i = sz(a) - 1; i >= 0; i--)
    {
        long long cur = a[i] + carry * 1LL * base;
        a[i] = int(cur / d);
        carry = int(cur % d);
    }
    while (sz(a) > 1 && a.back() == 0)
        a.pop_back();
    return carry;
}
void add(vector<int> &a, vector<int> &b)
{
    for (int i = 0, c = 0, l = max(sz(a), sz(b)); i < l || c; i++)
    {
        if (i == sz(a))
            a.push_back(0);
        a[i] += ((i < sz(b)) ? b[i] : 0) + c;
        c = a[i] >= base;
        if (c)
            a[i] -= base;
    }
}

vector<int> DecToBin(vector<int> &res){
    vector<int> ans;
    while (sz(res) > 1 || res.back() != 0)
        ans.push_back(divint(res, 2));
    if (sz(ans) == 0)
        ans.push_back(0);

    return ans;
}

int main()
{

    ios_base::sync_with_stdio(0);
    cin.tie(0);

    string s;
    cin >> s;
    vector<int> res(1, 0);
    vector<int> m(1, 1);
    vector<int> tmp;
    for (int i = sz(s) - 1; i >= 0; i--)
    {
        tmp.assign(m.begin(), m.end());
        mulint(tmp, DigToNumber(s[i]));
        add(res, tmp);
        mulint(m, 10);
    }
    vector<int> ans;
    ans = DecToBin(res);

    for (int i = sz(ans) - 1; i >= 0; i--)
        cout << NumberToDig(ans[i]);
    cout << "\n";

    return 0;
}