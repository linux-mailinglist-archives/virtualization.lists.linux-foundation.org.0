Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD34240624
	for <lists.virtualization@lfdr.de>; Mon, 10 Aug 2020 14:48:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 13AE4890E9;
	Mon, 10 Aug 2020 12:48:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18faO9BDEsNY; Mon, 10 Aug 2020 12:48:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E77FC88FC5;
	Mon, 10 Aug 2020 12:48:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B859AC004D;
	Mon, 10 Aug 2020 12:48:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8BD7C004D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Aug 2020 12:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D2ECF88146
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Aug 2020 12:48:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p8nFNAD9vllG
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Aug 2020 12:48:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 03CAD880E7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Aug 2020 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597063725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=EfpMMW6Vx3J0Luy6MoDr3dSbyKrKFJoHO4ZG8rIQx5M=;
 b=EFoQ/RLdcmbs8b2M76w1Q21DVPU68D10I785T+pF9YWVPgKmO6O7wn0nLoQXX8/jTnNCRB
 0iUp4s9Wcseds9FzqRpBO+lo31eYp1eP8/rQWw6wUe2kW4I4WAhCXy6kcbrjcwfN0Tj6p2
 +UcJR8VPJVaYli37LnttKju7j3DdXvQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-sURuQMX4O9mK-I1xIVBwIw-1; Mon, 10 Aug 2020 08:48:43 -0400
X-MC-Unique: sURuQMX4O9mK-I1xIVBwIw-1
Received: by mail-wm1-f70.google.com with SMTP id a207so2744919wme.9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Aug 2020 05:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=EfpMMW6Vx3J0Luy6MoDr3dSbyKrKFJoHO4ZG8rIQx5M=;
 b=kjI/QFOiHd4sxhC35o6jrHVOVUQGBeqaQLkVdRifqI7IoHofIUcOkQxLrHOFYQ8J9J
 f2EeFUOA/kdI4qqKuSyaS11fNNZ/je/+QbN7p7lHGlz0NK6tcS2OsrPoO2zDtvZO/9d5
 MyFty9sR22ollirVs1pLCN6GloU/zxSBYguvCIOJI4C1h4SkhcdJYeCEWSCFtF7MS3EH
 14NPKI8BOhNWd40rvouMQfRjUudUWw0T43pqmbfblCJCAKexo0YKxxAfibVBlQk/re/I
 vLjIJPZH8Ayo8HzMjwyROEeAeGJesMk+m6HkqR85fbuHxhtIcxnLsShvR+iAGaygAF4j
 8UwA==
X-Gm-Message-State: AOAM530Q2CGcpsLB24vRffvuMOmqjn5NPA+/mK/B2WUz/kz6W7Ne3X7e
 bWSfocFdBCQXVLkFLcExc5AEg8b1czFNpJzHOV/45u9NgaOqsnx5BZFYbe1B/gODaqRHYTPUERc
 BmuA3s1eysaLzL9bfPvELS7IDh4UUPJDR4eywZat0DQ==
X-Received: by 2002:adf:f189:: with SMTP id h9mr1333262wro.122.1597063722441; 
 Mon, 10 Aug 2020 05:48:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQg4tk7pdRNPfnZDpCQdYiSarWXQWMHaUKFpslCi6kVUNoHOoJaD6xWEwdF7c0UDOSuRlE+A==
X-Received: by 2002:adf:f189:: with SMTP id h9mr1333248wro.122.1597063722253; 
 Mon, 10 Aug 2020 05:48:42 -0700 (PDT)
Received: from redhat.com (bzq-109-67-41-16.red.bezeqint.net. [109.67.41.16])
 by smtp.gmail.com with ESMTPSA id
 o2sm22221324wrh.70.2020.08.10.05.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 05:48:41 -0700 (PDT)
Date: Mon, 10 Aug 2020 08:48:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] vdpa_sim: init iommu lock
Message-ID: <20200810124813.1555677-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kernel test robot <rong.a.chen@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org,
 lkp@lists.01.org, Max Gurtovoy <maxg@mellanox.com>
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

The patch adding the iommu lock did not initialize it.
The struct is zero-initialized so this is mostly a problem
when using lockdep.

Reported-by: kernel test robot <rong.a.chen@intel.com>
Cc: Max Gurtovoy <maxg@mellanox.com>
Fixes: 0ea9ee430e74 ("vdpasim: protect concurrent access to iommu iotlb")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index df3224b138ee..604d9d25ca47 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -358,6 +358,7 @@ static struct vdpasim *vdpasim_create(void)
 
 	INIT_WORK(&vdpasim->work, vdpasim_work);
 	spin_lock_init(&vdpasim->lock);
+	spin_lock_init(&vdpasim->iommu_lock);
 
 	dev = &vdpasim->vdpa.dev;
 	dev->coherent_dma_mask = DMA_BIT_MASK(64);
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
