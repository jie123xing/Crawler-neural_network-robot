package �㷨;

public class �������ظ������� {
    /* ��һ������Ϊ n ����������������ֶ��� 0 �� n-1 �ķ�Χ�ڡ�������ĳЩ�������ظ��ģ�
     ����֪���м����������ظ��ģ�Ҳ��֪��ÿ�������ظ����Ρ����ҳ�����������һ���ظ������֡�

     ����˼·
     Ҫ��ʱ�临�Ӷ� O(N)���ռ临�Ӷ� O(1)����˲���ʹ������ķ�����Ҳ����ʹ�ö���ı�����顣
     ������������Ԫ���� [0, n-1] ��Χ�ڵ����⣬���Խ�ֵΪ i ��Ԫ�ص������� i ��λ���Ͻ�����⡣
     �� (2, 3, 1, 0, 2, 5) Ϊ����������λ�� 4 ʱ����λ���ϵ���Ϊ 2��
     ���ǵ� 2 ��λ�����Ѿ���һ�� 2 ��ֵ�ˣ���˿���֪�� 2 �ظ���
     */
    public static void main(String[] args) {
        int[] nums={5,4,7,6,1,2,3,4};
        int[] duplication={};
        System.out.println(duplicate(nums,nums.length,duplication));
    }

    public static boolean duplicate(int[] nums, int length, int[] duplication) {
        if (length<=0||nums==null){
            return false;
        }
        for(int i=0;i<length;i++){
            while(nums[i]!=i){
                if(nums[i]==nums[nums[i]]){
                    duplication[0]=nums[i];
                    return true;
                }
                swap(nums,i,nums[i]);
            }
        }
        return false;
    }

    public static void swap(int []num,int i,int j){
        int t=num[i];
        num[i]=num[j];
        num[j]=t;
    }
}
