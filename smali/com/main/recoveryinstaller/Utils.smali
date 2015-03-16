.class public Lcom/main/recoveryinstaller/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field static final TAG:Ljava/lang/String; = "RecoveryInstaller"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static deleteDir(Ljava/io/File;)Z
    .locals 4
    .parameter "dir"

    .prologue
    .line 46
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 47
    invoke-virtual {p0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v0

    .line 48
    .local v0, children:[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v2, v0

    if-lt v1, v2, :cond_1

    .line 54
    .end local v0           #children:[Ljava/lang/String;
    .end local v1           #i:I
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v2

    :goto_1
    return v2

    .line 49
    .restart local v0       #children:[Ljava/lang/String;
    .restart local v1       #i:I
    :cond_1
    new-instance v2, Ljava/io/File;

    aget-object v3, v0, v1

    invoke-direct {v2, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/main/recoveryinstaller/Utils;->deleteDir(Ljava/io/File;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 50
    const/4 v2, 0x0

    goto :goto_1

    .line 48
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static execute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .parameter "shell"
    .parameter "command"

    .prologue
    .line 59
    const-string v5, ""

    .line 61
    .local v5, result:Ljava/lang/String;
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v3

    .line 62
    .local v3, process:Ljava/lang/Process;
    if-eqz v3, :cond_0

    .line 63
    new-instance v2, Ljava/io/DataOutputStream;

    invoke-virtual {v3}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v6

    invoke-direct {v2, v6}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 64
    .local v2, os:Ljava/io/DataOutputStream;
    new-instance v1, Ljava/io/DataInputStream;

    invoke-virtual {v3}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v1, v6}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 65
    .local v1, is:Ljava/io/DataInputStream;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 66
    invoke-virtual {v2}, Ljava/io/DataOutputStream;->flush()V

    .line 67
    const-string v6, "exit\n"

    invoke-virtual {v2, v6}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 68
    invoke-virtual {v2}, Ljava/io/DataOutputStream;->flush()V

    .line 69
    invoke-virtual {v3}, Ljava/lang/Process;->waitFor()I

    .line 70
    const/4 v4, 0x0

    .line 71
    .local v4, read:Ljava/lang/String;
    :goto_0
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readLine()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1

    .line 83
    .end local v1           #is:Ljava/io/DataInputStream;
    .end local v2           #os:Ljava/io/DataOutputStream;
    .end local v3           #process:Ljava/lang/Process;
    .end local v4           #read:Ljava/lang/String;
    :cond_0
    :goto_1
    return-object v5

    .line 72
    .restart local v1       #is:Ljava/io/DataInputStream;
    .restart local v2       #os:Ljava/io/DataOutputStream;
    .restart local v3       #process:Ljava/lang/Process;
    .restart local v4       #read:Ljava/lang/String;
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 73
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v5

    goto :goto_0

    .line 76
    .end local v1           #is:Ljava/io/DataInputStream;
    .end local v2           #os:Ljava/io/DataOutputStream;
    .end local v3           #process:Ljava/lang/Process;
    .end local v4           #read:Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 78
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 79
    .end local v0           #e:Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 81
    .local v0, e:Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1
.end method

.method public static extraAssetFiles(Landroid/content/Context;Ljava/lang/String;)V
    .locals 13
    .parameter "context"
    .parameter "assetPath"

    .prologue
    const/4 v8, 0x0

    .line 14
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 15
    .local v5, filePath:Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 16
    .local v1, dir:Ljava/io/File;
    invoke-static {v1}, Lcom/main/recoveryinstaller/Utils;->deleteDir(Ljava/io/File;)Z

    .line 17
    invoke-virtual {v1}, Ljava/io/File;->mkdir()Z

    .line 19
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v9

    invoke-virtual {v9, p1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 20
    .local v3, fileList:[Ljava/lang/String;
    array-length v9, v3

    :goto_0
    if-lt v8, v9, :cond_0

    .line 43
    .end local v3           #fileList:[Ljava/lang/String;
    :goto_1
    return-void

    .line 20
    .restart local v3       #fileList:[Ljava/lang/String;
    :cond_0
    aget-object v4, v3, v8
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 21
    .local v4, fileName:Ljava/lang/String;
    const/4 v6, 0x0

    .line 23
    .local v6, inputStream:Ljava/io/InputStream;
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, "/"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v6

    .line 27
    :goto_2
    if-eqz v6, :cond_1

    .line 28
    :try_start_2
    new-instance v7, Ljava/io/FileOutputStream;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v11, "/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v7, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 29
    .local v7, outputStream:Ljava/io/FileOutputStream;
    const/16 v10, 0x1000

    new-array v0, v10, [B

    .line 30
    .local v0, buffer:[B
    :goto_3
    invoke-virtual {v6}, Ljava/io/InputStream;->available()I

    move-result v10

    if-gtz v10, :cond_2

    .line 34
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 35
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V

    .line 20
    .end local v0           #buffer:[B
    .end local v7           #outputStream:Ljava/io/FileOutputStream;
    :cond_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 24
    :catch_0
    move-exception v2

    .line 25
    .local v2, e:Ljava/io/IOException;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v11, "/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {p0, v10}, Lcom/main/recoveryinstaller/Utils;->extraAssetFiles(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 38
    .end local v2           #e:Ljava/io/IOException;
    .end local v3           #fileList:[Ljava/lang/String;
    .end local v4           #fileName:Ljava/lang/String;
    .end local v6           #inputStream:Ljava/io/InputStream;
    :catch_1
    move-exception v2

    .line 40
    .restart local v2       #e:Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 31
    .end local v2           #e:Ljava/io/IOException;
    .restart local v0       #buffer:[B
    .restart local v3       #fileList:[Ljava/lang/String;
    .restart local v4       #fileName:Ljava/lang/String;
    .restart local v6       #inputStream:Ljava/io/InputStream;
    .restart local v7       #outputStream:Ljava/io/FileOutputStream;
    :cond_2
    const/4 v10, 0x0

    const/16 v11, 0x1000

    :try_start_3
    invoke-virtual {v6, v0, v10, v11}, Ljava/io/InputStream;->read([BII)I

    .line 32
    const/4 v10, 0x0

    const/16 v11, 0x1000

    invoke-virtual {v7, v0, v10, v11}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_3
.end method

.method public static isInstalled()Z
    .locals 3

    .prologue
    .line 96
    new-instance v1, Ljava/io/File;

    const-string v2, "/system/xbin/recovery"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 97
    .local v1, recovery:Ljava/io/File;
    new-instance v0, Ljava/io/File;

    const-string v2, "/system/etc/install-recovery.sh"

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 98
    .local v0, installScript:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 99
    const/4 v2, 0x1

    .line 101
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static isRoot()Z
    .locals 4

    .prologue
    .line 87
    const-string v2, "su"

    const-string v3, "id"

    invoke-static {v2, v3}, Lcom/main/recoveryinstaller/Utils;->execute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 88
    .local v0, result:Ljava/lang/String;
    const-string v1, "uid=0(root) gid=0(root)"

    .line 89
    .local v1, rootStr:Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 90
    const/4 v2, 0x1

    .line 92
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method
