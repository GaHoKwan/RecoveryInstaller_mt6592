.class public Lcom/main/recoveryinstaller/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field static final TAG:Ljava/lang/String; = "RecoveryInstaller"


# instance fields
.field private mInstall:Landroid/widget/Button;

.field private mRecovery:Landroid/widget/Button;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .parameter "v"

    .prologue
    const/4 v4, 0x0

    .line 33
    invoke-static {}, Lcom/main/recoveryinstaller/Utils;->isRoot()Z

    move-result v2

    if-nez v2, :cond_1

    .line 34
    const v2, 0x7f050004

    invoke-static {p0, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 49
    :cond_0
    :goto_0
    return-void

    .line 37
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    const/high16 v3, 0x7f07

    if-ne v2, v3, :cond_2

    .line 38
    const-string v2, "recovery"

    invoke-static {p0, v2}, Lcom/main/recoveryinstaller/Utils;->extraAssetFiles(Landroid/content/Context;Ljava/lang/String;)V

    .line 39
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/main/recoveryinstaller/MainActivity;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/recovery/install.sh"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 40
    .local v0, installScript:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "chmod 755 "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 41
    .local v1, setPermCmd:Ljava/lang/String;
    const-string v2, "su"

    invoke-static {v2, v1}, Lcom/main/recoveryinstaller/Utils;->execute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 42
    const-string v2, "su"

    invoke-static {v2, v0}, Lcom/main/recoveryinstaller/Utils;->execute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 43
    iget-object v2, p0, Lcom/main/recoveryinstaller/MainActivity;->mRecovery:Landroid/widget/Button;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 44
    const v2, 0x7f050003

    invoke-static {p0, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 45
    .end local v0           #installScript:Ljava/lang/String;
    .end local v1           #setPermCmd:Ljava/lang/String;
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    const v3, 0x7f070001

    if-ne v2, v3, :cond_0

    .line 46
    const-string v2, "su"

    const-string v3, "busybox touch /cache/recovery/command"

    invoke-static {v2, v3}, Lcom/main/recoveryinstaller/Utils;->execute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 47
    const-string v2, "su"

    const-string v3, "reboot recovery"

    invoke-static {v2, v3}, Lcom/main/recoveryinstaller/Utils;->execute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 19
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 20
    const/high16 v0, 0x7f03

    invoke-virtual {p0, v0}, Lcom/main/recoveryinstaller/MainActivity;->setContentView(I)V

    .line 21
    const/high16 v0, 0x7f07

    invoke-virtual {p0, v0}, Lcom/main/recoveryinstaller/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/main/recoveryinstaller/MainActivity;->mInstall:Landroid/widget/Button;

    .line 22
    iget-object v0, p0, Lcom/main/recoveryinstaller/MainActivity;->mInstall:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 23
    const v0, 0x7f070001

    invoke-virtual {p0, v0}, Lcom/main/recoveryinstaller/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/main/recoveryinstaller/MainActivity;->mRecovery:Landroid/widget/Button;

    .line 24
    iget-object v0, p0, Lcom/main/recoveryinstaller/MainActivity;->mRecovery:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    invoke-static {}, Lcom/main/recoveryinstaller/Utils;->isInstalled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 26
    iget-object v0, p0, Lcom/main/recoveryinstaller/MainActivity;->mRecovery:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 28
    :cond_0
    return-void
.end method
