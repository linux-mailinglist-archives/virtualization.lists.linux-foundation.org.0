Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B54FA19C4A1
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 16:46:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6299B87238;
	Thu,  2 Apr 2020 14:46:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YYR49Lt8uYNS; Thu,  2 Apr 2020 14:46:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E4AE987179;
	Thu,  2 Apr 2020 14:46:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4B7FC07FF;
	Thu,  2 Apr 2020 14:46:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06009C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E96CD8806F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vPtEHKZJfrbe
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:46:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 54D5488077
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585838801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=247fWnWaIxGLXiVh3d5vG20xrpndo7qpcBC/YB6ZW/8=;
 b=hNLZRZMoh/KlmXmn2eLYhAFPwdJQeUBxRGJkoJjt7RBW4GrkcQL2foIwL5Nyynufi2Fhec
 YYkkQBW/6+NXlIfKjX88YH+ql3/c7vFcV/pvUoU1jCyGp/cq8pR8lvTkbovw7b0l3PAUzs
 g26rDWpDJENlqcECLXaEUJzx6hQ51sM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-LjSAg2mZPpeUihQ_HFdDDw-1; Thu, 02 Apr 2020 10:46:39 -0400
X-MC-Unique: LjSAg2mZPpeUihQ_HFdDDw-1
Received: by mail-qt1-f197.google.com with SMTP id x10so3333213qts.14
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Apr 2020 07:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=247fWnWaIxGLXiVh3d5vG20xrpndo7qpcBC/YB6ZW/8=;
 b=WlxEFq3v6uMeUa9w5CLpkZzgxA3Jc4sy/9YLFDk8DOs+IW1cujvHEQFmalC5rJMUOz
 5dPuKgcw0sIvNwi8Oxim+OQhWthYWFbO5CVGeo5cnnu0qANWZw6pffDw69blP2TuEkb7
 OQ7C5ZcKAe06ZNZqdfzk3W351Xl6vWmhEgatmnlWBODkNAw8qBhPLsjxrNAYuQH76uCE
 YRIoDypwkZMyG+0PKvkoHd9q027NEAcvhRuw7fSChvu53vexHh4eG07taKNew2RwY/ZO
 uMXtTJv2rpcmyp8CELTu0+vntuy3pFcdWMRk2JyHpOAxz62Ue1Bikrvyjytv7b0Km//j
 Psnw==
X-Gm-Message-State: AGi0PuYzoFGAwrFPhL7YNx6w4zSO0UMUSYkVJOvzO3t7Yx4oVb5SPOCI
 Gfx1Pf62f3XiKhTnm9tiyG8j/zxAF1a5tAsCuHBHeM/xotngAOtzIikYAHQYikQSiEO/6ABsm0H
 njfkUdmC+0DvVYoBp/qnmOkJt8RraWYM2w5xFkgvfMQ==
X-Received: by 2002:ae9:dd83:: with SMTP id r125mr3878509qkf.105.1585838799304; 
 Thu, 02 Apr 2020 07:46:39 -0700 (PDT)
X-Google-Smtp-Source: APiQypJrCvrYOfccOPc0wjpUe4Jhvl0Nl/n0u9FB6DDdrO18srx7Gu82PDrBByu2qXM5kAyNldGtag==
X-Received: by 2002:ae9:dd83:: with SMTP id r125mr3878453qkf.105.1585838798775; 
 Thu, 02 Apr 2020 07:46:38 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id p9sm3672571qtu.3.2020.04.02.07.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 07:46:37 -0700 (PDT)
Date: Thu, 2 Apr 2020 10:46:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] vhost: drop vring dependency on iotlb
Message-ID: <20200402144519.34194-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

vringh can now be built without IOTLB.
Select IOTLB directly where it's used.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Applies on top of my vhost tree.
Changes from v1:
	VDPA_SIM needs VHOST_IOTLB

 drivers/vdpa/Kconfig  | 1 +
 drivers/vhost/Kconfig | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
index 7db1460104b7..08b615f2da39 100644
--- a/drivers/vdpa/Kconfig
+++ b/drivers/vdpa/Kconfig
@@ -17,6 +17,7 @@ config VDPA_SIM
 	depends on RUNTIME_TESTING_MENU
 	select VDPA
 	select VHOST_RING
+	select VHOST_IOTLB
 	default n
 	help
 	  vDPA networking device simulator which loop TX traffic back
diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
index f0404ce255d1..cb6b17323eb2 100644
--- a/drivers/vhost/Kconfig
+++ b/drivers/vhost/Kconfig
@@ -8,7 +8,6 @@ config VHOST_IOTLB
 
 config VHOST_RING
 	tristate
-	select VHOST_IOTLB
 	help
 	  This option is selected by any driver which needs to access
 	  the host side of a virtio ring.
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
