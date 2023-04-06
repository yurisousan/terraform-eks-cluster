resource "kubernetes_service_account" "eks_Controller_sa" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.eks_controller_role.arn
    }
  }
}
