#include <stdio.h>
#include <stdlib.h>
#include <math.h>


struct Node{
    int data;
    struct Node* next;
    struct Node* down;
};


struct Node* initialize(int n)
{
    struct Node *head, *temp;
    head = (struct Node *)malloc(sizeof(struct Node));
    temp = head;

    for (int j = 1; j < n; j++)
    {
        temp->next = (struct Node *)malloc(sizeof(struct Node));
        if (j != n - 1)
            temp = temp->next;
    }
    return head;
}

double distance(struct Node* a, struct Node* b){

    int sum = 0;
    struct Node *tmp1, *tmp2;
    tmp1 = a;
    tmp2 = b;
    while(tmp1 != NULL)
    {
        sum += (tmp1->data - tmp2->data) * (tmp1->data - tmp2->data);
        if(tmp1->next) {
            tmp1 = tmp1->next;
        }else{
            break;
        }
        tmp2 = tmp2->next;
    }
    
    return sqrt(sum);
}

int collinearity(struct Node* head, int n, int m){

    struct Node *tmp1, *tmp2, *tmp3;
    tmp1 = head;
    tmp2 = head->down;
    tmp3 = tmp2->down;
    int flag = 1;
    double d1, d2, d3;

    while(1){
        d1 = distance(tmp1, tmp2);
        d2 = distance(tmp2, tmp3);
        d3 = distance(tmp1, tmp3);
        if(d1 == d2 + d3 || d2 == d1 + d3 || d3 == d1 + d2){
            tmp1 = tmp1->down;
            tmp2 = tmp2->down;
            if(tmp3->down){
                tmp3 = tmp3->down;
            }else{
                break;
            }
        }
        else
        {
            flag = 0;
            break;
        }
    }

    return flag;
}

int main(){
    int n, m;

    printf("Please enter number of points \n");
    scanf("%d", &m);
    if (m < 3){
        printf("Please give atleast 3 points \n");
        return 0;
    }
    printf("Please input number of dimensions in the space \n");
    scanf("%d", &n);
    
    struct Node *head, *temp1, *temp2;
    head = initialize(n); // (struct Node*)malloc(sizeof(struct Node));

    // Creating a Matrix formed using Pointers with m-rows and n-columns.
    for (int i = 0; i < m; i++)
    {
        if (i == 0)
        {
            temp1 = head;
            temp2 = temp1;
        }
        else
        {
            temp1->down = initialize(n); // (struct Node*)malloc(sizeof(struct Node));
            temp2 = temp1->down;
            temp1 = temp2;
        }
        for (int j = 0; j < n; j++)
        {
            if (j == n - 1)
            {
                scanf("%d", &temp2->data);
            }
            else
            {
                scanf("%d", &temp2->data);
                // temp2->next = (struct Node*)malloc(sizeof(struct Node));
                temp2 = temp2->next;
            }
        }
    }
    if(collinearity(head, n, m)){
        printf("Points are collinear \n");
    }else{
        printf("points are non-collinear \n");
    }
    // struct Node *a, *b;
    // a = head;
    // b = head->down;

    // printf("%lf", distance(a, b));

    return 0;
}