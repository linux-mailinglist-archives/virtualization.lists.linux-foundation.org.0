Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 974DF1BCDA9
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 22:47:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 44BE18688C;
	Tue, 28 Apr 2020 20:47:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F-Z4eenG-f-S; Tue, 28 Apr 2020 20:47:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ACE00868BF;
	Tue, 28 Apr 2020 20:47:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F19AC0864;
	Tue, 28 Apr 2020 20:47:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E968CC0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 20:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B7C1D227E1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 20:47:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NQedsYsYuA5J
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 20:47:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 99ED622773
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 20:47:34 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 18so10168522pfv.8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 13:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+t2oGJ0NM3zmMwMcWJkazZuCWmDBiKJMs/U79fdC35k=;
 b=gDVe89l7F9+G7xW3fjgNRRoMVPd1KR6YffWaRnyC3fkwfKdN9TwX7+Bmbs/9HEee+p
 bXmvP+BTKFmlCsX8tCMa8WY77R9oJa2oe5ZWTKLjPx/o+MsXp3lSBWX8E8d4N0LXld48
 Ggy6xKKRCi2kF3urMW3aud3rQWB/DlOQl4s9lu01R/DLXEdSFqEn72E525AScmQgAhBA
 IS/7qcX+ORJ4WCH2YEt1T7yplAppdWBSLJen24X7XSN60xvEIRymcr7hcZ+cXpiYrHBz
 xKxXUncFvmwWGfKKqZjfCjZvicPf5VAaSMmslmFoBo/IDG6MPAp3xoif5Gphorotu/tW
 86ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+t2oGJ0NM3zmMwMcWJkazZuCWmDBiKJMs/U79fdC35k=;
 b=Mbpg0diXdrMWCfot2N4X0kwhbW1Cc5evgtruC99GxK0FNzfcyMBro9O82SFQfkL0WJ
 UKwwyQcQyFwIEtMn3g+/hRB06tg6fn3/3wahyfPEooNyYVWK3W5k6NF35KpRLUq3d9fA
 2SV7h2om4D6NTBvNnGt4Fqs/HXYh7USDBfCGGbk7cDdAIxUqGbiNUqaBmU0xEeNbDJiC
 GS12HzfYoW6+Z2GD90CC7EYroHGjm7AQq2tNFBuCFHxx5WsXl6Y3A6h4whOn2lzanNcc
 pgWjJuMmAHKv7kAl4cSJ/2zooxHdXTXWdidlYTBstILuT5EphmXF4n/WPuI8ip/SnuVh
 1d/A==
X-Gm-Message-State: AGi0PuZyyIq7wfCek/gdTLPck/E7JjgYh9TElx5xkrxXWSOJCpCPaNBo
 fHDlIFQNc/hAZzpwnsGxFzc=
X-Google-Smtp-Source: APiQypIH0W5CWiftjLFWdUa4aylyGdjCdydvbwq3Sc1t+fzZssUeHLdl/oToYlR/3H2tY3ZHYAQpQg==
X-Received: by 2002:a63:e241:: with SMTP id y1mr28950581pgj.353.1588106853961; 
 Tue, 28 Apr 2020 13:47:33 -0700 (PDT)
Received: from paxos.mtv.corp.google.com
 ([2620:15c:202:201:31a4:f84f:da5f:97b4])
 by smtp.gmail.com with ESMTPSA id r28sm16344629pfg.186.2020.04.28.13.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 13:47:32 -0700 (PDT)
From: Lepton Wu <ytht.net@gmail.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH 0/1] Add uvirtio for testing
Date: Tue, 28 Apr 2020 13:47:28 -0700
Message-Id: <20200428204729.64569-1-ytht.net@gmail.com>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
MIME-Version: 1.0
Cc: Lepton Wu <ytht.net@gmail.com>, mst@redhat.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is a way to create virtio based devices from user space. This is the
background for this patch:

We have some images works fine under qemu, we'd like to also run the same image
on Google Cloud. Currently Google Cloud doesn't support virtio-vga. I had a 
patch to create a virtio-vga from kernel directly:
https://www.spinics.net/lists/dri-devel/msg248573.html

Then I got feedback from Gerd that maybe it's better to change that to something
like uvirtio. Since I really don't have other use cases for now, I just implemented the minimal stuff which work for my use case.

Lepton Wu (1):
  virtio: Add uvirtio driver

 drivers/virtio/Kconfig        |   8 +
 drivers/virtio/Makefile       |   1 +
 drivers/virtio/uvirtio.c      | 405 ++++++++++++++++++++++++++++++++++
 include/linux/uvirtio.h       |   8 +
 include/uapi/linux/uvirtio.h  |  69 ++++++
 samples/uvirtio/Makefile      |   9 +
 samples/uvirtio/uvirtio-vga.c |  63 ++++++
 7 files changed, 563 insertions(+)
 create mode 100644 drivers/virtio/uvirtio.c
 create mode 100644 include/linux/uvirtio.h
 create mode 100644 include/uapi/linux/uvirtio.h
 create mode 100644 samples/uvirtio/Makefile
 create mode 100644 samples/uvirtio/uvirtio-vga.c

-- 
2.26.2.303.gf8c07b1a785-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
