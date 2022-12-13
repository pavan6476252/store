

#include <bits/stdc++.h>
using namespace std;
// void allSubset(int S[], int n,int z)
// { int flag=0;
//     int subset_size = pow(2, n);
//     int arr[subset_size];
//     for(int i=0;i<subset_size;i++){
//         int k =i;
//         int ans=1;
//        for(int j=0;j<n ;j++){
//             if(k&1<<j) {
//                 ans*=S[j];
//             }
//        }
//        if(ans%z==0){
//         flag =1;
//         break;
//        }
//     }
//     if(flag ==1)cout<<"YES"<<endl;
//     else cout<<"NO"<<endl;
// }
void subsetsUtil(vector<int> &A, vector<vector<int>> &res,
                 vector<int> &subset, int index)
{
    res.push_back(subset);
    // Loop to choose from different elements present
    // after the current index 'index'
    for (int i = index; i < A.size(); i++)
    {

        // include the A[i] in subset.
        subset.push_back(A[i]);

        // move onto the next element.
        subsetsUtil(A, res, subset, i + 1);

        // exclude the A[i] from subset and triggers
        // backtracking.
        subset.pop_back();
    }

    return;
}

// below function returns the subsets of vector A.
vector<vector<int>> subsets(vector<int> &A)
{
    vector<int> subset;
    vector<vector<int>> res;

    // keeps track of current element in vector A
    // and the number of elements present in the array subset
    int index = 0;
    subsetsUtil(A, res, subset, index);

    return res;
}
int main()
{
    int t;
    cin >> t;
    while (t--)
    {
        int n, k;
        cin >> n >> k;
        int flag = 0;
        vector<int> array;

        for (int i = 0; i < n; i++)
        {
            int ab;
            cin >> ab;
            array.push_back(ab);
        }
        for (int i = 0; i < array.size(); i++)
        {
            int ans = 1;
            for (int j = i; j < array.size(); j++)
            {
                // cout<<array[j]<<"";
                ans *= array[j];
                if (ans % k == 0)
                {
                    flag = 1;
                    break;
                }
            }
        }
            if (flag == 1)
            {
                cout << "YES" << endl;
            }
            else
            {
                cout << "NO" << endl;
            }
            // vector<vector<int>> res = subsets(array);
            // // Print result
            // for (int i = 0; i < res.size(); i++)
            // { int ans=1;
            //     for (int j = 0; j < res[i].size(); j++)
            //     ans*=res[i][j];
            //     //     cout << res[i][j] << " ";
            //     // cout << endl;
            //     if(ans%k==0){
            //        flag=1;
            //        break;
            //     }
            // }
            // if(flag==1){
            //     cout<<"YES"<<endl;

            // }else{
            //     cout<<"NO"<<endl;
            // }
        }
        return 1;
    }