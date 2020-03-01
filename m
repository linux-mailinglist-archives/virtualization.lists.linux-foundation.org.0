Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 458DC174DA7
	for <lists.virtualization@lfdr.de>; Sun,  1 Mar 2020 15:33:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A32578788D;
	Sun,  1 Mar 2020 14:33:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BIOSdkT07oYB; Sun,  1 Mar 2020 14:33:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9CABD8782E;
	Sun,  1 Mar 2020 14:33:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CA02C013E;
	Sun,  1 Mar 2020 14:33:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2B6EC013E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 14:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B001620365
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 14:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Umx8FjTWnizU
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 14:33:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 4113720013
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 14:33:10 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r7so9226960wro.2
 for <virtualization@lists.linux-foundation.org>;
 Sun, 01 Mar 2020 06:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=HtofGd4kToXQ+7hP6afMC/zniJHqraZJ2UCvihc7Z5g=;
 b=B/fT3fVokUh7pBXtAfdkJ19LtYzf9ubc4q9ekSdBwzHdPi7ORgmw4lAH4fo2L1OnW9
 eKco266285xxfB2ruqo2fqTYiIeZbT4kcZ/QvbqWDvfwmSkPFsbjDlLqDJ6WmoLI+q5w
 7NhoWo1bTWeaSCjCyVDVtKOrjjdp4vkuWRYgEUMj7XFrmItH69CPjwVEby9+t7CZD0pp
 WFJckq28RneNlzHSbV2phVqfObKZ03+YWAtCyTP3cCDja3E53+8OWQUyVI+lmiZ2h85N
 ILYBJ9IAxfzsq02Cz8a51EljWBBLPMkbldCXc1VTpC16Lh+Ckhs/wUx7kXSTQtc3hj9H
 Sjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HtofGd4kToXQ+7hP6afMC/zniJHqraZJ2UCvihc7Z5g=;
 b=kMgwOhhU6BrC6RsRtEdJ1PB5tdXybnQZmjfdHCDq0i+jkw1KmJ6xLJrE2m7nSTsSdf
 c1xlcVduVikhxGK214yik49Nhv1J+gWqYMAHDUtW36VjbhMC6cOpJWY3pS9ouUYBYkHO
 yHYh4j+0eHMMFYLmnmbYrBrLQ6RCFnTRE8Ub83vvuBL8JqiIsX+4g+7Mn/pas/qaJxxh
 +Kfdsw4dgMYcls7CeoZAE6XVMTX2h3BJYuAymuIY0OVKAs7ADHsIpHRdmu8ARBFa1W9/
 EYH+4ESNNy8b/Z1l+O9EgKp59r1fMx98vIs5WKiduHl/DfpzPB+ISnWOTLbts2VniWMo
 LS/Q==
X-Gm-Message-State: APjAAAXN/joSzXTatLdVdBDy/nRIbPL1ejt7FzSphUJS261Mf//pXmax
 JuXGIKLqvNakVUXa9BTnzkpzCQ==
X-Google-Smtp-Source: APXvYqw5YSvUliTyulbl5gq9KLJISDZM/NrbWMGqG+5tngtPZw5UPPomyCVnbwEy0I7UFlE0eioHcA==
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr16348178wrk.407.1583073188777; 
 Sun, 01 Mar 2020 06:33:08 -0800 (PST)
Received: from f2.redhat.com (bzq-79-177-42-131.red.bezeqint.net.
 [79.177.42.131])
 by smtp.gmail.com with ESMTPSA id l4sm23617241wrv.22.2020.03.01.06.33.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 01 Mar 2020 06:33:08 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] virtio-net: introduce features defined in the spec
Date: Sun,  1 Mar 2020 16:32:59 +0200
Message-Id: <20200301143302.8556-1-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
Cc: yan@daynix.com, virtio-dev@lists.oasis-open.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This series introduce virtio-net features VIRTIO_NET_F_RSC_EXT,
VIRTIO_NET_F_RSS and VIRTIO_NET_F_HASH_REPORT.

Changes from v2: reformatted structure in patch 1

Yuri Benditovich (3):
  virtio-net: Introduce extended RSC feature
  virtio-net: Introduce RSS receive steering feature
  virtio-net: Introduce hash report feature

 include/uapi/linux/virtio_net.h | 100 ++++++++++++++++++++++++++++++--
 1 file changed, 96 insertions(+), 4 deletions(-)

-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
